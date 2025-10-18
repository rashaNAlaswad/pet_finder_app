# Pet Finder App 🐱🐶

A beautiful Flutter application for discovering and learning about different cat breeds. Built with clean architecture principles and modern Flutter development practices.

## Features ✨

- **Browse Cat Breeds**: Discover various cat breeds with detailed information
- **Search Functionality**: Find specific breeds using the search bar
- **Detailed Pet Information**: View comprehensive details about each breed including:
  - Physical characteristics (weight, appearance)
  - Personality traits (temperament, affection level)
  - Care requirements (grooming, health issues)
  - Compatibility (child-friendly, dog-friendly)
- **Loading States**: Elegant shimmer effects during data loading

## Tech Stack 🛠️

### Core Technologies
- **Flutter**: Cross-platform mobile development
- **Dart**: Programming language

### Architecture & State Management
- **Clean Architecture**: Organized code structure with separation of concerns
- **BLoC Pattern**: State management using `flutter_bloc`
- **Dependency Injection**: Service locator pattern with `get_it`

### Networking & Data
- **Dio**: HTTP client for API communication
- **Retrofit**: Type-safe REST client with code generation
- **The Cat API**: External API for cat breed data

### UI/UX
- **Material Design**: Modern UI components
- **Google Fonts**: Beautiful typography
- **SVG Support**: Scalable vector graphics with `flutter_svg`
- **Image Caching**: Efficient image loading with `cached_network_image`
- **Responsive Design**: Screen size adaptation with `flutter_screenutil`
- **Shimmer Effects**: Loading state animations

### Development Tools
- **Code Generation**: JSON serialization and Retrofit API clients
- **Testing**: Unit tests with `mockito` and `bloc_test`
- **Integration Testing**: End-to-end testing capabilities
- **Linting**: Code quality with `flutter_lints`

## Project Structure 📁

```
lib/
├── app.dart                 # Main app configuration
├── main.dart               # App entry point
├── core/                   # Core functionality
│   ├── constants/          # App constants
│   ├── di/                 # Dependency injection
│   ├── helper/             # Utility functions
│   ├── networking/         # API configuration
│   ├── router/             # Navigation setup
│   ├── theme/              # App theming
│   └── widgets/            # Reusable widgets
└── features/               # Feature modules
    ├── details/            # Pet details feature
    ├── favourite/          # Favorites feature
    ├── home/               # Home screen feature
    ├── navigation/         # Bottom navigation
    └── onboarding/         # Onboarding flow
```

## Getting Started 🚀

### Prerequisites
- Flutter SDK (^3.9.2)
- Dart SDK
- Android Studio / VS Code
- Git

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd pet_finder_app
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate code files**
   ```bash
   flutter packages pub run build_runner build
   ```

4. **Run the app**
   ```bash
   flutter run
   ```

## API Integration 🌐

The app integrates with **The Cat API** (https://api.thecatapi.com/v1/) to fetch:
- Cat breed information
- Breed details and characteristics
- Favorites management

### Available Endpoints
- `GET /breeds` - List all cat breeds
- `GET /breeds/{breed_id}` - Get specific breed details
- `GET /favourites` - Get user's favorite breeds
- `POST /favourites` - Add breed to favorites
- `DELETE /favourites/{favourite_id}` - Remove from favorites

## Testing 🧪

### Unit Tests
```bash
flutter test
```

### Integration Tests
```bash
flutter test integration_test/
```

### Test Coverage
The project includes tests for:
- Business logic (Cubits)
- UI components
- API services
- Data models
