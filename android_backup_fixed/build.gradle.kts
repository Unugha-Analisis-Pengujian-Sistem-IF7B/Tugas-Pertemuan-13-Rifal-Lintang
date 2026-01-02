// File: android/build.gradle.kts

plugins {
    id("com.android.application") apply false
    id("org.jetbrains.kotlin.android") version "2.0.21" apply false
}

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

// Set lokasi build Flutter agar tidak bentrok
val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}

subprojects {
    project.evaluationDependsOn(":app")
}

// Tambahkan task clean (membersihkan hasil build)
tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
