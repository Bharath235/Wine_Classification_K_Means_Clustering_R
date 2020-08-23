df1 <- read.csv('winequality-red.csv', sep=';')
df2 <- read.csv('winequality-white.csv', sep=';')

df1$label <- sapply(df1$pH, function(x){'red'})
df2$label <- sapply(df2$pH, function(x){'white'})

head(df1)

wine <- rbind(df1,df2)

library(ggplot2)

pl1 <- ggplot(wine,aes(residual.sugar)) + geom_histogram(aes(fill=label),color='black',bins=50)
pl2 <- pl1 + scale_fill_manual(values=c('#ae4554','#faf7ea')) + theme_bw()
pl2

pl1 <- ggplot(wine,aes(citric.acid)) + geom_histogram(aes(fill=label),color='black',bins=50)
pl2 <- pl1 + scale_fill_manual(values=c('#ae4554','#faf7ea')) + theme_bw()
pl2

pl1 <- ggplot(wine,aes(alcohol)) + geom_histogram(aes(fill=label),color='black',bins=50)
pl2 <- pl1 + scale_fill_manual(values=c('#ae4554','#faf7ea')) + theme_bw()
pl2

pl1 <- ggplot(wine, aes(citric.acid, residual.sugar)) + geom_point(aes(color=label), alpha=0.2)
pl2 <- pl1 + scale_color_manual(values = c('#ae4554','#faf7ea')) + theme_dark()
pl2

pl1 <- ggplot(wine, aes(volatile.acidity, residual.sugar)) + geom_point(aes(color=label), alpha=0.2)
pl2 <- pl1 + scale_color_manual(values = c('#ae4554','#faf7ea')) + theme_dark()
pl2

clus.data <- wine[,1:12]
wine.cluster <- kmeans(clus.data, 2)
wine.cluster$centers

table(wine$label, wine.cluster$cluster)


