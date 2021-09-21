

#############----------------------- R code to create contour plot--------------------------------------------------####


##--------library need to install----------------------------------------##

install.packages ("plotly")

####----- after installation load the library----------------------------##

library(plotly)

##--- Loading data as data frame, 1.convert the excel data to .CSV, 2.save to the directory, 3.run the code as below ----------------------##

df<-read.csv("210920contour.csv",head=T)
df

##---------Converting Date column into date format------------------------##

df$Date=as.Date(df$Date, format="%m/%d/%Y")

##---------Checking if Date column is changed to date format---------------------##

str(df, list.len=ncol(df))

##-----Code below is for creating contour plot----------------------------##

fig <- plot_ly(df,x= df$Date, y=df$Distance.from.river.mouth..km., z=df$Chl..microg.L.,  
               z = ~volcano, type = "contour", contours = list(showlabels = TRUE))

##------------Incorporating the figure title,axis titles etc.-------------##


t <- list(
  family = "Courier New",
  size = 14,
  color = "blue")
t1 <- list(
  family = "Times New Roman",
  color = "red"
)
t2 <- list(
  family = "Courier New",
  size = 14,
  color = "green")
t3 <- list(family = 'Arial')


fig <- fig %>% 
  colorbar(title = "Concentration \n in µg/L", font =t2) %>%
  layout(title = 'Concentration of chlorophylla', font =t1,
         plot_bgcolor = "#e5ecf6",xaxis = list(title = "Date", font = t3), 
         yaxis = list(title = "Distance from river mouth (Km)", font = t3))



##----Final figure--------------------------------------------------------##

fig



#####################





















