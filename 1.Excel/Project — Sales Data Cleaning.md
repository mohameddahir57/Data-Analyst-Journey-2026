# Project: Sales Data Cleaning

This is a hands-on project to practice the data cleaning skills you learned in **Day 5**. You will be working with a "messy" dataset of sales transactions.

## The Goal
Clean the `Project — Sales Data Cleaning.csv` file so that it is ready for analysis. The final dataset should have:
1.  consistent capitalization.
2.  No extra spaces.
3.  No duplicate rows.
4.  Clean data separated into appropriate columns.

## Setup
1.  Open the file `Project — Sales Data Cleaning.csv` in Excel.
2.  Save it as an Excel Workbook (`.xlsx`) named `Project — Sales Data Cleaning - WIP.xlsx` (Work In Progress) so you keep the original CSV safe.

## Step-by-Step Instructions

### 1. Standardization (Text Functions)
Look at the **Product Name**, **Customer Name**, and **Region** columns.
*   **Issues**: Some products are lowercase, some uppercase. Customer names have extra spaces. Regions have mixed cases (e.g., "banadir", "Banadir").
*   **Task**: Create new columns to clean this data.
    *   Use `=PROPER()` to fix Product Names and Regions (e.g., "laptop stand" -> "Laptop Stand").
    *   Use `=TRIM()` to remove extra spaces from Customer Names (e.g. "Abdi   Ali" -> "Abdi Ali").
    *   *Tip*: You can nest functions! `=PROPER(TRIM(A2))` cleans spaces AND fixes capitalization at the same time.

### 2. Remove Duplicates
*   **Issue**: Some transactions might have been recorded twice.
*   **Task**:
    1.  Select your entire dataset (including your new clean columns).
    2.  Go to **Data > Remove Duplicates**.
    3.  Make sure all columns are checked.
    4.  How many duplicates were removed? (There should be a few!)

### 3. Final Polish
*   Copy your "Clean" columns and **Paste Values** over the original "Messy" columns (or delete the messy ones and keep the clean ones).
    *   *To Paste Values*: Copy cells > Right Click > Paste Options > Values (the icon with "123"). This removes the formulas so the text stays fixed.
*   Format the **Date** column to look like a proper date (Short Date or Long Date).
*   Format the **Sales Amount** as Currency ($).

### 4. Verification
Save your final result as `Project — Sales Data Cleaning - Cleaned.xlsx`.

> **Self-Correction Check**:
> *   Do you have exactly **48 unique rows**? (Original was 51 including header, minus duplicates).
> *   Are all Regions capitalized correctly (Banadir, Puntland, Somaliland, Galmudug, etc.)?
> *   Are there any double spaces in Customer Names?

**Good luck!**
