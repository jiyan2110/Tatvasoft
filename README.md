
```markdown
# 🌐 Virtual Community Support Platform

A full-stack web application designed to support and manage community service missions virtually. This platform allows users to register, apply for missions, and manage profiles, while administrators can handle CRUD operations for missions, themes, skills, and applications.

---

## 📌 Table of Contents

- [About the Project](#about-the-project)
- [Features](#features)
- [Tech Stack](#tech-stack)
- [Project Structure](#project-structure)
- [Getting Started](#getting-started)
- [API Overview](#api-overview)

---

## 🧩 About the Project

**Virtual Community Support** is a full-stack platform created as part of a 15-day summer internship program (2025). The application promotes volunteer missions and community engagement by enabling user login, mission browsing, applying to missions, and profile management. Admins can manage users, missions, and more through a secure API.

---

## ✨ Features

### 👤 User
- Login and registration
- Role-based access (User/Admin)
- View and apply to missions
- View applied missions
- Edit profile

### 🛠️ Admin
- User Management
- Mission CRUD
- Mission Theme CRUD
- Mission Skill CRUD
- Mission Application Management
- Role-based authentication and access

---

## 🔧 Tech Stack

### Frontend
- Angular (v14+)
- TypeScript
- Bootstrap/CSS

### Backend
- ASP.NET Core Web API (6.0+)
- Entity Framework Core (Code First)
- LINQ

### Database
- PostgreSQL

### Dev Tools
- Swagger (API Documentation)
- GitHub (Version Control)

---

## 📁 Project Structure

### Backend (.NET Web API)

```

/VirtualCommunitySupport.API
│
├── Controllers/
├── Models/
├── Data/
├── Repository/
├── Migrations/
├── Program.cs
├── appsettings.json
└── Startup.cs

```

### Frontend (Angular)

```

/VirtualCommunitySupport.UI
│
├── src/
│   ├── app/
│   │   ├── components/
│   │   ├── services/
│   │   ├── models/
│   │   ├── guards/
│   ├── assets/
│   ├── environments/
│   └── index.html

````

---

## 🚀 Getting Started

### Prerequisites

- [.NET 6 SDK](https://dotnet.microsoft.com/download)
- [Node.js + Angular CLI](https://angular.io/cli)
- [PostgreSQL](https://www.postgresql.org/download/)
- Visual Studio / VS Code

### Backend Setup

```bash
cd VirtualCommunitySupport.API

# Install dependencies
dotnet restore

# Update database
dotnet ef database update

# Run the API
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

### PostgreSQL DB Setup

* Create a PostgreSQL database (e.g., `VCS_DB`)
* Update connection string in `appsettings.json`:

```json
"ConnectionStrings": {
  "DefaultConnection": "Host=localhost;Database=VCS_DB;Username=postgres;Password=yourpassword"
}
```

---

## 📬 API Overview

* **/api/Auth/login** - User login
* **/api/User** - User CRUD
* **/api/Mission** - Mission CRUD
* **/api/Theme** - Theme CRUD
* **/api/Skill** - Skill CRUD
* **/api/MissionApplication** - Apply / view applications

Use Swagger (`/swagger`) to explore all available endpoints and test API calls.

---

```

Let me know if you’d like this content saved into a file or automatically formatted and pushed to your GitHub repo.
```
