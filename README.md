# Virtual Community Support Platform

A full-stack web application built during a 15-day summer internship program (2025) to manage community missions. It supports user registration, role-based login, mission application, and admin management of missions, themes, skills, and users.


## 📌 Table of Contents

- [About the Project](#about-the-project)
- [Features](#features)
- [Tech Stack](#tech-stack)
- [Project Structure](#project-structure)
- [Getting Started](#getting-started)
- [API Overview](#api-overview)


## 🧩 About the Project

**Virtual Community Support** is a full-stack platform that connects volunteers with community service missions. It allows users to browse, apply, and manage missions, while admins can control mission-related data securely using a role-based API.


## ✨ Features

### 👤 User

- Login and Registration
- Role-based access (User/Admin)
- View and apply for missions
- View applied missions
- Edit profile

### 🛠️ Admin

- Manage users
- CRUD for missions, themes, and skills
- Review and manage mission applications
- Role-based authorization and data access


## 🔧 Tech Stack

**Frontend**  
- Angular (v14+)  
- TypeScript  
- Bootstrap/CSS

**Backend**  
- ASP.NET Core Web API (6.0+)  
- Entity Framework Core (Code First)  
- LINQ

**Database**  
- PostgreSQL

**Development Tools**  
- Swagger (API Docs)  
- GitHub (Version Control)


## 📁 Project Structure

### Backend (.NET API)

```
/VirtualCommunitySupport.API
├── Controllers/
├── Models/
├── Data/
├── Repository/
├── Migrations/
├── Program.cs
├── Startup.cs
└── appsettings.json
```
### Frontend (Angular)

```
/VirtualCommunitySupport.UI
├── src/
│   ├── app/
│   │   ├── components/
│   │   ├── services/
│   │   ├── models/
│   │   └── guards/
│   ├── assets/
│   ├── environments/
│   └── index.html
```
## 🚀 Getting Started

### Prerequisites

- [.NET 6 SDK](https://dotnet.microsoft.com/download)
- [Node.js](https://nodejs.org/) and Angular CLI
- [PostgreSQL](https://www.postgresql.org/)
- Visual Studio or VS Code


### Backend Setup

```bash
cd VirtualCommunitySupport.API

# Restore packages
dotnet restore

# Apply migrations to create DB
dotnet ef database update

# Run API
dotnet run
````

### Frontend Setup

```bash
cd VirtualCommunitySupport.UI

# Install dependencies
npm install

# Run Angular app
ng serve --open
```

### PostgreSQL Configuration

Create a database (e.g. `VCS_DB`) and update `appsettings.json`:

```json
"ConnectionStrings": {
  "DefaultConnection": "Host=localhost;Database=VCS_DB;Username=postgres;Password=yourpassword"
}
```

## 📬 API Overview

Use Swagger at `/swagger` to explore the API.

| Endpoint                       | Description         |
| ------------------------------ | ------------------- |
| `POST /api/Auth/login`         | User login          |
| `GET /api/User`                | List users          |
| `GET /api/Mission`             | List missions       |
| `GET /api/Theme`               | List mission themes |
| `GET /api/Skill`               | List mission skills |
| `POST /api/MissionApplication` | Apply to mission    |
