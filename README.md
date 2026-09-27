# Food Delivery Data Analysis

## Business Problem

Analyze food delivery operations to identify the key factors contributing to delivery delays and provide data-driven recommendations to improve delivery efficiency.

## Tools Used

- SQL
- Microsoft Excel
- Data Visualization
- Exploratory Data Analysis

## Analysis Performed

The analysis examined the relationship between delivery time and:

- Weather conditions
- Traffic levels
- Time of day
- Courier experience
- Vehicle type
- Restaurant preparation time

SQL was used to explore and aggregate the dataset, including the use of CTEs, CASE statements, grouping, ranking, and window functions.

## Key Findings

- High-traffic conditions were associated with nearly 18% higher average delivery times compared with low-traffic conditions.
- Snowy weather was associated with approximately 26% higher average delivery times compared with clear weather.
- Evening deliveries had the highest average delivery times.
- Couriers with 5–9 years of experience demonstrated lower average delivery times than less-experienced couriers.
- Car deliveries recorded the highest average delivery times overall.
- An unusual increase in bike delivery times was observed during nighttime.

## Business Recommendations

Based on the analysis:

1. Adjust rider allocation during high-traffic periods.
2. Consider weather-adjusted delivery ETAs.
3. Increase operational capacity during evening peak hours.
4. Prioritize experienced couriers during high-demand periods.
5. Optimize vehicle allocation in dense traffic conditions.
6. Investigate the causes of higher nighttime bike delivery times.

## Project Files

- `sql/` — SQL queries used for analysis
- `data/` — source dataset
- `excel/` — Excel analysis and visualizations
- `report/` — detailed project analysis

## Outcome

The project demonstrates an end-to-end analytical workflow:

**Raw Data → SQL Analysis → Excel Visualization → Business Insights → Recommendations**
