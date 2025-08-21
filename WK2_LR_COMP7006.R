# Loading the data 
adv = read.csv("Advertising.csv")
# Exploring the data
dim(adv)
names(adv)
sapply(adv, class)
str (adv)
class(adv)
head(adv)
# Constructing scatter plots to see relationships of:
# Sales and TV
attach(adv)
plot(Sales ~ TV, xlab = "TV", ylab = "Sales",
     main = "Sales vs TV"
     )
# Sales and Radio
plot(Sales ~ Radio, xlab = "Radio", ylab = "Sales",
     main = "Sales vs Radio"
     )
# Sales and Newspaper
plot(Sales ~ Newspaper, xlab = "Newspaper", ylab = "Sales",
     main = "Sales vs Newspaper"
     )
# Finding the correlation coefficient of Sales and TV
cor(Sales, TV)
# Correlation coefficient (r) = 0.7822244
# This indicates a strong positive linear relationship between Sales and TV
# As TV advertising ^ so does Sales ^

# I want to know what R^2 value is:
TV_Sales^2
# R^2 is 0.6118751. 
# This means approx 61% variation explained by TV advertising

# Simple linear regression model
model1 = lm(Sales ~ TV, data = adv)
model1
# Sales = 7.0326 + 0.04754
# Intercept: sales if TV spend = 0
# Slope: +$1k TV spend = +0.04754M sales

# Lets see the accuracy of parameter estimates 
summary(model1)
# t-tests show both intercept and TV spend are highly significant (p < 0.05)
# TV advertising has a measurable effect on sales
# R² is 0.612 = 61%, meaning of sales variation explained

# Confidence interval 
confint(model1)
# We can reject the null hypothesis 

#Plotting the regression line to the model
plot(Sales ~ TV, xlab = "TV", ylab = "Sales",
     main = "Sales vs TV"
     )
abline(a = 7.032594 , b = 0.047537 , col = "red")
# The red line shows the predicted sales from our regression model
# Positive linear trend: as TV advertising spend increases, sales increase
# Scatter around the line indicates that other factors also influence sales

#Anova table
anova(model1)

# Model diagnostic plots
par(mfrow = c(2,2))
plot(model1)

# Model accuracy:
# R² = 0.612 = Model explains ~61% of sales variation from TV spend
# Adjusted R² = 0.610 = Similar, so no over fitting from extra predictors
# RSE = 3.26k = Avg prediction error about $3,260
# F-statistic p-value < 2.2e-16 = TV spend is a highly significant predictor
# Overall, good explanatory power for single predictor, but ~39% variation

# Using the model1 to make predictions
predict(model1, list(TV = 100))
new_data = data.frame(TV = c (50, 150, 250))
predict(model1, newdata = new_data)
# For TV spends 100, 50, 150, and 250, the predicted Sales are approximately
# 11.79, 9.41, 14.16, and 18.92 

# Exploring ISLR data set
library(ISLR)
data("Auto")
head(Auto)
summary(Auto)
plot(Auto$displacement, Auto$mpg,
     main = "MPG vs Displacement",
     xlab = "Displacement",
     ylab = "MPG",
     pch = 19, col = "blue"
     )

# mpg vs weight
plot(Auto$weight, Auto$mpg,
     main = "MPG vs Weight",
     xlab = "Weight",
     ylab = "MPG",
     pch = 19, col = "red"
     )

# mpg vs acceleration
plot(Auto$acceleration, Auto$mpg,
     main = "MPG vs Acceleration",
     xlab = "Acceleration",
     ylab = "MPG",
     pch = 19, col = "green"
     )

cor(Auto$mpg, Auto$weight)
fit_auto <- lm(mpg ~ weight, data = Auto)
summary(fit_auto)$coefficients
summary(fit_auto)
confint(fit_auto)
plot(Auto$weight, Auto$mpg, main="MPG vs Weight", xlab="Weight", ylab="MPG")
abline(fit_auto, col="red", lwd=2)
summary(fit_auto)$r.squared
predict(fit_auto, newdata = data.frame(weight = c(2000, 3000, 4000)), 
        interval = "confidence")
# (c) Correlation: Strong negative relationship between weight and mpg 
# (r = -0.832) = heavier cars get lower mpg
# (d) LS estimates: Intercept = 46.22, Slope = -0.00765 = each +1 lb in weight
# = mpg decreases by 0.00765
# (e) Accuracy: Very small SE for slope (0.000258) = precise estimate; 95% 
# CI (-0.00815, -0.00714) excludes 0
# (f) Hypothesis test: p-value < 2e-16 for slope = weight is a significant
# predictor of mpg
# (g) Plot: Clear downward trend between weight and mpg; regression line 
# fits the pattern well
# (h) R² = 0.693 = weight explains ~ 69% of the variation in mpg
# (i) Predictions: At weight = 2000 lbs = mpg approx 30.92; 3000 lbs 
# = 23.27; 4000 lbs = 15.63 (95% CI shown)