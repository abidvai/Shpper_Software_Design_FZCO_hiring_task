# Dhikr Counter — Flutter Hiring Task

A beautifully crafted Dhikr Counter app built with Flutter and Riverpod, inspired by the provided reference UI. The app allows users to perform and track their daily Islamic remembrance (Dhikr) with a clean, immersive dark-gold interface.

---

## 📱 Project Overview

This app is a single-session Dhikr counter that lets users:

- Browse a list of common Dhikr (Subhanallah, Alhamdulillah, Allahu Akbar)
- Tap a circular button to count each recitation
- Track session progress toward a goal (e.g. 33 recitations)
- View a simulated global live recitation count
- Switch between tap mode and voice mode

The UI follows a dark theme with gold accents, Arabic calligraphy using the Amiri font, and smooth responsive layouts using `flutter_screenutil`.

---

## 🚀 Setup Instructions

### Prerequisites

- Flutter SDK: `>=3.0.0`
- Dart SDK: `>=3.0.0`
- Android Studio / VS Code
- A connected device or emulator

### Steps

```bash
# 1. Clone the repository
git clone https://github.com/[YOUR_GITHUB_USERNAME]/dhikr_hiring_task.git

# 2. Navigate into the project
cd dhikr_hiring_task

# 3. Install dependencies
flutter pub get

# 4. Run the app
flutter run
```

### Build Release APK

```bash
flutter build apk --release
# Output: build/app/outputs/flutter-apk/app-release.apk
```

---

## 📦 Dependencies

```yaml
dependencies:
  flutter_riverpod: ^2.6.1       # State management
  flutter_screenutil: ^5.9.0     # Responsive sizing
  google_fonts: ^6.2.1           # Amiri font for Arabic text
  intl: ^0.19.0                  # Number formatting (2,841,092)
```

---

## 🗂️ Folder Structure
```
lib/
├── main.dart                      
│
├── utils/
│   └── color.dart                  
│
├── models/
│   ├── dhikr_model.dart          
│             
│
├── providers/
│   ├── dhikr_provider.dart        
│   ├── session_goal_provider.dart   
│   └── global_count_provider.dart  
│
└── views/
    ├── splash/
    │   └── splash_screen.dart  
    │  
    │
    ├── dhikr/
    │   ├── dhikr_screen.dart      
    │   └── widget/
    │       ├── recitation_button.dart 
    │       ├── global_live_count_card.dart
    │       ├── change_voice_button.dart
    │       └── session_goal_section.dart     
    │
```

---

## 🧠 State Management — Riverpod

The app uses **Riverpod 2.x** with three providers:

### 1. `dhikrProvider` — `StateNotifierProvider`

The core provider. Holds all mutable session state.

```dart
class DhikrNotifier extends StateNotifier<DhikrState> {
  DhikrNotifier() : super(const DhikrState());

  void increment() {
    if (state.count < state.goal) {
      state = state.copyWith(count: state.count + 1);
    }
  }

  void reset() => state = state.copyWith(count: 0);

  void toggleVoiceMode() =>
      state = state.copyWith(isVoiceMode: !state.isVoiceMode);

  void selectDhikr(DhikrItem item) {
    state = state.copyWith(
      count: 0,
      goal: item.goal,
      dhikrName: item.name,
      arabicText: item.arabicText,
      translation: item.translation,
    );
  }
}

final dhikrProvider =
    StateNotifierProvider<DhikrNotifier, DhikrState>((ref) => DhikrNotifier());
```

**`DhikrState` holds:**

| Field | Type | Description |
|---|---|---|
| `count` | `int` | Current recitation count |
| `goal` | `int` | Session target (e.g. 33) |
| `dhikrName` | `String` | e.g. SUBHANALLAH |
| `arabicText` | `String` | Arabic calligraphy string |
| `translation` | `String` | English meaning |
| `isVoiceMode` | `bool` | Tap vs voice toggle |

---

### 2. `sessionGoalProvider` — `Provider<double>`

A derived provider — computes progress from `dhikrProvider`. No separate state.

```dart
final sessionGoalProvider = Provider<double>((ref) {
  final state = ref.watch(dhikrProvider);
  if (state.goal == 0) return 0.0;
  return state.count / state.goal; // e.g. 24/33 = 0.727
});
```

---

### 3. `globalCountProvider` — `StreamProvider<int>`

Simulates a live global count. In a real app this would be a WebSocket or Firestore stream.

```dart
final globalCountProvider = StreamProvider<int>((ref) async* {
  int count = 2841092;
  yield count;
  await for (final _ in Stream.periodic(const Duration(seconds: 2))) {
    count += (1 + (count % 5));
    yield count;
  }
});
```

---

### Data Flow

```
User taps circle
       ↓
ref.read(dhikrProvider.notifier).increment()
       ↓
DhikrNotifier emits new DhikrState (count + 1)
       ↓
dhikrProvider notifies all watchers
       ↓
sessionGoalProvider recomputes → LinearProgressIndicator updates
DhikrScreen rebuilds           → count text updates
RecitationButton rebuilds      → circle count updates
```

---

## 💡 Assumptions Made

- No backend/API — global count is simulated with `Stream.periodic`. In production this would connect to a real-time database (e.g. Firebase).
- No authentication — the "JOINED" label in the app bar is static UI, not tied to a real user session.
- Session is not persisted — closing the app resets the counter. SharedPreferences persistence was considered out of scope for this task.
- Design size set to `Size(375, 872)` in `ScreenUtilInit` based on standard iPhone 14 dimensions used in the reference UI.
- Arabic font using Google Fonts `Amiri` as it best matches the calligraphic style in the reference.

---

## ✨ Improvements Beyond Reference UI

| Feature | Description |
|---|---|
| **Live count animation** | Global count increments every 2 seconds to simulate real-time data |
| **Progress bar** | `LinearProgressIndicator` added to session goal section (missing from reference) |
| **Haptic feedback** | Light haptic tap on each recitation for a physical feel |
| **Goal completion guard** | Counter stops at goal — no over-counting beyond target |
| **Responsive layout** | `flutter_screenutil` ensures correct UI on all screen sizes |

---

