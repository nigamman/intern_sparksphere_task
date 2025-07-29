# 📊 Flutter Internship Task — SparkSphere

A responsive Flutter dashboard UI built as part of the internship task for **SparkSphere Venture Pvt. Ltd.** This project replicates a business dashboard using dummy data, responsive layout, and clean widget architecture.

---

## ✅ Task Overview

- Replicated the provided dashboard UI design using Flutter
- Integrated dummy data via JSONPlaceholder API
- Implemented a fully responsive layout
- Added realistic loading indicators and error handling
- Maintained clean and modular widget-based architecture

---

## 🚀 Features

- ✨ **Dashboard UI** with cards, charts, and bottom navigation
- 📊 **Line Charts** using `fl_chart` package
- 🌐 **Dummy API Integration** using `http` package
- 📱 **Responsive Design** for mobile layout
- ⏳ **Loading and Error States** for realistic UX
- 🧱 **Modular Codebase** with reusable components

---

## 🔗 Dummy API Integration

Used [JSONPlaceholder](https://jsonplaceholder.typicode.com) for realistic mock data.

| API Endpoint | Purpose                    |
|--------------|-----------------------------|
| `/users`     | Customer profile data       |
| `/posts`     | Order statistics            |
| `/albums`    | Product and catalog counts  |
| `/photos`    | Page views and analytics    |

> App also includes fallback mock data using `Future.delayed()` in offline mode.

---

## 📁 Project Structure

```plaintext
lib/
├── main.dart                           # App entry point
├── screens/
│   ├── dashboard_screen.dart           # Main dashboard screen
│   └── coming_soon_screen.dart         # Placeholder screen (moved here)
├── widgets/
│   ├── dashboard_content.dart          # Main dashboard layout
│   ├── dashboard_header.dart           # Header with greeting and icons
│   ├── stats_grid.dart                 # Statistics cards grid
│   ├── chart_widget.dart               # Reusable chart component
│   ├── order_sale_stats.dart           # Order and sale charts
│   └── customer_stats.dart             # Customer statistics chart
├── services/
│   └── dashboard_service.dart          # Data loading logic
└── utils/
    ├── number_formatter.dart           # Number formatting utility
    └── box_decoration_helper.dart      # Shared styling helper
```

---

## 🛠️ Getting Started

### Prerequisites

✅ Flutter SDK (>=2.17.0)  
✅ Dart SDK  
✅ Git  
✅ Android Studio or VS Code

### Installation Steps

```bash
git clone https://github.com/nigamman/intern_sparksphere_task
cd task_ssvl
flutter pub get
flutter run
```

To run on Chrome (Web):

```bash
flutter run -d chrome
```

---

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  http: 
  fl_chart: ^0.63.0
  cupertino_icons: ^1.0.8
  google_font:
  flutter_svg:
  flutter_spinkit:

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^4.0.0
```

---

## 🖼️ Screenshots

Add your screenshots here to show UI completion

### 📌 Dashboard UI Overview
![Dashboard Overview](C:\Users\shiva\StudioProjects\task_ssvl\lib\assets\screenshot_dashboard.png)

### 📌 Loader Overview
![Loader Overview](C:\Users\shiva\StudioProjects\task_ssvl\lib\assets\screenshot_loading.png)

### 📌 Loader Overview

![NewPage Overview](C:\Users\shiva\StudioProjects\task_ssvl\lib\assets\screenshot_new-page.png)

---

## ✅ Task Completion Checklist

- ✅ UI matches provided design
- ✅ JSONPlaceholder API integration completed
- ✅ Responsive design tested on multiple screen sizes
- ✅ Implemented loading & error state handling
- ✅ Folder structure is modular and maintainable
- ✅ Bottom navigation and chart components functional

---

## 👨‍💻 Developer Info

**Name:** Shivansh Nigam  
**Role:** Flutter Intern  
**Company:** SparkSphere Venture Pvt. Ltd.  
**Task:** Flutter Dashboard UI with API integration and responsive layout

---

