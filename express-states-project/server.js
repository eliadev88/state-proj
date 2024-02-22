const express = require('express');
const { Pool } = require('pg');
require('dotenv').config();
const cors = require('cors');
const app = express();
const swaggerUi = require('swagger-ui-express');
const swaggerDocument = require('./swagger.json');
app.use(cors());
app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(swaggerDocument));
const port = 3000;

const pool = new Pool({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME,
});

// Route to get all states
app.get('/states', async (req, res) => {
  try {
    const statesQuery = await pool.query('SELECT * FROM states');
    res.json(statesQuery.rows);
  } catch (err) {
    console.error('Error executing query', err);
    res.status(500).send('Internal Server Error');
  }
});

// Route to get details of a specific state by name
app.get('/state/:stateName', async (req, res) => {
  const stateName = req.params.stateName;
  try {
    const stateQuery = await pool.query('SELECT * FROM states WHERE state = $1', [stateName]);
    if (stateQuery.rows.length === 0) {
      res.status(404).send('State not found');
    } else {
      const stateId = stateQuery.rows[0].id;
      const countiesQuery = await pool.query('SELECT * FROM counties WHERE state_id = $1', [stateId]);
      const stateWithCounties = {
        ...stateQuery.rows[0],
        counties: countiesQuery.rows
      };
      res.json(stateWithCounties);
    }
  } catch (err) {
    console.error('Error executing query', err);
    res.status(500).send('Internal Server Error');
  }
});

app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});
