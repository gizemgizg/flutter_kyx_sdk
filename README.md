# Entegrasyon Aşamaları

- ## Kurulum
  - İndirdiğiniz **_flutter_kyx_plugin_** klasörünü projenizin an dizinine kopyalayın ve **pubspec.yaml** dosyası içindeki **dependencies:** kısmına aşağıdaki kodu ekleyin.
    ```Yaml
    flutter_kyx_plugin:
      path: ./flutter_kyx_plugin
    ```
  - Proje ana dizinindeyken terminalden aşağıdaki kodu çalıştırın.
    ```Shell
    flutter pub get
    ```
- ## IOS Entegrasyonu
  - Projenizin ios klasöründe bulununan **.xcworkspace**(yoksa **.xcodeproj**) dosyasını Xcode ile açın.
  - **General** sekmesinden **PROJECT** altından **iOS Deployment Target**'ı **13.0** olarak değiştirin.
  - **General** sekmesinden **TARGETS** altından **Minimum Deployments**'ı **13.0** olarak değiştirin.
  - **_ios/Podfile_** dosyasını açın ve **_target 'ProjectName' do_** satırının altına alttaki kodu ekleyin.
    ```
    pod 'OpenSSL-Universal'
    ```
  - Terminalden projenizin **_ios_** klasörünü açın ve aşağıdaki komutu çalıştırın.
    ```Shell
    pod install
    ```
  - **Signing & Capabilities** sekmesine geçip sağ üstte bulunan **+** butonuna tıklayarak **Near Field Communication Tag Reading** ekleyin.
  - Son olarak Xcode üzerinden **_info.plist_** dosyanızı Open as -> Source Code diyerek açın ve aşağıdaki kodları ekleyin.
    ```plist
    <key>com.apple.developer.nfc.readersession.iso7816.select-identifiers</key>
    <array>
       <string>A0000002471001</string>
       <string>00000000000000</string>
       <string>D4100000030001</string>
    </array>
    <key>NSCameraUsageDescription</key>
    <string>Bu uygulama kimliğinizi tarayabilmek için kamera erişimine ihtiyaç duyar.</string>
    <key>NSMicrophoneUsageDescription</key>
    <string>Bu uygulama liveness kontrolünü yapabilmek için kamera erişimine ihtiyaç duyar.</string>
    <key>NFCReaderUsageDescription</key>
    <string>Bu uygulama kimliğinizi doğrulayabilmek için NFC erişimine ihtiyaç duyar.</string>
    <key>NSSpeechRecognitionUsageDescription</key>
    <string>Bu uygulama sizi doğrulayabilmek için Konuşma Tanıma iznine ihtiyaç duyar.</string>
    ```
- ## Android Entegrasonu

  - **_android/app/src/main/AndroidManifes.xml_** dosyasında bulunan **<manifest ...>**'e prop olarak **xmlns:tools="http://schemas.android.com/tools"**'u ekliyoruz ve **xmlns:dist="http://schemas.android.com/apk/distribution"**'ı ekliyoruz. Sonuç tahmini olarak aşağıdaki gibi olacaktır.
    ```xml
    <manifest xmlns:android="http://schemas.android.com/apk/res/android"
    xmlns:tools="http://schemas.android.com/tools" xmlns:dist="http://schemas.android.com/apk/distribution">
    ```
  - **_android/app/src/main/AndroidManifest.xml_** dosyasındaki **<application ...>**'a prop olarak **tools:replace="android:label,android:name"** ve **android:largeHeap="true"** ekliyoruz. **android:allowBackup** prop'unun değerini **true** olarak değiştiriyoruz. Sonuç tahmini olarak aşağıdaki gibi olacaktır.
    ```xml
    <application
       tools:replace="android:label,android:name"
       android:name="${applicationName}"
       android:largeHeap="true"
       android:label="@string/app_name"
       android:icon="@mipmap/ic_launcher"
       android:roundIcon="@mipmap/ic_launcher_round"
       android:allowBackup="true"
       android:theme="@style/AppTheme"
    >
    ```
  - **_android/app/src/main/AndroidManifest.xml_** dosyasına aşağıdaki kodları ekleyiniz.
    ```xml
    <uses-permission android:name="android.permission.INTERNET" />
    <dist:module dist:instant="true" />
    <uses-feature android:name="android.hardware.camera" android:required="true" />
    <uses-permission android:name="android.permission.CAMERA" />
    <uses-permission android:name="android.permission.RECORD_AUDIO" />
    <uses-permission android:name="android.permission.FOREGROUND_SERVICE" />
    <uses-permission
       android:name="android.permission.READ_EXTERNAL_STORAGE"
       android:maxSdkVersion="32" />
    <uses-permission android:name="android.permission.NFC" />
    <uses-permission android:name="android.permission.VIBRATE" />
    <uses-feature
       android:name="android.hardware.nfc"
       android:required="true" />
    <uses-permission android:name="android.permission.WAKE_LOCK" />
    <uses-feature android:name="android.hardware.camera.autofocus" />
    <uses-permission android:name="android.permission.MODIFY_AUDIO_SETTINGS" />
    <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />
    <uses-permission android:name="android.permission.FOREGROUND_SERVICE_MEDIA_PROJECTION" />
    <uses-permission android:name="android.permission.POST_NOTIFICATIONS" />
    ```
    - **_android/app/src/main/res/values/styles.xml_** dosyasına aşağıdaki kodları ekleyiniz.
    ```xml
    <style name="AppTheme" parent="Theme.MaterialComponents.Light.DarkActionBar">
       <item name="android:windowBackground">?android:colorBackground</item>
    </style>
    ```
    - **_android/app/src/main/res/values-nigh/styles.xml_** dosyasına aşağıdaki kodları ekleyiniz.
    ```xml
    <style name="AppTheme" parent="Theme.MaterialComponents.DayNight.DarkActionBar">
       <item name="android:windowBackground">?android:colorBackground</item>
    </style>
    ```
  - **_android/app_** içerisine indirdiğiniz **libs** klasörünü kopyalayınız.
  - **_android/build.gradle_** içerisindeki **allprojects { repositories { ... } }**'in içerisine aşağıdaki kodları ekleyiniz.

    ```groovy
    flatDir { dirs "libs" }
    ```

  - **_android/app/build.gradle_** içerisindeki **minSdk** versiyonunu **28** olarak değiştiriniz.
  - **_android/app/build.gradle_** dosyasının en üstüne aşağıdaki kodu ekleyiniz.
    ```Groovy
    apply plugin: 'kotlin-kapt'
    ```
  - **_android/app/build.gradle_** dosyasında yer alan **android { ... }**'in en sonuna aşağıdaki kodları ekleyiniz.

    ```Groovy
    buildFeatures {
        viewBinding true
        dataBinding true
    }

    packagingOptions {
        pickFirst 'lib/x86/libc++_shared.so'
        pickFirst 'lib/x86_64/libc++_shared.so'
        pickFirst 'lib/armeabi-v7a/libc++_shared.so'
        pickFirst 'lib/arm64-v8a/libc++_shared.so'
    }
    ```

  - **_android/app/build.gradle_** içerisindeki **android { buildTypes { release { ... } } }**'in içerisine aşağıdaki kodları ekleyiniz.
    ```Groovy
    minifyEnabled false
    shrinkResources false
    ```
  - **_android_** klasörü içerisinde terminal açarak aşağıdaki komutu çalıştırınız.
    ```Shell
    ./gradlew publishToMavenLocal
    ```
