output/covid_report.html: fig/myPlot.png R/covid_report.Rmd
	cd R && Rscript -e "rmarkdown::render('covid_report.Rmd', output_file = '../output/covid_report.html')"


fig/myPlot.png: R/myplot.R clean_data/clean_data.csv
	chmod +x R/myplot.R && \
	Rscript R/myplot.R 


clean_data/clean_data.csv: R/install_package.R R/clean_data.R
	chmod +x R/clean_data.R && \
	Rscript R/clean_data.R


install:
	chmod +x R/install_package.R && \
	Rscript R/install_package.R		

build: Dockerfile
	docker build -t info550-proj .



.PHONY: help
help:
	@echo "covid_report.html : Generate final analysis report."
	@echo "clean_data.csv    : Clean covid data by filter out cases <= 100 for generating plot "
	@echo "myPlot.png        : The plot of development of cumulative cases in every states when they are over 100 cases."
	@echo "build             : Build the docker image that needs to run the container."
