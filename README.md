# 🧭 Smart Travel Planner (Flutter)

A Flutter-based mobile application that helps users plan trips by selecting a city, exploring tourist places, viewing details, and building a personalized itinerary with offline support.

---

## 📱 Features

- City search with weather preview
- Tourist places listing
- Place detail view
- Add/remove itinerary items
- Offline itinerary storage

---

## 🛠️ Tech Stack

- Flutter
- Dart
- HTTP
- SharedPreferences
- OpenWeatherMap API
- OpenTripMap API
- Unsplash API

---

## 🌐 API Configuration

### 1️⃣ OpenWeatherMap API (Weather)

📁 File: `lib/services/weather_service.dart`

```dart
static const String apiKey = 'PASTE_OPENWEATHERMAP_API_KEY_HERE';
```

---

### 2️⃣ OpenTripMap API (Tourist Places)

📁 File: `lib/services/opentripmap_place_service.dart`

```dart
static const String apiKey = 'PASTE_OPENTRIPMAP_API_KEY_HERE';
```

> Note: OpenTripMap may return intermittent server errors. The app safely falls back to mock data.

---

### 3️⃣ Unsplash API (Images)

Unsplash API is used to fetch **high-quality images dynamically** for tourist places.

#### 🔑 How to get Unsplash API key

1. Go to https://unsplash.com/join and create an account.
2. Visit https://unsplash.com/developers.
3. Create a new application.
4. Copy the **Access Key** (Client ID).

> The Secret Key is **not required** for frontend usage.

#### 🔑 Where to add Unsplash API key

📁 File: `lib/services/unsplash_image_service.dart`

```dart
class UnsplashImageService {
  static const String accessKey = 'PASTE_UNSPLASH_ACCESS_KEY_HERE';
}
```

#### 🖼 How images are fetched

- OpenTripMap provides place metadata (name, category).
- Unsplash API searches images using the place name.
- The first relevant image is displayed.
- A fallback image is used if no result is found.

---

## 🚀 How to Run

1. Clone the repository
2. Run `flutter pub get`
3. Add API keys
4. Run:

```bash
flutter run
```

---
