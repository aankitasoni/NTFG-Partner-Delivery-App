

## Table of Contents
- [Features](#features)
- [Flutter & Dart Version](#flutter--dart-version)
- [Prerequisites](#prerequisites)
- [Setup Instructions](#setup-instructions)
- [Firebase Configuration](#firebase-configuration)
- [Assets](#assets)
- [Running the App](#running-the-app)
- [Folder Structure](#folder-structure)
- [Troubleshooting](#troubleshooting)
- [Notes](#notes)

---


---

## Features

- Browse educational content (Headphone, TV, Kitchen, Living Appliances → for gadgets app)
- Add content to Firebase database
- View content in horizontal and vertical lists
- Like/Dislike content for better optimisation
- Responsive UI for multiple screen sizes using `responsive_sizer`
- Firebase integration (Firestore & Storage)
- Admin & user dashboards

---

## Flutter & Dart Version

- **Flutter:** 3.10.5  
- **Dart:** 3.2.0  
- **Environment (pubspec.yaml):**
```yaml
environment:
  sdk: ">=3.2.0 <4.0.0"
  flutter: ">=3.10.0"
```

## Prerequisites

- Flutter SDK installed: [Install Flutter](https://docs.flutter.dev/get-started/install)
- Dart SDK (comes with Flutter)
- Firebase project configured
- Android Studio / VS Code (optional for IDE support)
- Node.js (optional, for Firebase emulators)
- Git installed

## Setup Instructions

1. **Clone the repository**
```bash
git clone <your-repo-url>
cd apps/mobile
```

2. **Install dependencies**
```bash
flutter pub get
```

3. **Firebase Setup**
   - Ensure `firebase_options.dart` is present in your repo (generated using FlutterFire CLI)
   - Keep `google-services.json` (Android) and `GoogleService-Info.plist` (iOS) locally and ignore them in Git
   - For new developers: follow [Firebase Flutter Setup](https://firebase.google.com/docs/flutter/setup)

4. **Assets**
   Make sure all assets referenced in `pubspec.yaml` are present in the `assets/` folder:
   - `assets/gadgets.jpg`
   - `assets/headphone.jpg`, etc.

5. **Run the app**
```bash
flutter run
```

## Firebase Configuration

- `firebase_options.dart`: Contains platform-specific Firebase configurations (keep in repo)
- **Ignored files (do not commit):**
```gitignore
android/app/google-services.json
ios/Runner/GoogleService-Info.plist
```

**Firestore collections used:**
- `products/{category}/items` → for gadgets 
- `users/{userId}/Saved` → for saved content
- `users` → user details

## Assets

Make sure all assets are properly added to your `pubspec.yaml`:

```yaml
flutter:
  assets:
    - assets/
```

## Running the App

```bash
# Run on connected device/emulator
flutter run

# Run in debug mode
flutter run --debug

# Run in release mode
flutter run --release

# Clean build files
flutter clean
flutter pub get
flutter run
```

## Folder Structure

```
apps/mobile/
├─ android/app/google_services.json
├─ ios/
├─ lib/
│  ├─ main.dart
│  ├─ screens/
│  │  ├─ home_screen.dart
│  │  ├─ add_content.dart
│  │  ├─ details_screen.dart
│  │  └─ ...
│  ├─ services/
│  │  └─ database.dart
│  └─ widgets/
│     └─ widget_support.dart
├─ assets/
│  └─ images, icons...
├─ pubspec.yaml
└─ firebase_options.dart
```

## Troubleshooting

### Firebase Issues
- If Firebase errors appear: run `flutterfire configure` and make sure `firebase_options.dart` exists
- Ensure you have the correct Firebase project selected
- Check that Firestore rules allow read/write access

### Asset Issues
- If assets missing: check `pubspec.yaml` and `assets/` directory
- Make sure asset paths are correct and files exist
- Run `flutter pub get` after adding new assets

### General Issues
- Run `flutter pub get` again if dependencies fail
- Check minimum Android/iOS versions in `android/app/build.gradle` and `ios/Runner/Info.plist`
- Clear cache: `flutter clean && flutter pub get`
- Check Flutter doctor: `flutter doctor`

### Common Errors
- **"Bad state: field does not exist"**: Ensure all Firestore documents have required fields
- **Category mismatch**: Verify category names match between AddContent and HomeScreen
- **Image loading issues**: Check asset paths and ensure images exist

## Notes

- Keep `firebase_options.dart` in the repo, but ignore platform secret files
- Use `responsive_sizer` package for responsive UI
- Change start screen in `main.dart`:

```dart
home: const LoginScreen(),
// home: const BottomNavbar(),
// home: const OnboardingScreen(), 
// home: const HomeAdmin(),
```

### Required Database Structure & Category Names

**Firestore document structure:**
```json
{
  "product_name": "Sample Product",
  "product_brand": "Sample Brand", 
  "product_specification": "Sample specifications",
  "price": 100.0,
  "category": "HeadPhone",
  "image": "assets/headphone.jpg"
}
```

**Category names (must match exactly):**
- **HeadPhone**, **TV**, **Kitchen Appliances**, **Living Appliances**

---

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request


---

## Support

If you encounter any issues or have questions, please:
1. Check the [Troubleshooting](#troubleshooting) section
2. Review existing GitHub issues
3. Create a new issue with detailed information about the problem