# 📊 Data Screening Exercise  

This repository contains the solution to a data processing and analysis assignment involving a messy ICE detention dataset. The goal was to clean, analyze, and visualize the top 10 largest detention facilities by population using R.  

---

## 📦 Requirements  

- **R 4.x**
- **Packages:**  
  - `tidyverse`  
  - `ggplot2`  

You can install the required packages using:  
```R
install.packages(c("tidyverse", "ggplot2"))
```

---

## 📈 What This Project Does  

The exercise followed these steps:

1. **Read and clean the messy dataset** (`messy_ice_detention.csv`).
2. **Convert the `Name` column to UTF-8** and remove any untranslatable characters.
3. **Remove special characters and trim extra whitespace** from facility names.
4. **Convert Excel serial numbers in the `Last_Inspection_End_Date` column to proper Date format.**
5. **Identify missing values in the `City` and `State` columns.**
6. **Manually Google-verified and replaced missing values in `City` and `State`.**
7. **Left 18 rows with missing `Last_Inspection_End_Date` untouched, as these may be sensitive and imputing a date didn’t suit the context.**
8. **Created a `Total_Population` column** by summing `Level A–D` populations.
9. **Selected the top 10 facilities by total population.**
10. **Created a horizontal bar plot** visualizing the top 10 facilities.
11. **Saved the bar plot as a PNG image.**
12. **Exported the cleaned dataset as `cleaned_ice_detention_data.csv`.**

---

## 📂 Files in This Repository  

- `messy_ice_detention.csv` — Original dataset  
- `cleaned_ice_detention_data.csv` — Cleaned dataset  
- `R_script.R` — Main R script with detailed comments  
- `top_10_facilities_population.png` — Final bar plot image  
- `console_output_*.png` — Console output screenshots at various stages  

---

## 📌 How to Run  

1. Open `R_script.R` in RStudio.
2. Run the entire script.
3. Check the cleaned dataset, generated plot image, and console outputs for reference.

---

## 📌 Notes  

- Online resources, including Google and AI assistance(ChatGPT), were used for encoding conversion, date handling,removing special characters.
- Missing city/state values were manually verified via online lookup and replaced accordingly.
- Remaining missing dates were left as-is due to contextual sensitivity.

---
