#!/bin/bash
set -e  # Stop immediately if any command fails

# 1. Clone Flutter (Stable)
echo "--- Cloning Flutter SDK ---"
git clone https://github.com/flutter/flutter.git -b stable --depth 1
export PATH="$PATH:`pwd`/flutter/bin"

# 2. Config
flutter config --enable-web

# 3. Create required asset directories that are empty and not tracked by git
echo "--- Creating required asset directories ---"
mkdir -p assets/videos
mkdir -p assets/lottie
mkdir -p assets/images
mkdir -p assets/loads

# Add a placeholder file in any empty directory so flutter can bundle them
for dir in assets/videos assets/lottie assets/images assets/loads; do
  if [ -z "$(ls -A $dir 2>/dev/null)" ]; then
    touch "$dir/.keep"
  fi
done

# 4. Get dependencies
echo "--- Getting dependencies ---"
flutter pub get

# 5. Build the Web App
echo "--- Building Flutter Web ---"
flutter build web --release \
  --dart-define=GOOGLE_MAPS_API_KEY=$GOOGLE_MAPS_API_KEY \
  --dart-define=FIREBASE_API_KEY=$FIREBASE_API_KEY \
  --dart-define=FIREBASE_PROJECT_ID=$FIREBASE_PROJECT_ID \
  --dart-define=FIREBASE_AUTH_DOMAIN=$FIREBASE_AUTH_DOMAIN \
  --dart-define=FIREBASE_STORAGE_BUCKET=$FIREBASE_STORAGE_BUCKET \
  --dart-define=FIREBASE_MESSAGING_SENDER_ID=$FIREBASE_MESSAGING_SENDER_ID \
  --dart-define=FIREBASE_APP_ID=$FIREBASE_APP_ID

echo "--- ✅ Build complete ---"
