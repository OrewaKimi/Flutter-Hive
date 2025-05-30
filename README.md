
## ✨ Flutter Hive To-Do App

A minimal, modern To-Do list application built using **Flutter** and **Hive** with a Gen Z-style UI. This app supports task creation, deletion, and persistent local storage using Hive. It's lightweight, responsive, and visually clean.


## 📌 Pengertian

Aplikasi **To-Do List** ini merupakan aplikasi pencatat tugas harian yang dibangun menggunakan framework **Flutter** dan **Hive** untuk penyimpanan data lokal tanpa internet. Aplikasi ini memiliki tampilan antarmuka (UI) yang minimalis, modern, dan estetis, cocok untuk pengguna Gen Z.

## 🎯 Tujuan dan Fokus Project

- ✅ Menyediakan platform sederhana untuk mencatat dan mengelola tugas harian.
- 💾 Menyimpan data secara lokal menggunakan Hive (NoSQL database ringan).
- 🎨 Menghadirkan UI yang profesional, namun tetap fresh dan kekinian.
- 🧠 Fokus pada performa ringan, efisiensi kode, dan pengalaman pengguna.

## 🔍 Perbedaan dengan Aplikasi To-Do Biasa

| Fitur                         | To-Do App Biasa         | Flutter Hive To-Do App |
|------------------------------|-------------------------|------------------------|
| Local Storage                | Bisa pakai SQLite       | Menggunakan Hive       |
| UI/UX                        | Sederhana / default     | Minimalist Gen Z Style |
| State Management             | Tidak optimal            | Stateful widget        |
| Dependency ringan            | Kadang berat            | Ringan & cepat         |
| Google Fonts & Animasi      | Jarang                  | Siap dikembangkan      |

## 🖼️ Tampilan Aplikasi
![Light Mode](https://github.com/user-attachments/assets/c42656d1-b313-44bd-9d41-94ad9c29ec34)

### ➕ Tambah Task
![image](https://github.com/user-attachments/assets/62a9f20e-547e-4e66-8890-4dcbede1eb2a)

## 🧩 Dependency yang Digunakan

Tambahkan ini ke dalam `pubspec.yaml`:

```yaml
dependencies:
  flutter:
    sdk: flutter
  hive: ^2.2.3
  hive_flutter: ^1.1.0
  google_fonts: ^6.1.0

```
## 🚀 Jalankan Proyek

```bash
flutter pub get
flutter run

