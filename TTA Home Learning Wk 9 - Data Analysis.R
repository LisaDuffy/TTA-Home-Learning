library (ggplot2)
library(plotly)

# The idea behind this data visualisation is the design of a new zoo and the designers
# need to know which kinds of animals need more sleep in order to design appropriate enclosures.

# Boxplot to show amount of sleep_total for each vore group in the msleep data set
g <- qplot(vore, sleep_total, data = msleep,geom=c("boxplot","jitter"), fill = vore, xlab = " ", ylab = " ", main ="GRAPH OF SLEEP TOTAL RECORDED")

#add an interactive tooltip 
ggplotly (g,tooltip = c(name, "y", "x"))



