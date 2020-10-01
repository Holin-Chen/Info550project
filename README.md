# My project
For my project, I will use the public data on <https://github.com/nytimes/covid-19-data> to do all the anaysis. This public gihub repository include daliy updated data files with cumulative counts of coronavirus cases and deaths in the United States, at the state and county level, over time of each date. This project uses this data to conduct some basic COVID-19 data analysis to better understand the outbreak. 

The projecy is run on R 4.0.2. To analyze the data you will need to install some R packages. The required packages can be installed using R commands.

```
installed_pkgs <- row.names(installed.packages())
pkgs <- c("RCurl","dplyr","ggplot2","shadowtext","plotly")
for(p in pkgs){
	if(!(p %in% install_pkgs)){
		install.packages(p)
	}
}
```
Since I use public data on website, I can directly use getURL function from RCurl package to extract the latest updated data to run my code, so there is no raw data file in my github repository.

# Execute the analysis
To execute the analysis, from the project folder you can run

```
Rscript -e "rmarkdown::render('covid report.Rmd')"
```

This will create a file called covid-report.html output in your directory that contains the results.
