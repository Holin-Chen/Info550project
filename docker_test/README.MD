# My project
For my project, I will use the public data on <https://github.com/nytimes/covid-19-data> to do all the anaysis. This public gihub repository include daliy updated data files with cumulative counts of coronavirus cases and deaths in the United States, at the state and county level, over time of each date. This project uses this data to conduct some basic COVID-19 data analysis to better understand the outbreak. 

The projecy is run on R 4.0.2. To analyze the data you will need to install some R packages. The required packages can be installed using R commands.

```
installed_pkgs <- row.names(installed.packages())
pkgs <- c("RCurl","dplyr","ggplot2","shadowtext","plotly")
for(p in pkgs){
	if(!(p %in% installed_pkgs)){
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

# Makefile work
The files of install_package.R, clean_data.R, covid_report.Rmd (not covid-report.Rmd!) are used to execute the Makefile and generate the covid_report.html(not covid-report.html! These two files with "-" are for homework 3). Press "make help" to see the information about Makefile.

# Dockerfile 
Downloading the built Docker image from my DockerHub(holinchen/info550-project) by using the command

```
docker pull holinchen/info550-project:latest
``` 
Then run the built container with `/info550_proj/` folder mounted to a local directory by using the command
```
docker run -it -v ~/Desktop/docker_test:/info550_proj holinchen/info550-project:latest
```
At last, generate the output in the container by using the command
```
root@9e6c4ee9dd55:make -C info550_proj covid_report.html
...
root@9e6c4ee9dd55:exit
```
You will need to change `~/Desktop/docker_test` to the file path to your `docker_test` folder. Once you've exited the container, you should see a `covid_report.html` file in your `docker_test` folder.

