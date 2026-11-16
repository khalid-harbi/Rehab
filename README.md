# 🏡 Rehab

<div align="center">

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Supabase](https://img.shields.io/badge/Supabase-3FCF8E?style=for-the-badge&logo=supabase&logoColor=white)
![Clean Architecture](https://img.shields.io/badge/Clean_Architecture-000000?style=for-the-badge)
![BLoC](https://img.shields.io/badge/BLoC-1E88E5?style=for-the-badge)
![GoRouter](https://img.shields.io/badge/GoRouter-EA4335?style=for-the-badge)
![Moyasar](https://img.shields.io/badge/Moyasar-5B2EFF?style=for-the-badge)

**Making accommodation one less barrier to opportunity.**

A mobile platform designed to help women find suitable accommodation and compatible roommates when traveling to another city for education, work, and professional opportunities.

</div>

---

## 📖 Overview

Finding accommodation in an unfamiliar city can be challenging, especially when traveling for a short-term opportunity such as a technology bootcamp, hackathon, internship, or training program.

**Rehab** aims to simplify this experience by connecting women with suitable accommodation options and potential roommates, making it easier to access opportunities beyond their home cities.

The platform brings accommodation discovery, location-based search, roommate matching, and booking into one experience.

## ✨ Features

### 🏠 Accommodation Discovery
- Browse available accommodation options.
- Filter listings by city, price, number of rooms, and accommodation type.
- Discover properties based on proximity to a desired destination.

### 👭 Roommate Matching
- Discover potential roommates based on compatibility.
- Calculate compatibility scores using factors such as:
  - Personal interests
  - Lifestyle preferences
  - Sleeping schedules
  - Study and work routines

### 📍 Location-Based Search
Find accommodation near important destinations, including:
- Universities
- Technology bootcamps
- Workplaces
- Hackathons and other events

### 💳 Booking & Payments
- Accommodation booking functionality.
- Online payment integration through Moyasar.

### 🔐 Identity & Trust
- User verification features.
- Planned integration with Nafath for identity verification.

### ⭐ User Experience
- Modern and intuitive interface.
- Simplified accommodation discovery and booking.
- Architecture designed with future scalability in mind.

---

## 🎨 UI Design & User Flow

The initial UI draft outlining the application's screens, navigation flow, and user journeys across different account roles.

<div align="center">

<img src="screenshots/initial_ui_draft.png" alt="Rehab Initial UI Design and User Flow" width="100%" />

</div>

---

## 📱 App Preview

A look at the Rehab application interface.

<div align="center">

<img width="1920" height="1080" alt="Rehab App Preview" src="https://github.com/user-attachments/assets/e27a18c6-e587-42c2-a363-07e962566b7b" />

</div>

---

## 🛠️ Tech Stack

| Technology | Purpose |
|---|---|
| Flutter | Cross-platform mobile development |
| Dart | Programming language |
| Supabase | Backend, database, and authentication |
| Clean Architecture | Application architecture |
| BLoC / Cubit | State management |
| GoRouter | Navigation and routing |
| GetIt + Injectable | Dependency injection |
| Freezed | Model and state generation |
| Json Serializable | JSON serialization |
| Dio | API communication |
| Moyasar | Payment integration |
| Figma | UI/UX design |
| Trello | Project management |
| Git & GitHub | Version control and collaboration |

---

## 🏗️ Architecture & Project Structure

The project follows Clean Architecture principles, with a feature-oriented structure to help separate responsibilities and maintainability.

```text
lib/
│
├── core/
│   ├── errors/
│   ├── services/
│   ├── theme/
│   ├── router/
│   └── widgets/
│
├── features/
│   ├── auth/
│   ├── home/
│   ├── booking/
│   ├── profile/
│   ├── roommate/
│   └── payments/
│
├── data/
├── domain/
├── presentation/
│
└── main.dart
```

---

## 🎯 Project Vision

Rehab is built around a simple idea: **access to opportunities should not be limited by the difficulty of finding accommodation.**

By combining technology with a real-world housing challenge, the project aims to make temporary accommodation more accessible, affordable, and convenient for women pursuing education and career opportunities in new cities.

