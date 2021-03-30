#setwd("D:/xulin2021_new/codes_learn")
library(ggplot2)
library(dplyr)
# plot bar plot using ggplot2

# create a dataset
data <- data.frame(quarter=c("Q1","Q1","Q2","Q2","Q3","Q3","Q4","Q4"),
                   product=c("A","B","A","B","A","B","A","B"),
                   profit=c(10,14,12,11,13,15,16,18))
# create a simle bar plot
ggplot(data,aes(x=quarter,y=profit))+
  geom_col()

# colors and themes(color-outline color of the bar;fill-fill color of the bar)
ggplot(data,aes(x=quarter,y=profit))+
  geom_col(fill="#0099f9")

ggplot(data, aes(x=quarter,y=profit))+
  geom_col(color="#0099f9",fill="#ffffff")

# change the theme
ggplot(data, aes(x=quarter,y=profit))+
  geom_col(fill="#0099f9")+
  theme_classic() # there are many theme you can select

# Titles, subtitles, and captions
# through a labs() layer. it takes in values for title,subtitle and caption.
ggplot(data,aes(x=quarter,y=profit))+
  geom_col(fill = "#0099f9")+
  labs(
    title = "Quarterly profit (in million U.S. dollars)",
    subtitle = "A simple bar chart",
    caption = "Source:ImaginaryCo"
  )

# add styles(color the title, bold the subtitle and italicize the caption)
ggplot(data, aes(x=quarter,y=profit))+
  geom_col(fill="#0099f9")+
  labs(
    title = "Quaterly profit (in million us dollars)",
    subtitle = "A simple bar chart",
    caption = "Source: ImaginaryCo"
  ) +
  theme(
    plot.title = element_text(color = "#0099f9",size = 20),
    plot.subtitle = element_text(face = "bold"),
    plot.caption = element_text(face = "italic")
  )
# align the title to the middle,subtitle to the right and caption to the left
ggplot(data, aes(x=quarter,y=profit))+
  geom_col(fill="#0099f9")+
  labs(
    title = "Quaterly profit (in million us dollars)",
    subtitle = "A simple bar chart",
    caption = "Source: ImaginaryCo"
  ) +
  theme(
    plot.title = element_text(color = "#0099f9",size = 20,hjust = 0.5),
    plot.subtitle = element_text(face = "bold",hjust = 1),
    plot.caption = element_text(face = "italic",hjust=0)
  )

# axis labels
ggplot(data,aes(x=quarter,y=profit))+
  geom_col(fill="#0099f9")+
  labs(
    x="Quater of 2020",
    y="Profit in 2020"
  )
# chage the style using theme
ggplot(data,aes(x=quarter,y=profit))+
  geom_col(fill="#0099f9")+
  labs(
    x = "Quater of 2020",
    y = "Profit of 2020"
  ) +
  theme(
    axis.title.x = element_text(color = "#0099f9",size=15,face="bold"),
    axis.title.y = element_text(size = 15, face = "italic")
  )

# stacked ,grouped and horizontal bar charts
ggplot(data,aes(x=quarter,y=profit,fill=product))+
  geom_col()

# there are two methods to change each portion's color: manually(specifying a vector of color
# or color hex codes) and with palettes(built-in color palettes)
ggplot(data, aes(x=quarter,y=profit,fill=product)) +
  geom_col() +
  scale_fill_manual(values = c("#69c6ff","#0099f9"))

# palettes are a bit easier
ggplot(data,aes(x=quarter, y=profit,fill=product)) +
  geom_col() +
  scale_fill_brewer(palette = "Set1")

# grouped bar charts
ggplot(data,aes(x=quarter,y=profit,fill=product)) +
  geom_col(position = position_dodge())

# can change the coloring
ggplot(data,aes(x=quarter,y=profit,fill=product)) +
  geom_col(position = position_dodge()) +
  scale_fill_manual(values = c("#3db5ff","#0099f9"))
# chage the horizontal bar charts
ggplot(data,aes(x=quarter,y=profit)) +
  geom_col(fill="#0099f9") +
  coord_flip()
# use the scale_fill-manul or scale_fill_brewer layers to change the color.
ggplot(data,aes(x=quarter,y=profit,fill=product)) +
  geom_col(position = position_dodge()) +
  scale_fill_manual(values=c("#3db5ff","#0099f9")) +
  coord_flip()

# labels
data_a <- data %>% filter(product == "A")

ggplot(data_a,aes(x=quarter,y=profit)) +
  geom_col(fill="#0099f9") +
  geom_text(aes(label = profit),vjust=-0.5,size=5)

ggplot(data_a,aes(x=quarter,y=profit)) +
  geom_col(fill="#0099f9") +
  geom_text(aes(label = profit),vjust=2,size = 5, color = "#ffffff")

# label the multiple stacks
ggplot(data,aes(x=quarter,y=profit,fill=product, label=profit)) +
  geom_col() +
  scale_fill_manual(values=c("#3db5ff","#0099f9")) +
  geom_text(position = position_stack(vjust=0.5),size=4,color="#ffffff")

ggplot(data,aes(x=quarter,y=profit,fill=product)) +
  geom_col(position=position_dodge()) +
  scale_fill_manual(values = c("#3db5ff","#0099f9")) +
  geom_text(aes(label=profit),position=position_dodge(0.9),vjust=2,size=4,color="#ffffff")
