FROM rocker/tidyverse

RUN Rscript -e "install.packages('shadowtext')"
RUN Rscript -e "install.packages('RCurl')"
RUN Rscript -e "install.packages('ggplot2')"
RUN Rscript -e "install.packages('plotly')"
RUN Rscript -e "install.packages('dplyr')"

RUN mkdir /info550_project

COPY ./ /info550_project/

RUN chmod +x /info550_project/R/*.R

RUN make -C info550_project output/covid_report.html

CMD /bin/bash