# 🐛 Buggy Student CRUD — Practical Lab Activity

## ASP.NET Core MVC Bug Hunting Exercise

This is a **Student Records Management System** built with ASP.NET Core 6.0 MVC and Entity Framework Core. It has been **intentionally coded with several bugs** for you to find and fix as part of your practical lab activity.

---

## 📋 Prerequisites

- [.NET 6.0 SDK](https://dotnet.microsoft.com/en-us/download/dotnet/6.0) installed on your machine
- A code editor (Visual Studio 2022, VS Code, or Rider)
- Git installed
- SQL Server LocalDB (comes with Visual Studio) or SQL Server Express
- EF Core CLI tool: `dotnet tool install --global dotnet-ef`

---

## 🚀 Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/mahmenxx/BuggyStudentCRUD.git
cd BuggyStudentCRUD
```

### 2. Run the Scaffold Script

```bash
scaffold.bat
```

This will restore packages, create the initial database migration, and apply it to your LocalDB instance.

> **Note:** If you don't have the EF Core CLI tool installed, run `dotnet tool install --global dotnet-ef` first.

### 3. Run the Application

```bash
cd BuggyStudentCRUD
dotnet run
```

The app will start on `https://localhost:5001` or `http://localhost:5000`. Open it in your browser.

> **Note:** The app uses **SQL Server LocalDB**. Five sample students are seeded automatically on first run.

---

## 🎯 Your Task

This application contains **7 bugs** spread across the **Model**, **Views**, and **Controllers**. Your job is to:

1. **Run the application** and test every feature
2. **Identify each bug** by observing unexpected behavior
3. **Fix each bug** in the source code
4. **Document your findings** (see Submission section below)

### Features to Test

| Feature | What to Test |
|---------|-------------|
| **Student List** | Search functionality, sorting by columns |
| **View Details** | Click on a student to see their full info |
| **Create Student** | Add a new student with valid data |
| **Edit Student** | Modify an existing student's information |
| **Delete Student** | Remove a student record |
| **Validation** | Try entering invalid data (empty fields, bad GPA values) |

### 💡 Hints

- Bugs are in the **Controller logic**, **View templates**, and **Model validation**
- Pay close attention to what happens vs. what *should* happen
- Use the browser's developer tools (F12) to inspect network requests if needed
- Read error messages carefully — they often point to the root cause
- Compare the code to what standard CRUD operations should look like

---

## 📁 Project Structure

```
BuggyStudentCRUD/
├── Controllers/
│   ├── HomeController.cs          # Home page controller
│   └── StudentsController.cs      # CRUD operations (bugs here!)
├── Data/
│   ├── ApplicationDbContext.cs     # EF Core database context
│   └── SeedData.cs                # Sample data seeder
├── Models/
│   ├── Student.cs                 # Student entity (bug here!)
│   └── ErrorViewModel.cs          # Error view model
├── Views/
│   ├── Home/                      # Home page views
│   ├── Students/                  # Student CRUD views (bugs here!)
│   └── Shared/                    # Layout and shared views
├── wwwroot/                       # Static files (CSS, JS)
├── Program.cs                     # App entry point
└── appsettings.json               # Configuration
```

---

## 📝 Submission Requirements

Create a document (PDF or DOCX) with the following for **each bug** you find:

1. **Bug #**: Number it sequentially
2. **Location**: File name and line number(s)
3. **Description**: What is wrong and what incorrect behavior it causes
4. **Fix**: The corrected code
5. **Explanation**: Why the fix works

### Example:

> **Bug #1**
> - **Location:** `Controllers/ExampleController.cs`, Line 42
> - **Description:** The method returns `null` instead of a valid view, causing a 500 error
> - **Fix:** Changed `return null;` to `return View();`
> - **Explanation:** The action method must return an `IActionResult`; returning null crashes the MVC pipeline

---

## ⚠️ Important Notes

- **DO NOT** look at the git blame or commit messages for hints about the bugs
- Work **individually** unless your instructor says otherwise
- Make sure you've run `scaffold.bat` before running the application
- If the app crashes, read the exception message — it's a clue!
- There are exactly **7 bugs** — keep looking until you find them all

---

## 🛠 Tech Stack

- **Framework:** ASP.NET Core 6.0 MVC
- **ORM:** Entity Framework Core 6.0 (SQL Server)
- **Frontend:** Bootstrap 5, Font Awesome 6
- **Language:** C# 10

---

## ❓ Frequently Asked Questions

**Q: Do I need to create the database manually in SSMS?**
No. The `scaffold.bat` script handles everything — it creates the migration files and applies them to automatically create the database in LocalDB. You do **not** need to open SQL Server Management Studio or manually create any database.

**Q: What is LocalDB?**
LocalDB is a lightweight version of SQL Server that comes pre-installed with Visual Studio. It runs on demand and requires no configuration. Your database files are stored automatically under your user profile.

**Q: How do I check if LocalDB is installed?**
Open a terminal and run:
```bash
sqllocaldb info
```
You should see `MSSQLLocalDB` listed. If not, install it via the Visual Studio Installer under **Individual Components → SQL Server Express LocalDB**.

**Q: I get an error saying `dotnet-ef` is not recognized. What do I do?**
Install the EF Core CLI tool globally by running:
```bash
dotnet tool install --global dotnet-ef
```
Then close and reopen your terminal before running `scaffold.bat` again.

**Q: I get a connection error when running the app. How do I fix it?**
Make sure LocalDB is running. You can start it manually with:
```bash
sqllocaldb start MSSQLLocalDB
```
If that doesn't work, check that your `appsettings.json` connection string matches your local setup. If you're using SQL Server Express instead of LocalDB, update the `Server` value to `Server=.\SQLEXPRESS` or `Server=YOUR_PC_NAME\SQLEXPRESS`.

**Q: The scaffold script says "migration already exists." What do I do?**
If a `Migrations` folder already exists in the project, delete it and run `scaffold.bat` again:
```bash
rmdir /s /q BuggyStudentCRUD\Migrations
scaffold.bat
```

**Q: How do I reset the database and start fresh?**
Run the following commands from the `BuggyStudentCRUD` project folder:
```bash
dotnet ef database drop --force
dotnet ef database update
```
This will delete the existing database and recreate it. The seed data will be re-inserted on the next app run.

**Q: Can I view the database tables and data?**
Yes. You can connect to the database using:
- **SQL Server Management Studio (SSMS)** — connect to `(localdb)\mssqllocaldb`
- **Visual Studio** — open **View → SQL Server Object Explorer**
- **Azure Data Studio** — connect to `(localdb)\mssqllocaldb`

Look for the database named `BuggyStudentCRUDDb`.

**Q: The app runs but no students appear on the list. Why?**
This could be one of the bugs you need to find, or the database may not have been seeded. Try resetting the database (see above). If students still don't appear, investigate the controller code — that's a hint! 😉

---

Good luck and happy debugging! 🔍
