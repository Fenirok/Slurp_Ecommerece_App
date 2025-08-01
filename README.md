# 🍕 Slurp - Food Delivery App

A modern, responsive Flutter food delivery application with beautiful UI design and robust state management.

![Slurp App](https://img.shields.io/badge/Flutter-3.5.3-blue?style=for-the-badge&logo=flutter)
![BLoC](https://img.shields.io/badge/BLoC-8.1.3-orange?style=for-the-badge)
![iOS](https://img.shields.io/badge/iOS-Supported-green?style=for-the-badge&logo=apple)
![Android](https://img.shields.io/badge/Android-Supported-green?style=for-the-badge&logo=android)

## 📱 Features

- **�� Food Categories**: Browse through different food categories (Pizza, Burgers, Salads, Pasta, Desserts)
- **�� Promotional Slider**: Eye-catching promotional content with smooth animations
- **🛒 Product Grid**: Beautiful product cards with add-to-cart functionality
- **📱 Responsive Design**: Works perfectly on all device sizes
- **🎨 Custom UI**: Floating bottom navigation and modern design elements
- **⚡ BLoC State Management**: Clean architecture with predictable state management
- **🔍 Search & Cart**: Integrated search and shopping cart features

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.5.3 or higher)
- Dart SDK
- Android Studio / VS Code
- iOS Simulator (for iOS development)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/slurp.git
   cd slurp
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   # For Android
   flutter run

   # For iOS
   flutter run -d ios
   ```

## ��️ Project Structure

```
lib/
├── Home/
│   └── HomePage.dart          # Main home screen with products
├── MainPage/
│   ├── MainPage.dart          # Main app container
│   ├── BottomNavBar.dart      # Custom floating navigation
│   └── bloc/
│       ├── navigation_bloc.dart
│       ├── navigation_event.dart
│       └── navigation_state.dart
├── model/
│   ├── Products.dart          # Product data models
│   └── PromotionsCategories.dart
├── ThemeData/
│   └── ColorScheme.dart       # App theme configuration
└── main.dart                  # App entry point
```

## 🎨 Design Features

### Custom Bottom Navigation
- Floating pill-shaped design
- Smooth animations and transitions
- Responsive sizing for all devices

### Product Cards
- Clean, modern card design
- Product images with proper aspect ratios
- Price and add-to-cart button integration

### Promotional Slider
- Horizontal PageView with indicators
- Gradient overlays for better text readability
- Call-to-action buttons

## �� Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_bloc: ^8.1.3
  bloc: ^8.1.2
  cupertino_icons: ^1.0.8

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^4.0.0
```

## ��️ Architecture

### BLoC Pattern Implementation
The app uses the BLoC (Business Logic Component) pattern for state management:

- **NavigationBloc**: Manages navigation state and tab selection
- **Events**: Handle user interactions and navigation changes
- **States**: Represent the current state of the application

### Model Structure
- **Product Model**: Comprehensive product data with JSON serialization
- **Promotion Model**: Handles promotional content and banners
- **Category Model**: Manages food categories and filtering

## 🎯 Key Features

### Responsive Design
- All UI elements scale based on screen size
- Percentage-based sizing for consistent experience
- Optimized for phones, tablets, and different orientations

### State Management
- Clean separation of UI and business logic
- Predictable state changes
- Easy to test and maintain

### Cross-Platform Support
- Works seamlessly on both Android and iOS
- Platform-specific optimizations
- Consistent experience across devices

## 🛠️ Development

### Adding New Features
1. Create new BLoC events and states
2. Update the UI components
3. Test on both platforms
4. Ensure responsive design

### Customization
- Modify colors in `ThemeData/ColorScheme.dart`
- Update product data in `model/Products.dart`
- Customize promotional content in `model/PromotionsCategories.dart`

## 📱 Screenshots

[Add screenshots of your app here]

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## �� Acknowledgments

- Flutter team for the amazing framework
- BLoC team for state management solution
- Unsplash for beautiful food images
- The Flutter community for inspiration and support

## 📞 Contact

- **Developer**: [Aditya Halder]
- **Email**: [adityahalder365@gmail.com]
- **GitHub**: [@Fenirok]

---

⭐ **Star this repository if you found it helpful!**

---

*Built with ❤️ using Flutter and BLoC*
