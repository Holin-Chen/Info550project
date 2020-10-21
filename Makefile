covid_report.html: clean_data.txt myPlot.png covid_report.Rmd
	Rscript -e "rmarkdown::render('covid_report.Rmd', output_file = 'covid_report.html')"


myPlot.png: myplot.R clean_data.csv
	chmod +x myplot.R && \
	Rscript myplot.R 


clean_data.csv: install_package.R clean_data.R
	chmod +x clean_data.R && \
	Rscript clean_data.R


install:
	chmod +x install_package.R && \
	Rscript install_package.R		


.PHONY: help
help:
	@echo "covid_report.html : Generate final analysis report."
	@echo "clean_data.csv    : Clean covid data by filter out cases <= 100 for generating plot "
	@echo "myPlot.png        : The plot of development of cumulative cases in every states when they are over 100 cases."
