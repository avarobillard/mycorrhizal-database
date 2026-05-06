# Mycorrhizal database
exploring mycorrhizal fungal diveristy among plants in urban desert preserves and surrounding deserts in central Arizona

Author: Ava Robillard

This repository contains code to create a database and explore mycorrhizal fungal diveristy among plants in urban desert preserves and surrounding deserts in central Arizona.

Lab project for EDS 213: Databases and Data Management

<img src="blogimages/infographicfinal.png" width="70%"/>

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

The cleaned data is located within `clean_data`, but the full data can be downloaded from this link: https://portal.edirepository.org/nis/mapbrowse?packageid=knb-lter-cap.562.10 


## References

This assignment was created as a part of EDS 213: Databases & Data Management, taught by Julien Brun and Greg Janée.

Stutz, J. and A. Ontiveros. 2013. Arbuscular mycorrhizal fungal diversity and functioning in urban desert preserves and surrounding deserts in the central Arizona ver 10. Environmental Data Initiative. https://doi.org/10.6073/pasta/b2615dd0ed796e899446e46b75c56643 (Accessed 2026-05-06).
