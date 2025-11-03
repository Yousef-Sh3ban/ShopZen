# ShopZen - E-Commerce Mobile Application 🛍️

<div align="center">
  <img src="assets/screenshots/appbanner.png" alt="ShopZen Banner" width="100%">
  
  [![Flutter](https://img.shields.io/badge/Flutter-3.5.3-02569B?style=for-the-badge&logo=flutter)](https://flutter.dev)
  [![Dart](https://img.shields.io/badge/Dart-3.5.3-0175C2?style=for-the-badge&logo=dart)](https://dart.dev)
  [![BLoC](https://img.shields.io/badge/State-BLoC-blueviolet?style=for-the-badge)](https://bloclibrary.dev)

  🎓 **Graduation Project** | Flutter Master Class @ InnovaDigits
  
  <br>
  
  <img src="assets/screenshots/qr.png" alt="Download App" width="360">
  
  **📲 Scan to download the app**
</div>

---

## 📱 Screenshots

### 🌟 Light Mode

<div align="center">

| Login | Signup | Login Options | Home | Categories |
|:-----:|:------:|:-------------:|:----:|:----------:|
| <img src="assets/screenshots/login.jpg" width="180"> | <img src="assets/screenshots/siginup.jpg" width="180"> | <img src="assets/screenshots/login2.jpg" width="180"> | <img src="assets/screenshots/home.jpg" width="180"> | <img src="assets/screenshots/category.jpg" width="180"> |

| Product Details | Reviews | Search | Cart | Favorites |
|:---------------:|:-------:|:------:|:----:|:---------:|
| <img src="assets/screenshots/products_details.jpg" width="180"> | <img src="assets/screenshots/reviews.jpg" width="180"> | <img src="assets/screenshots/search.jpg" width="180"> | <img src="assets/screenshots/cart.jpg" width="180"> | <img src="assets/screenshots/favorite.jpg" width="180"> |

| Location | Checkout | Order Done | Orders | Notifications |
|:--------:|:--------:|:----------:|:------:|:-------------:|
| <img src="assets/screenshots/location.jpg" width="180"> | <img src="assets/screenshots/pay.jpg" width="180"> | <img src="assets/screenshots/done.jpg" width="180"> | <img src="assets/screenshots/orders.jpg" width="180"> | <img src="assets/screenshots/notifaction.jpg" width="180"> |

| Notification Settings | Profile | Account | Logout |
|:--------------------:|:-------:|:-------:|:------:|
| <img src="assets/screenshots/notifaction_settings.jpg" width="180"> | <img src="assets/screenshots/dark_profile.jpg" width="180"> | <img src="assets/screenshots/dark_account.jpeg" width="180"> | <img src="assets/screenshots/logout.jpg" width="180"> |

</div>

### 🌙 Dark Mode

<div align="center">

| Dark Login | Dark Signup | Dark Login Options | Dark Home | Dark Categories |
|:----------:|:-----------:|:------------------:|:---------:|:---------------:|
| <img src="assets/screenshots/dark_login.jpg" width="180"> | <img src="assets/screenshots/dark_signup.jpg" width="180"> | <img src="assets/screenshots/dark_login2.jpg" width="180"> | <img src="assets/screenshots/dark_home.jpg" width="180"> | <img src="assets/screenshots/dark_category.jpg" width="180"> |

| Dark Details | Dark Reviews | Dark Search | Dark Cart | Dark Favorites |
|:------------:|:------------:|:-----------:|:---------:|:--------------:|
| <img src="assets/screenshots/dark_products_details.jpg" width="180"> | <img src="assets/screenshots/dark_reviews.jpg" width="180"> | <img src="assets/screenshots/dark_search.jpg" width="180"> | <img src="assets/screenshots/dark_cart.jpg" width="180"> | <img src="assets/screenshots/dark_favorite.jpg" width="180"> |

| Dark Location | Dark Checkout | Dark Done | Dark Orders | Dark Notifications |
|:-------------:|:-------------:|:---------:|:-----------:|:------------------:|
| <img src="assets/screenshots/dark_location.jpg" width="180"> | <img src="assets/screenshots/dark_pay.jpg" width="180"> | <img src="assets/screenshots/dark_done.jpg" width="180"> | <img src="assets/screenshots/dark_orders.jpg" width="180"> | <img src="assets/screenshots/dark_notifaction.jpg" width="180"> |

| Dark Notification Settings | Dark Profile | Account | Dark Logout |
|:-------------------------:|:------------:|:-------:|:-----------:|
| <img src="assets/screenshots/dark_notifaction_settings.jpg" width="180"> | <img src="assets/screenshots/dark_profile.jpg" width="180"> | <img src="assets/screenshots/account.jpg" width="180"> | <img src="assets/screenshots/dark_logout.jpg" width="180"> |

</div>

### 📊 Project Management

<div align="center">
  <img src="assets/screenshots/project_diagram.png" alt="Project Architecture" width="80%">
  <p><em>Project Architecture & Flow Diagram</em></p>
  <br>
  <img src="assets/screenshots/Task_division.png" alt="Task Division" width="80%">
  <p><em>Sprint Planning & Task Distribution</em></p>
</div>

---

## 📖 About The Project

**ShopZen** is a modern e-commerce mobile application developed as the **graduation project for the Flutter Master Class at InnovaDigits Academy**. Built with Flutter and following clean architecture principles, this app delivers a seamless shopping experience across both iOS and Android platforms.

### 📅 Project Info
- **Duration**: 1 Month (3 Sprints)
- **Team**: Yousef and Hassan
- **Methodology**: Agile/Scrum with GitHub Organization
- **Completion**: November 2025

---

## ✨ Features

### 🔐 Authentication
- Splash Screen with animations
- Onboarding for new users
- Login/Signup screens
- Session management

### 🛍️ Shopping Experience
- **Product Catalog** - Browse hot deals and featured products
- **Categories** - Organized product browsing
- **Product Details** - Complete product information with images, prices, and reviews
- **Search** - Real-time product search
- **Cart Management** - Add, update, and remove items with quantity control
- **Favorites** - Save and manage favorite products
- **Order History** - View all past orders

### 🎨 UI/UX Features
- Beautiful modern design with smooth animations
- Complete Dark Mode support
- Loading skeletons for better UX
- Empty state illustrations

### 💾 Technical Features
- SQLite local database for cart and favorites
- Persistent user sessions
- Haptic feedback

---

## 🏗️ Architecture

Clean Architecture with feature-first structure:

```
lib/
├── app/
│   ├── bloc/              # Global state management (Settings, Theme)
│   ├── functions/         # Utility functions
│   ├── models/           # Shared models (ProductModel)
│   └── widgets/          # Reusable widgets
├── configurations/
│   ├── app_endpoints.dart    # API endpoint constants
│   ├── app_events.dart       # BLoC events
│   ├── app_states.dart       # BLoC states
│   └── app_theme.dart        # Theme configuration
├── features/
│   ├── authentication/
│   │   ├── ui/
│   │   │   ├── screens/     # Login, Signup, Splash, OnBoarding
│   │   │   ├── widgets/     # Auth-specific widgets
│   │   │   └── blocs/       # Authentication BLoC
│   ├── home_screen/
│   │   ├── ui/              # Home screen UI
│   │   ├── domain/          # Business logic & models
│   │   └── data/            # Data repositories
│   ├── products_details/
│   ├── search_products/
│   ├── cart/
│   ├── favorites/
│   ├── checkout/
│   ├── my_orders/
│   ├── profile/
│   └── notification/
├── handlers/
│   ├── cart_database.dart       # SQLite cart operations
│   ├── favorite_handler.dart    # SQLite favorites operations
│   ├── snackbars_handler.dart   # Custom snackbar utility
│   └── vibration_handler.dart   # Haptic feedback
├── navigation/
│   ├── app_routes.dart          # Route constants
│   └── route_generator.dart     # Route configuration
├── network/
│   ├── app_end_points.dart      # API endpoints
│   └── network_handler.dart     # Dio HTTP client
└── main.dart                    # App entry point
```

**Design Patterns:** BLoC, Repository, Singleton, Factory

---

## 🛠️ Tech Stack

### Core
- **Flutter** ^3.5.3
- **Dart** ^3.5.3

### State Management
- **flutter_bloc** ^8.1.6

### Networking & Storage
- **dio** ^5.7.0 - HTTP client
- **sqflite** ^2.3.0 - Local database
- **shared_preferences** ^2.3.3 - Key-value storage

### UI & Animations
- **flutter_svg** ^2.0.16
- **animate_do** ^3.3.4
- **carousel_slider** ^5.0.0
- **redacted** ^1.0.13 - Loading skeletons
- **awesome_snackbar_content** ^0.1.4

### Others
- **path_provider** ^2.1.2
- **vibration** ^2.0.1
- **intl** 0.20.2

---

## 🚀 Getting Started

### Prerequisites
- Flutter SDK ^3.5.3
- Android Studio or VS Code
- Git

### Installation

```bash
# Clone the repository
git clone https://github.com/Yousef-Sh3ban/ShopZen.git
cd ShopZen

# Install dependencies
flutter pub get

# Run the app
flutter run
```

### API Configuration
The app uses **DummyJSON API** for demo data. Endpoints are configured in:
- `lib/configurations/app_endpoints.dart`
- `lib/network/app_end_points.dart`

---

## 🎨 Theme & Styling

### Color Palette
```dart
Main Color:      #452CE8
Main Grey:       #68656E
Light Primary:   #FBFBFC
Dark Primary:    #323135
```

### Features
- **Dark Mode**: Complete dark theme with toggle in settings
- **Font**: Custom Alata font family
- **Theme Persistence**: Using SharedPreferences

---

## 🔌 API Integration

Uses **DummyJSON API** for demonstration:
- Products & Search
- Product Details
- User Authentication
- Orders

Network layer built with **Dio** client with centralized error handling.

---

## 📊 Project Outcomes

### What We Built
- ✅ Complete e-commerce app
- ✅ Clean architecture implementation
- ✅ Cross-platform (iOS & Android)
- ✅ Dark mode support
- ✅ Local database integration
- ✅ RESTful API integration
- ✅ BLoC state management

### Key Learnings
- Flutter advanced concepts
- State management patterns
- Database design
- API integration
- UI/UX principles
- Git workflow
- Agile methodology

### Statistics
- **10,000+** lines of Dart code
- **20+** screens
- **1 month** development time


## 📞 Contact & Social Links

- **GitHub**: [@Yousef-Sh3ban](https://github.com/Yousef-Sh3ban)
- **LinkedIn**: [yousef-sh3ban](https://linkedin.com/in/yousef-sh3ban)
- **Email**: yousefshaban1551@gmail.com

---

<div align="center">

**⭐ If you found this project helpful, please consider giving it a star!**

Made with ❤️ using Flutter

</div>
