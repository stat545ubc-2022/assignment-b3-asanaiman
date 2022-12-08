# assignment-b3-asanaiman

# What is this project?
This is a repository for assignment B3 of STATS 545B. This assignment consisted of either making a brand new shiny app or building off a shiny app we made in class. The options were as follows:
 - Option A: Add three features to an already-existing BC Liquor shiny app OR
 - Option B: Create your own shiny app with three features, and deploy it.
 
For this assingment I chose **Option B** creating my own shiny app.

# Shiny App Description
This repository contains a shiny app called bcsp (in the bc_school_programs folder) which is an application that displays a table of the programs offered in British Columbia schools from the academic years 2005/2006 to 2013/2014. The dataset was obtained from the British Columbia data catalogue. 
- Link to dataset:https://catalogue.data.gov.bc.ca/dataset/bc-schools-programs-offered-in-schools
This app allows for easy filtering through the school districts and acadmic years to better understand the programs that were offered by different school in B.C.
- Link to original app: https://aimanpour.shinyapps.io/bc_school_programs/
- Link to updated app: https://aimanpour.shinyapps.io/bc_school_programs_updated/

# Description of the files in the assignment-b3-asanaiman repository
1. README.md: his file that explains the components of this repository as well as its purpose.
2. bc_school_programs: This folder contains the shiny app R document and the csv. The components of the folder are as follows:
- bcsp_app.R: This R file contains the code of the bcsp shiny app.
- ProgramsOfferedinSchools.csv: This is the dataset that was used to create the bcsp_app.R file and shiny app.

# How to run the code present in this folder:
* To open the bcsp_app.R file, open a new project in R studio, select version control, select GIT, and copy this repository's URL into the given box. From there you should be able to open the document, edit it, run the code and push the edits onto the repository. In order for this to work your Rstudio needs to be linked to your GIT. 
