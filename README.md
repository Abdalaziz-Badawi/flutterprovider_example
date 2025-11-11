# Flutter Provider Counter App

A Flutter application demonstrating state management using the **Provider** package. The app features a persistent counter that maintains its value across navigation, showcasing best practices for managing global application state.

## Features

- ✅ **Persistent Counter**: Counter value persists across page navigation
- ✅ **State Management**: Uses Provider package with `ChangeNotifier` for reactive state
- ✅ **Multi-page Navigation**: Seamless navigation between Homepage and Tracker page
- ✅ **Smart Routing**: Uses `pushReplacementNamed` to prevent route stack buildup
- ✅ **Increment & Reset**: Increment counter and reset to zero functionality

## Project Structure

```
lib/
├── main.dart                    # App entry point with MultiProvider setup
├── pages/
│   ├── homepage.dart           # Main counter increment page
│   └── tracker.dart            # Tracker page to view current counter value
└── providers/
    └── tracker_provider.dart   # State management logic (ChangeNotifier)
```

### Provider Pattern

This app uses the **Provider** package to manage state globally. The architecture follows these key principles:

#### 1. `TrackerProvider` (State Management)
Located in `lib/providers/tracker_provider.dart`, this class extends `ChangeNotifier` and manages the counter state:

```dart
class TrackerProvider extends ChangeNotifier {
  int trackedNumber = 0;

  void incrementTracker() {
    trackedNumber++;
    notifyListeners();  // Notifies all listeners of state change
  }

  void updateTracker(int newNumber) {
    trackedNumber = newNumber;
    notifyListeners();
  }

  void resetTracker() {
    trackedNumber = 0;
    notifyListeners();
  }
}
```

**Key Methods**:
- `incrementTracker()`: Increments the counter by 1
- `updateTracker(int newNumber)`: Sets the counter to a specific value
- `resetTracker()`: Resets the counter to 0
- `notifyListeners()`: Triggers UI rebuild for all listening widgets

#### 2. MultiProvider Setup
In `main.dart`, the app uses `MultiProvider` to make `TrackerProvider` available app-wide:

```dart
MultiProvider(
  providers: [
    ChangeNotifierProvider(create: (_) => TrackerProvider()),
  ],
  child: MaterialApp(...)
)
```

This ensures:
- Single instance of `TrackerProvider` throughout the app lifecycle
- State persists across navigation
- Any widget can access the provider using `context.watch()` or `context.read()`

#### 3. Consuming State in Widgets

**Homepage** (`lib/pages/homepage.dart`):
- Uses `context.watch<TrackerProvider>()` to reactively display counter
- Uses `context.read<TrackerProvider>()` to increment counter without rebuilding

```dart
// Display (reactive - rebuilds when counter changes)
Text(context.watch<TrackerProvider>().trackedNumber.toString())

// Action (non-reactive - just calls method)
context.read<TrackerProvider>().incrementTracker();
```

**Tracker** (`lib/pages/tracker.dart`):
- Displays the same counter value from the provider
- Reflects real-time updates when counter changes on Homepage

### Navigation Strategy

The app uses `pushReplacementNamed` instead of `pushNamed` to avoid creating new instances:

```dart
// ❌ WRONG: Creates a new instance each time
Navigator.pushNamed(context, '/homepage');

// ✅ CORRECT: Replaces current route, maintains single instance
Navigator.pushReplacementNamed(context, '/homepage');
```

This ensures:
- Only one instance of each page exists at a time
- No route stack buildup when navigating back and forth
- Provider state remains constant

## Usage Guide

### Incrementing the Counter

1. Open the app (starts on **Homepage**)
2. Tap the **+** floating action button
3. Counter increments by 1
4. Value is stored in `TrackerProvider`

### Viewing on Tracker Page

1. From **Homepage**, tap the **tracker icon** in the app bar
2. **Tracker Page** displays the same counter value
3. Any changes on Homepage are reflected here in real-time

### Resetting the Counter

- On **Tracker Page**, tap the **refresh icon** floating action button
- Counter resets to 0
- Homepage reflects the change on navigation back

### Navigation

- **Homepage** → Tap tracker icon → **Tracker Page**
- **Tracker Page** → Tap home icon → **Homepage**

## Key Concepts Explained

### ChangeNotifier
A class that notifies its listeners when internal state changes. Used for simple state management:
- Extend `ChangeNotifier`
- Call `notifyListeners()` when state changes
- Listeners are rebuilt automatically

### Provider.watch() vs Provider.read()
- **`context.watch<T>()`**: Rebuilds widget when provider state changes (reactive)
- **`context.read<T>()`**: Gets provider without rebuilding (one-time access)

### Persisting State Across Routes
By keeping the provider at the app root (`MultiProvider` in `main.dart`), the state persists even when navigating between pages, since the provider instance is never destroyed.

## Dependencies

- **flutter**: ^3.9.2
- **provider**: ^6.0.5
- **cupertino_icons**: ^1.0.8
- **flutter_lints**: ^5.0.0 (dev)

## Project Configuration

- **Dart SDK**: ^3.9.2
- **Platform**: iOS, Android, Web, Linux, macOS, Windows
- **Material Design**: Enabled

## Troubleshooting

### Counter Resets on Navigation
**Problem**: Counter goes back to 0 when navigating.  
**Solution**: Ensure `pushReplacementNamed` is used instead of `pushNamed`.

### Provider Not Found Error
**Problem**: "The method 'MultiProvider' isn't defined"  
**Solution**: Run `flutter pub get` and verify `provider: ^6.0.5` is in `pubspec.yaml`.

### State Not Updating
**Problem**: Counter displays but doesn't update when increment is called.  
**Solution**: Ensure you're using `context.watch<TrackerProvider>()` (reactive) not `context.read()` (non-reactive).

## Learning Resources

- [Provider Package Documentation](https://pub.dev/packages/provider)
- [Flutter State Management Guide](https://flutter.dev/docs/development/data-and-backend/state-mgmt/intro)
- [ChangeNotifier Documentation](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)


## License

This project is part of a learning/study repository. Feel free to use and modify as needed.

## Author

- Abdalaziz Adil Badawi 

Created as a study project for understanding Flutter state management with the Provider package.

---

Thanks for reading this! Have a good day.



