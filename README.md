# PokeApp 📱⚡

A modern Flutter application for exploring Pokémon data, built with Clean Architecture, Feature-First organization, and BLoC pattern state management.

---

## 📋 Table of Contents

- [Prerequisites](#-prerequisites)
- [SDK & Tools Requirements](#-sdk--tools-requirements)
- [Platform Specific Requirements](#-platform-specific-requirements)
  - [macOS / iOS Setup](#macos--ios-setup)
  - [Android Setup](#android-setup)
- [Getting Started](#-getting-started)
  - [1. Clone the Repository](#1-clone-the-repository)
  - [2. Flutter & FVM Setup](#2-flutter--fvm-setup)
  - [3. Install Dependencies](#3-install-dependencies)
  - [4. Code Generation](#4-code-generation)
  - [5. iOS Setup (CocoaPods)](#5-ios-setup-cocoapods)
- [Running the Application](#-running-the-application)
- [Useful Development Commands](#-useful-development-commands)
- [Project Architecture](#-project-architecture)

---

## 🛠 Prerequisites

Before setting up the project, ensure you have installed the following base prerequisites on your development machine:

1. **Git**: [Download Git](https://git-scm.com/)
2. **IDE / Code Editor**:
   - [Visual Studio Code](https://code.visualstudio.com/) with **Flutter** and **Dart** extensions installed.
   - Or [Android Studio](https://developer.android.com/studio).

---

## 📦 SDK & Tools Requirements

This project relies on explicit versions of Flutter and Dart tools:

- **Flutter SDK**: `3.44.8` (configured in `.fvmrc`)
- **Dart SDK**: `>=3.12.0 <4.0.0`
- **FVM (Flutter Version Management)** (Strongly Recommended):
  - FVM ensures everyone working on the project uses the exact same Flutter SDK version.
  - Install FVM:
    ```bash
    dart pub global activate fvm
    ```
    *(Alternatively via Homebrew on macOS: `brew tap leoafarias/fvm && brew install fvm`)*

---

## 💻 Platform Specific Requirements

### macOS / iOS Setup
If you plan to run or build the application for iOS:

1. **macOS Machine**: iOS development requires a Mac running macOS.
2. **Xcode**:
   - Download Xcode from the Mac App Store or Apple Developer Portal.
   - Open Xcode once to accept license agreements and install additional component packages.
   - Install Xcode Command Line Tools:
     ```bash
     xcode-select --install
     ```
3. **CocoaPods**:
   - Install CocoaPods via Homebrew or Ruby:
     ```bash
     brew install cocoapods
     ```
     or
     ```bash
     sudo gem install cocoapods
     ```

### Android Setup
If you plan to run or build the application for Android:

1. **Android Studio**:
   - Download & install [Android Studio](https://developer.android.com/studio).
2. **Android SDK & Build Tools**:
   - Via SDK Manager in Android Studio, install:
     - Android SDK Platform (API 34 / latest stable)
     - Android SDK Command-line Tools
     - Android Emulator
3. **Java Development Kit (JDK)**:
   - JDK 17 (bundled with recent versions of Android Studio).
4. **Android Emulator / Physical Device**:
   - Configure an Android Virtual Device (AVD) in Android Studio, or enable **USB Debugging** on a physical Android device.

---

## 🚀 Getting Started

Follow these steps to get the application running on your local machine:

### 1. Clone the Repository
```bash
git clone <repository_url>
cd poke_app
```

### 2. Flutter & FVM Setup

If using **FVM** (Recommended):
```bash
# Install the exact Flutter SDK version specified in .fvmrc (3.44.8)
fvm install

# Set the project to use the installed version
fvm use 3.44.8
```

If **not** using FVM, ensure your global Flutter SDK version matches `3.44.8` (or compatible Flutter 3.x release).

### 3. Install Dependencies
Run pub get to download all package dependencies:

```bash
# Using FVM:
fvm flutter pub get

# Or using global Flutter CLI:
flutter pub get
```

### 4. Code Generation
This application uses `build_runner` with `auto_route` and `flutter_gen` for routing and asset generation. Run the code generator before building:

```bash
# Using FVM:
fvm flutter pub run build_runner build --delete-conflicting-outputs

# Or using global Flutter CLI:
dart run build_runner build --delete-conflicting-outputs
```

### 5. iOS Setup (CocoaPods)
If building for iOS, install Pods:

```bash
cd ios
pod install
cd ..
```

---

## ▶️ Running the Application

### 1. Verify Setup & Devices
Check if your environment is correctly configured:

```bash
# Check doctor
fvm flutter doctor

# List available emulators/simulators and connected devices
fvm flutter devices
```

### 2. Launch the Application
Run the app on your preferred target device/emulator:

```bash
# Run on default connected device
fvm flutter run

# Run on a specific device ID or simulator
fvm flutter run -d <DEVICE_ID>

# Run in Release mode
fvm flutter run --release
```

---

## 🧪 Useful Development Commands

| Command | Purpose |
| :--- | :--- |
| `fvm flutter pub get` | Fetch dependencies |
| `fvm flutter pub run build_runner build --delete-conflicting-outputs` | Run code generators once |
| `fvm flutter pub run build_runner watch --delete-conflicting-outputs` | Watch mode for continuous code generation |
| `fvm flutter analyze` | Run static analysis & lint checks |
| `fvm flutter test` | Run unit & widget tests |
| `dart format .` | Format Dart code according to style rules |

---

## 🏗 Project Architecture

- **Clean Architecture**: Presentation, Domain, and Data layers.
- **Feature-First**: Organized by domain features under `lib/features/`.
- **State Management**: `flutter_bloc` / Cubits.
