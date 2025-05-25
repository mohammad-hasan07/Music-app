# music_app

A Flutter-based music application, structured for maintainability and Firebase integration.

## 🧠 Project Approach (MVVM Architecture)

This project follows the **MVVM (Model-View-ViewModel)** architecture for better separation of concerns and maintainability.

### 🔹 Model (`lib/data/models/`)
Contains data model classes representing structured data.

### 🔹 Repository (`lib/data/repo/`)
Acts as a single source of truth for data. It fetches data from Firebase or other APIs and exposes them to ViewModels.

### 🔹 ViewModel (`lib/viewmodels/`)
Holds the application logic and state. It calls the Repository, processes data, and provides output to the views. It may also expose `ValueNotifier`, `ChangeNotifier`, or `Streams` for reactive updates.

### 🔹 View (`lib/views/`)
Contains all the UI components, screens, and widgets. Views listen to ViewModels and rebuild on state change using Flutter’s state management.

## 🚀 Setup Instructions

### 1. Install Dependencies

```bash
flutter pub get
```

### 2. Firebase Configuration

The project includes `firebase_options.dart`, generated via:

```bash
flutterfire configure
```

Ensure you have Firebase CLI and FlutterFire CLI installed and linked to the correct Firebase project.

### 3. Run the App

```bash
flutter run
```

---

## 🛠️ Development Notes

- The project uses Kotlin DSL for Android Gradle scripts (`*.gradle.kts`).
- Linting is configured via `analysis_options.yaml`.
- To add assets, update `pubspec.yaml` and place files under `/assets`.

---

## 📦 How to Package

To share or zip this project:

```bash
flutter clean
```

Then zip, excluding:

- `/build/`
- `.dart_tool/`
- `/android/.gradle/`
- `/ios/Pods/`
