# Advertising & Auto Dataset Analysis in R

## Overview

This project explores relationships between advertising spend and product sales, as well as automobile characteristics and fuel efficiency, using **R**. The analysis covers data exploration, correlation, regression modeling, and visualization.

## Key Steps

### 1. Advertising Dataset (`Advertising.csv`)

* **Data exploration**: Checked dimensions, variable types, structure, and previewed data.
* **Scatterplots**: Visualized relationships between Sales and TV, Radio, and Newspaper.
* **Correlation**: Found a strong positive correlation between TV spend and Sales (r ≈ 0.78).
* **Linear Regression**:

  * Model: `Sales = 7.03 + 0.0475 * TV`
  * R² ≈ 0.61 → \~61% of Sales variation explained by TV advertising.
  * TV spend is statistically significant (p < 0.05).
* **Model Diagnostics**: Residual plots, ANOVA, confidence intervals.
* **Predictions**: Generated predicted sales values for new TV spend levels.

### 2. ISLR `Auto` Dataset

* **Explored dataset**: Summary statistics and key variable relationships.
* **Scatterplots**:

  * MPG vs Displacement
  * MPG vs Weight
  * MPG vs Acceleration
* **Correlation**: Strong negative correlation between Weight and MPG (r ≈ -0.83).
* **Linear Regression**:

  * Model: `mpg = 46.22 - 0.00765 * weight`
  * R² ≈ 0.69 → \~69% of MPG variation explained by car weight.
  * Slope highly significant (p < 2e-16).
* **Predictions**: Estimated MPG at weights of 2000, 3000, and 4000 lbs.

## Findings

* **Advertising**: TV advertising is the strongest single predictor of Sales, explaining \~61% of the variation.
* **Automobiles**: Vehicle weight is a strong predictor of fuel efficiency (MPG), explaining \~69% of the variation.
