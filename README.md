# Mycorrhizal database
exploring mycorrhizal fungal diveristy among plants in urban desert preserves and surrounding deserts in central Arizona

Author: Ava Robillard

This repository contains code to create a database and explore mycorrhizal fungal diversity among plants in urban desert preserves and surrounding deserts in central Arizona.

Mycorrhizal fungi are key for desert plants as they form a symbiotic relationship and help them absorb moisture and nutrients from an arid soil. 

<img src="images/mushrooms.png" width="70%"/>

## Repository Structure

```         
mycorrhizal-database                  
.
├── clean_data                           # Cleaned data- output of data cleaning script
│  ├── colonization_clean.csv
│  ├── plants_clean.csv
│  ├── sites_clean.csv
│  └── species_occurrences_clean.csv
├── data                                 # Raw data- input of data cleaning script
│ └── knb-lter-cap.562.10
├── datacleaning.qmd                     # Data cleaning script
├── diversityqueries.sql                 # Query 
├── mycorrhizal-database.Rproj
├── mycorrhizal.db                       # database
├── README.md         
├── requirements.txt                     # R dependencies
└── visualization.qmd                    # Data analysis and visualization
```

## Data

The cleaned data used for the analysis and visualization is located within `clean_data`.  The full data can be downloaded from this link: https://portal.edirepository.org/nis/mapbrowse?packageid=knb-lter-cap.562.10 and placed within a `data` folder at the project root as described by the repository structure diagram if you would like to run the data cleaning script on your own as well.

## References

This assignment was created as a part of EDS 213: Databases & Data Management, taught by Julien Brun and Greg Janée.

Stutz, J. and A. Ontiveros. 2013. Arbuscular mycorrhizal fungal diversity and functioning in urban desert preserves and surrounding deserts in the central Arizona ver 10. Environmental Data Initiative. https://doi.org/10.6073/pasta/b2615dd0ed796e899446e46b75c56643 (Accessed 2026-05-06).

README image: Mycorrhizal Mushrooms. Photo 2018 © Robin Kobaly 
