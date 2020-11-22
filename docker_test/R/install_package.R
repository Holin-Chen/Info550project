#! /usr/local/bin/Rscript
#make install
installed_pkgs <- row.names(installed.packages())
pkgs <- c("RCurl","dplyr","ggplot2","shadowtext","plotly")
for(p in pkgs){
	if(!(p %in% installed_pkgs)){
		install.packages(p)
	}
}

