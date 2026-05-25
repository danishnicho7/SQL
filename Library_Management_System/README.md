# Library Management System

A professional Library Management System developed using **Oracle APEX** and **SQL** for efficient digital library operations.

---

# Features

- Book Management
- Student Management
- Book Issue & Return System
- Overdue Book Detection
- Automatic Fine Calculation
- Dashboard Analytics
- Authorization & User Roles
- Search, Filter & Export Reports
- Modern Dark Theme UI

---

# 🛠 Technologies Used

- Oracle APEX
- Oracle SQL
- PL/SQL
- Database Triggers
- Interactive Reports
- Dashboard Charts

---

# 🗄 Database Tables

## BOOKS
Stores all book information.

## STUDENTS
Stores student details.

## ISSUED_BOOKS
Tracks issued and returned books.

## USER_ROLES
Handles authorization and access control.

---

# ⚙️ Core Functionalities

## Book Issue Logic
- Books can be issued to students.
- Availability decreases automatically.

## Return Logic
- Returned books increase available count.

## Overdue Detection
- Books issued for more than 15 days are marked overdue.

## Fine Calculation

| Days | Fine |
|------|------|
| First 15 Days | ₹5/day |
| Next 15 Days | ₹10/day |
| Beyond 30 Days | ₹20/day |

---

# Dashboard Features

- Total Books KPI
- Total Students KPI
- Issued Books KPI
- Overdue Books KPI
- Books by Category Chart
- Issued vs Returned Chart
- Students by Department Chart

---

# Authorization

Role-based access implemented using:
- ADMIN
- LIBRARIAN
- STUDENT

---

# Screenshots

Screenshots are available inside the `Screenshots` folder.

---

### Developed By
Danish Nicho N
