# 📚 Bookly App

A Flutter-based book discovery application that allows users to browse, search, and explore books using the Google Books API.

---

## 🚀 Features

* Browse books by categories (Featured, Newest, Similar)
* Search books by title and author
* View detailed book information
* Offline data caching for better performance
* Clean and responsive UI

---

## 🏗️ Architecture

The project follows Clean Architecture principles with MVVM structure:

* Presentation Layer (UI + BLoC/Cubit)
* Domain Layer (Use cases & business logic)
* Data Layer (API services + Repository)

State management is handled using **BLoC/Cubit** for scalability and maintainability.

---

## 🛠️ Technologies Used

* Flutter
* Dart
* BLoC / Cubit
* Dio (Networking)
* Hive (Local Storage)
* Google Books API
* GetIt (Dependency Injection)

---

## 📡 API

This project uses the Google Books API:
[https://www.googleapis.com/books/v1/](https://www.googleapis.com/books/v1/)

---

## 💾 Caching Strategy

* Books data is cached locally using Hive
* App works in offline mode when no internet connection is available

---

## 📌 Project Highlights

* Clean and scalable architecture
* Separation of concerns
* Offline-first approach
* Efficient state management

---

## 👨‍💻 Developer

Developed by: Dany Ashraf



