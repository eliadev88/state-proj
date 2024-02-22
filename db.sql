
-- Create the states table
CREATE TABLE states (
    id SERIAL PRIMARY KEY,
    state VARCHAR(255) NOT NULL,
    population INT NOT NULL,
    counties INT NOT NULL,
    detail VARCHAR(255) NOT NULL
);

-- Create the counties table
CREATE TABLE counties (
    id SERIAL PRIMARY KEY,
    county VARCHAR(255) NOT NULL,
    state_id INT REFERENCES states(id) NOT NULL,
    population INT NOT NULL
);


INSERT INTO states (state, population, counties, detail)
SELECT
    state,
    population,
    counties,
    detail from json_populate_recordset(null::states, 
'[
{
    "state": "Alabama",
    "population": 4833722,
    "counties": 67,
    "detail": "http://localhost:nnn/state/Alabama"
  },
  {
    "state": "Alaska",
    "population": 735132,
    "counties": 29,
    "detail": "http://localhost:nnn/state/Alaska"
  },
  {
    "state": "Arizona",
    "population": 6626624,
    "counties": 15,
    "detail": "http://localhost:nnn/state/Arizona"
  }
  ]');


INSERT INTO counties (county, population, state_id)
SELECT
    county,
    population,
    state_id from json_populate_recordset(null::counties, 
'[
    {
    "state_id": 1,
    "county": "Autauga County",
    "population": 55246
  },
  {
    "state_id": 1,
    "county": "Baldwin County",
    "population": 195540
  },
  {
    "state_id": 1,
    "county": "Barbour County",
    "population": 27076
  },
  {
    "state_id": 1,
    "county": "Bibb County",
    "population": 22512
  },
  {
    "state_id": 1,
    "county": "Blount County",
    "population": 57872
  },
  {
    "state_id": 1,
    "county": "Bullock County",
    "population": 10639
  },
  {
    "state_id": 1,
    "county": "Butler County",
    "population": 20265
  },
  {
    "state_id": 1,
    "county": "Calhoun County",
    "population": 116736
  },
  {
    "state_id": 1,
    "county": "Chambers County",
    "population": 34162
  },
  {
    "state_id": 1,
    "county": "Cherokee County",
    "population": 26203
  },
  {
    "state_id": 1,
    "county": "Chilton County",
    "population": 43951
  },
  {
    "state_id": 1,
    "county": "Choctaw County",
    "population": 13426
  },
  {
    "state_id": 1,
    "county": "Clarke County",
    "population": 25207
  },
  {
    "state_id": 1,
    "county": "Clay County",
    "population": 13486
  },
  {
    "state_id": 1,
    "county": "Cleburne County",
    "population": 14994
  },
  {
    "state_id": 1,
    "county": "Coffee County",
    "population": 50938
  },
  {
    "state_id": 1,
    "county": "Colbert County",
    "population": 54520
  },
  {
    "state_id": 1,
    "county": "Conecuh County",
    "population": 12887
  },
  {
    "state_id": 1,
    "county": "Coosa County",
    "population": 10898
  },
  {
    "state_id": 1,
    "county": "Covington County",
    "population": 37886
  },
  {
    "state_id": 1,
    "county": "Crenshaw County",
    "population": 13986
  },
  {
    "state_id": 1,
    "county": "Cullman County",
    "population": 80811
  },
  {
    "state_id": 1,
    "county": "Dale County",
    "population": 49884
  },
  {
    "state_id": 1,
    "county": "Dallas County",
    "population": 41996
  },
  {
    "state_id": 1,
    "county": "DeKalb County",
    "population": 71013
  },
  {
    "state_id": 1,
    "county": "Elmore County",
    "population": 80902
  },
  {
    "state_id": 1,
    "county": "Escambia County",
    "population": 37983
  },
  {
    "state_id": 1,
    "county": "Etowah County",
    "population": 103931
  },
  {
    "state_id": 1,
    "county": "Fayette County",
    "population": 16909
  },
  {
    "state_id": 1,
    "county": "Franklin County",
    "population": 31532
  },
  {
    "state_id": 1,
    "county": "Geneva County",
    "population": 26727
  },
  {
    "state_id": 1,
    "county": "Greene County",
    "population": 8744
  },
  {
    "state_id": 1,
    "county": "Hale County",
    "population": 15406
  },
  {
    "state_id": 1,
    "county": "Henry County",
    "population": 17296
  },
  {
    "state_id": 1,
    "county": "Houston County",
    "population": 103668
  },
  {
    "state_id": 1,
    "county": "Jackson County",
    "population": 52951
  },
  {
    "state_id": 1,
    "county": "Jefferson County",
    "population": 659479
  },
  {
    "state_id": 1,
    "county": "Lamar County",
    "population": 14236
  },
  {
    "state_id": 1,
    "county": "Lauderdale County",
    "population": 92797
  },
  {
    "state_id": 1,
    "county": "Lawrence County",
    "population": 33587
  },
  {
    "state_id": 1,
    "county": "Lee County",
    "population": 150933
  },
  {
    "state_id": 1,
    "county": "Limestone County",
    "population": 88845
  },
  {
    "state_id": 1,
    "county": "Lowndes County",
    "population": 10703
  },
  {
    "state_id": 1,
    "county": "Macon County",
    "population": 19688
  },
  {
    "state_id": 1,
    "county": "Madison County",
    "population": 346892
  },
  {
    "state_id": 1,
    "county": "Marengo County",
    "population": 20155
  },
  {
    "state_id": 1,
    "county": "Marion County",
    "population": 30334
  },
  {
    "state_id": 1,
    "county": "Marshall County",
    "population": 94760
  },
  {
    "state_id": 1,
    "county": "Mobile County",
    "population": 414079
  },
  {
    "state_id": 1,
    "county": "Monroe County",
    "population": 22236
  },
  {
    "state_id": 1,
    "county": "Montgomery County",
    "population": 226659
  },
  {
    "state_id": 1,
    "county": "Morgan County",
    "population": 119787
  },
  {
    "state_id": 1,
    "county": "Perry County",
    "population": 10020
  },
  {
    "state_id": 1,
    "county": "Pickens County",
    "population": 19401
  },
  {
    "state_id": 1,
    "county": "Pike County",
    "population": 33339
  },
  {
    "state_id": 1,
    "county": "Randolph County",
    "population": 22727
  },
  {
    "state_id": 1,
    "county": "Russell County",
    "population": 59585
  },
  {
    "state_id": 1,
    "county": "Shelby County",
    "population": 204180
  },
  {
    "state_id": 1,
    "county": "St. Clair County",
    "population": 86308
  },
  {
    "state_id": 1,
    "county": "Sumter County",
    "population": 13361
  },
  {
    "state_id": 1,
    "county": "Talladega County",
    "population": 81096
  },
  {
    "state_id": 1,
    "county": "Tallapoosa County",
    "population": 41203
  },
  {
    "state_id": 1,
    "county": "Tuscaloosa County",
    "population": 200821
  },
  {
    "state_id": 1,
    "county": "Walker County",
    "population": 65998
  },
  {
    "state_id": 1,
    "county": "Washington County",
    "population": 16877
  },
  {
    "state_id": 1,
    "county": "Wilcox County",
    "population": 11307
  },
  {
    "state_id": 1,
    "county": "Winston County",
    "population": 24146
  }
  ]');