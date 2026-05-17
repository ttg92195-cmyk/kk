plugins {
    id("com.android.application")
    id("org.jetbrains.kotlin.android")
}

android {
    namespace = "com.kumastream.app"
    compileSdk = 34

    defaultConfig {
        applicationId = "com.kumastream.app"
        minSdk = 21
        targetSdk = 34
        versionCode = 3
        versionName = "1.3.0"
    }

    buildTypes {
        release {
            isMinifyEnabled = false
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )
        }
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_1_8
        targetCompatibility = JavaVersion.VERSION_1_8
    }

    kotlinOptions {
        jvmTarget = "1.8"
    }
}

flutter {
    source = "../.."
}

dependencies {}
