#! /usr/local/bin/Rscript
#make figure
library(ggplot2)
library(shadowtext)
library(dplyr)

aa <- read.csv("clean_data.csv", header = TRUE)

breaks = c(100,200,500,1000,2000,5000,10000,20000,50000,100000,200000,500000,1000000)

p <- ggplot(aa, aes(days_since_100, cases, color = state)) +
  geom_line(size = 0.8) +
  geom_point(pch = 21, size = 1) +
  scale_y_log10(expand = expansion(add = c(0,0.1)),
                breaks = breaks, labels = breaks) +
  scale_x_continuous(expand = expansion(add = c(0,1))) +
  theme_minimal(base_size = 14) +
  theme(
    panel.grid.minor = element_blank(),
    legend.position = "none",
    plot.margin = margin(3,15,3,3,"mm")
  ) +
  coord_cartesian(clip = "off") +
  labs(x = "Number of days since 100th case", y= "",
       subtitle = "Total number of COVID-19 cases in USA by state") +
  geom_shadowtext(aes(label = paste0("", state)), hjust=0, vjust=0,
                         data = .%>% group_by(state) %>% top_n(1, days_since_100),
                         bg.color = "white")

ggsave(filename="myPlot.png", plot=p)