# Create a database called `mycorrhizal.db` using the command `duckdb mycorrhizal.db` in the terminal at the project root to create these tables within.

##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##                             Create sites table                           ----
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
CREATE TABLE sites (
site_id TEXT PRIMARY KEY,
site_description TEXT,
sampled_on DATE,
latitude REAL NOT NULL CHECK (latitude BETWEEN -90 AND 90),
longitude REAL NOT NULL CHECK (longitude BETWEEN -180 AND 180)
);

**COPY sites** (site_id, site_description, sampled_on, latitude, longitude)

**FROM** 'clean_data/sites_clean.csv'

DELIMITER ','

CSV **HEADER**;

##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##                            Create plants table                           ----
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
CREATE TABLE plants (
plant_id INTEGER PRIMARY KEY,
site_id TEXT NOT NULL REFERENCES sites(site_id),
plant_number INTEGER NOT NULL,
plant_type TEXT NOT NULL,
plant_species TEXT NOT NULL
);

**COPY** plants

**FROM** 'clean_data/plants_clean.csv'

DELIMITER ','

CSV **HEADER**;

##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##                      Create species_occurrences table                    ----
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
CREATE TABLE species_occurrences (
plant_id INTEGER NOT NULL REFERENCES plants(plant_id),
mycorrhiza_species TEXT NOT NULL,
present INTEGER NOT NULL CHECK (present IN (0, 1)),

PRIMARY KEY (plant_id, mycorrhiza_species)
);

**COPY species_occurrences**

**FROM** 'clean_data/species_occurrences_clean.csv'

DELIMITER ','

CSV **HEADER**;

##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##                          Create colonization table                       ----
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
CREATE TABLE colonization (
plant_id INTEGER NOT NULL REFERENCES plants(plant_id),
no_amf INTEGER,
total_amf INTEGER,
hyphae_only INTEGER,
vesicles INTEGER,
arbuscules INTEGER,
coils INTEGER,
arbs_and_coils INTEGER CHECK(arbs_and_coils = arbuscules + coils),
total INTEGER CHECK (total = 100),
dse INTEGER,
other_fungi INTEGER
);

**COPY colonization**

**FROM** 'clean_data/colonization_clean.csv'

DELIMITER ','

CSV **HEADER**;

##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##                                    Query                                 ----
##~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

-- Is mychorrhizal species diversity higher in plants located in urban desert preserve sites or Sonoran desert sites?

-- Join plants and species occurrences tables to associate information about each plant's species diversity with the site. 
-- Filter to only rows where mycorrhizal species are present
-- Group by site description and count the distinct mycorrhizal species in each to understand how many unique species there are in each site

-- Order results in descending order
-- The result contains the site descriptions with a count of total species diversity from all plants in that site.

SELECT site_description, COUNT(DISTINCT mycorrhiza_species) AS diversity FROM sites 
  JOIN plants USING(site_id)
  JOIN species_occurrences USING(plant_id)
  WHERE present = 1
  GROUP BY site_description
  ORDER BY diversity Desc;
  