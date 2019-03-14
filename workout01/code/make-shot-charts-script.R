
#title:'make-shot-charts-script.R'
#description: 'This script will make visualations of where shots were taken from'
#inputs: 'shots-data.csv'
#outputs: 'Diagrams showing where on the court players were when taking shots'
 
# Ment to be run from working directory 'code.'   
# Installing necessary R packages
  
install.packages("jpeg")
install.packages("grid")

# Loading packages

library(jpeg)
library(grid)

# Importing image of nba court

# In terminal
#curl -O https://raw.githubusercontent.com/ucb-stat133/stat133-hws/master/images/nba-court.jpg
#mv nba-court.jpg ../images

court_file <- "../images/nba-court.jpg"

court_image <- rasterGrob(
  readJPEG(court_file),
  width = unit(1,"npc"),
  height = unit(1,"npc"))

# Making shot charts for each player & Saving them as pdf

andre_shot_chart <- ggplot(data = iguodala)+
  annotation_custom(court_image, -250,250,-50,420)+
  geom_point(aes(x = x, y = y, color = shot_made_flag))+
  ylim(-50,420)+
  ggtitle('Shot Chart: Andre Iguodala (2016 Season)')+
  theme_minimal()

ggsave("andre-iguodala-shot-chart.pdf",
       plot = andre_shot_chart,
       width = 6.5,
       height = 5,
       device = "pdf",
       path = '../images',
       units = "in")

draymond_shot_chart <- ggplot(data = green)+
  annotation_custom(court_image, -250,250,-50,420)+
  geom_point(aes(x = x, y = y, color = shot_made_flag))+
  ylim(-50,420)+
  ggtitle('Shot Chart: Draymond Green (2016 Season)')+
  theme_minimal()

ggsave("draymond-green-shot-chart.pdf",
       plot = draymond_shot_chart,
       width = 6.5,
       height = 5,
       device = "pdf",
       path = '../images',
       units = "in")

kevin_shot_chart <- ggplot(data = durant)+
  annotation_custom(court_image, -250,250,-50,420)+
  geom_point(aes(x = x, y = y, color = shot_made_flag))+
  ylim(-50,420)+
  ggtitle('Shot Chart: Kevin Durant (2016 Season)')+
  theme_minimal()

ggsave("kevin-durant-shot-chart.pdf",
       plot = kevin_shot_chart,
       width = 6.5,
       height = 5,
       device = "pdf",
       path = '../images',
       units = "in") 

klay_shot_chart <- ggplot(data = thompson)+
  annotation_custom(court_image, -250,250,-50,420)+
  geom_point(aes(x = x, y = y, color = shot_made_flag))+
  ylim(-50,420)+
  ggtitle('Shot Chart: Klay Thompson (2016 Season)')+
  theme_minimal()

ggsave("klay-thompson-shot-chart.pdf",
       plot = klay_shot_chart,
       width = 6.5,
       height = 5,
       device = "pdf",
       path = '../images',
       units = "in")

stephen_shot_chart <- ggplot(data = curry)+
  annotation_custom(court_image, -250,250,-50,420)+
  geom_point(aes(x = x, y = y, color = shot_made_flag))+
  ylim(-50,420)+
  ggtitle('Shot Chart: Stephen Curry (2016 Season)')+
  theme_minimal()

ggsave("stephen-curry-shot-chart.pdf",
       plot = stephen_shot_chart,
       width = 6.5,
       height = 5,
       device = "pdf",
       path = '../images',
       units = "in")

# Facetting Shot Charts

shots_data <- read_csv("../data/shots-data.csv")

shot_wrap <- ggplot(data = shots_data)+
  annotation_custom(court_image, -250,250,-50,420)+
  geom_point(aes(x = x, y = y, color = shot_made_flag))+
  ylim(-50,420)+
  ggtitle('Shot Charts (2016 Season)')+
  theme_dark()+
  facet_wrap(~ name)


ggsave("gsw-shot-charts.pdf",
       plot = shot_wrap,
       width = 8,
       height = 7,
       device = "pdf",
       path = '../images',
       units = "in") 

ggsave("gsw-shot-charts.png",
       plot = shot_wrap,
       width = 8,
       height = 7,
       device = "png",
       path = '../images',
       units = "in")


