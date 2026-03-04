# Velora Drive - Deployment Checklist 🚀

Follow these steps to prepare and build your application for production.

## 1. Environment & API Keys 🔐
- Ensure your `.env` file is present in the root directory.
- Verify `GOOGLE_MAPS_API_KEY` is restricted to your Android/iOS package IDs in the [Google Cloud Console](https://console.cloud.google.com/google/maps-apis/credentials).
- Verify Firebase configuration in `lib/firebase_options.dart`.

## 2. Android Preparation 🤖
### Signing the App
1. Create a upload keystore if you don't have one:
   ```bash
   keytool -genkey -v -keystore ~/upload-keystore.jks -keyalg RSA -keysize 2048 -validity 10000 -alias upload
   ```
2. Create `android/key.properties` (added to `.gitignore` automatically):
   ```properties
   storePassword=your_password
   keyPassword=your_password
   keyAlias=upload
   storeFile=/Users/yourname/upload-keystore.jks
   ```
3. The `android/app/build.gradle.kts` is already configured to read these properties.

### App Icons & Name
- App Name: Currently "Velora Drive" (Set in `MaterialApp` and `AndroidManifest.xml`).
- App Icon: Use `flutter_launcher_icons` to regenerate if needed:
  ```bash
  flutter pub run flutter_launcher_icons
  ```

### Building the APK/Bundle
- **APK (for direct install):**
  ```bash
  flutter build apk --release --dart-define-from-file=.env
  ```
- **App Bundle (for Play Store):**
  ```bash
  flutter build appbundle --release --dart-define-from-file=.env
  ```

## 3. iOS Preparation 🍎
- Open `ios/Runner.xcworkspace` in Xcode.
- Ensure the **Bundle Identifier** is unique (e.g., `com.velora.drive`).
- Configure **Signing & Capabilities** with your Apple Developer Team.
- Build for Archive:
  ```bash
  flutter build ipa --release --dart-define-from-file=.env
  ```

## 4. Post-Deployment 📈
- **Firebase Analytics**: Check if events are flowing in the Firebase Console.
- **Crashlytics**: Recommended to add `firebase_crashlytics` for production stability monitoring.
- **Google Maps Quota**: Monitor usage in the Google Cloud Console to avoid unexpected bills.

---
**Note:** The `.env` file is ignored by git for security. Make sure to back it up securely!
