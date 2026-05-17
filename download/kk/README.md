# Kumastream - Movie Streaming App 🎬

A Flutter-based movie streaming application with dark mode UI and yellow accent theme.

## Features

- **Home Layout**: Dark mode with greeting widget, banner carousel, and movie categories
- **Movie Categories**: Iconic Movies, War Movies, Trending Now, Ongoing Series, Anime, Action, Horror
- **Live Streaming**: Live sports events, highlights, and channels
- **Search**: Search movies with grid view results
- **Profile Menu**: Membership status, account info, bookmarks, settings
- **Authentication**: Sign In and Sign Up pages
- **Movie Detail**: Full movie info with poster, cast, synopsis

## Getting Started

### Prerequisites
- Flutter SDK (>=3.0.0)
- Dart SDK (>=3.0.0)
- Android Studio / VS Code

### Installation

```bash
# Clone the repository
git clone https://github.com/ttg92195-cmyk/kk.git

# Navigate to project directory
cd kk

# Get dependencies
flutter pub get

# Run the app
flutter run
```

### Build APK

```bash
flutter build apk --release
```

The APK will be at `build/app/outputs/flutter-apk/app-release.apk`

## Auto APK Build (GitHub Actions)

Every push to `main` branch automatically builds a release APK.

1. Go to **Actions** tab in GitHub
2. Click on the latest **Build & Release APK** workflow
3. Download the APK from **Artifacts** section or **Releases** page

## Tech Stack

- **Framework**: Flutter 3.41.9
- **State Management**: Provider
- **Image Loading**: cached_network_image
- **Carousel**: carousel_slider
- **Icons**: iconsax

## Version

v1.0.0
