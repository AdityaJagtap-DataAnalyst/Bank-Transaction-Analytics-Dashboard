# 🏦 Bank Transaction Analytics Dashboard using Power BI

## 📊 Overview / Description
The **Bank Transaction Analytics Dashboard** provides a comprehensive view of financial transactions across multiple branches, clients, and payment channels.  
It helps financial teams analyze transaction volumes, monitor credit vs debit trends, evaluate customer behavior, and assess branch performance.

This dashboard converts raw banking data into actionable insights for decision-making, risk assessment, and branch-level operations.

---

## 🚀 Features of the Dashboard
- Total transactions, credit vs debit distribution, and transaction amount summary.  
- Branch-wise transaction performance and customer activity tracking.  
- Day-wise transaction trend (weekday vs weekend).  
- Monthly transaction pattern analysis.  
- Transaction method share (Debit Card, Credit Card, Bank Transfer).  
- High-risk vs low-risk transaction segmentation.  
- Net balance trend and branch-level contribution.  
- Category & description-wise financial insights.  
- Interactive slicers for Month, Branch, Category, Type, and Bank Name.  
- One-click **Reset All Filters** functionality for intuitive navigation.

---

## 🔗 Live Dashboard Preview
👉 **[Click here to view the Power BI Report](https://app.powerbi.com/view?r=eyJrIjoiOTQyNjBkMzgtNjMwNi00ZDM0LTk4MTgtZDkyZTI1MTAzZmRiIiwidCI6IjdjNjZkNGIyLTVmY2QtNGRlYi1hMDQ4LTg1NGQ4ZWEyNDM3MSJ9)**

---

## 📂 Data Used
- Bank transaction dataset containing:  
  - Transaction ID  
  - Branch & Bank details  
  - Transaction Type (Credit/Debit)  
  - Transaction Method  
  - Transaction Amount  
  - Transaction Date  
  - Category & Description fields  
  - Risk identification (High/Low Risk)

Data cleaned & transformed using **SQL + Power Query**, then modeled in Power BI.

---

## 🔄 ETL Process

### 1️⃣ Data Extraction  
Source data extracted from banking transactional systems containing:

- Customer transactions  
- Payment method details  
- Branch information  
- Transaction categories  
- Credit / Debit indicators  
- Risk flags  

### 2️⃣ Data Transformation (SQL + Power Query)  
Included:

- Removal of null/duplicate records  
- Standardization of category & description fields  
- Creation of date, branch, and transaction type dimensions  
- Credit to debit ratio calculation  
- High-risk transaction classification  
- Feature engineering:  
  - `net_balance`  
  - `credit_debit_ratio`  
  - `high_risk_transaction_flag`  

### 3️⃣ Data Loading  
Final cleaned tables loaded into Power BI using a **Star Schema**:

- **Fact Table:** transactions  
- **Dimension Tables:** branch_dim, bank_dim, date_dim, method_dim, category_dim  

Optimized data model enhances dashboard performance and DAX efficiency.

---

## 📊 Dashboard Features

### 📁 1. Transaction Overview Dashboard

**Key Metrics:**  
- Total Transactions: **100K**  
- Total Amount: **254.89M**  
- Credit Amount: **127.60M**  
- Debit Amount: **127.29M**  
- Total Clients: **100K**  
- Credit-to-Debit Ratio: **1.002**

**Visual Insights:**  
- Transaction volume by bank (Kotak, Axis, SBI, ICICI, PNB)  
- Day-wise transaction trend (Weekday vs Weekend)  
- Transaction method share (Debit Card, Credit Card, Bank Transfer)  
- Branch-wise transaction amount  
- Monthly transaction trend analysis  

---

### 📁 2. Finance & Risk Insights Dashboard

**Key Metrics:**  
- Net Balance: **318,117**  
- Total Transactions: **100K**  
- High-Risk Transactions: **41K**  
- Low-Risk Transactions: **8.12K**  
- Average Transaction Amount: **2.55K**  
- Active Branches: **6**

**Insights:**  
- Net transaction balance trend by month  
- Debit vs credit amount comparison across branches  
- Total amount by transaction descriptions (tree-map)  
- Identification of high-risk patterns  
- Category-based financial analysis  

---

## 🧠 Smart Work & Value Addition
✔ End-to-end project pipeline (ETL → SQL → Data Modeling → Power BI)  
✔ Risk segmentation with High/Low risk analysis  
✔ Automatic net balance computation  
✔ Advanced DAX calculations (credit vs debit, risk splits, ratios)  
✔ Clean, intuitive UI with professional navigation  
✔ Branch-level drilldown insights  
✔ Financial storytelling with KPIs & visual summaries  
✔ “Reset All Filters” for better usability  
