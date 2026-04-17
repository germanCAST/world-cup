# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

```bash
flutter pub get          # Install dependencies
flutter run              # Run on default connected device
flutter run -d windows   # Run on Windows desktop
flutter run -d chrome    # Run on web (Chrome)
flutter test             # Run all tests
flutter test test/widget_test.dart  # Run a single test file
flutter analyze          # Run Dart static analysis
flutter build apk        # Build Android APK
flutter build web        # Build web version
flutter build windows    # Build Windows desktop
flutter clean            # Clean build artifacts
```

## Architecture

This is a Flutter multi-platform application (`android/`, `ios/`, `linux/`, `windows/`, `web/`).

- `lib/main.dart` — Only Dart source file; contains `MyApp` (StatelessWidget wrapping MaterialApp) and `MyHomePage` (StatefulWidget with counter logic using simple `setState()`)
- `test/widget_test.dart` — Widget tests using `WidgetTester`
- Material Design 3 theming with deep purple seed color

**Current state:** Standard Flutter starter template (counter demo). No external APIs, state management libraries, or domain-specific logic yet.
