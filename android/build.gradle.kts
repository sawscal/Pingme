// Top-level build file for PingMe XO

buildscript {
    repositories {
        google()
        mavenCentral()
    }
    dependencies {
        // Google Services plugin (for Firebase and Google Sign-In)
        classpath("com.google.gms:google-services:4.4.0")

        // Kotlin Gradle plugin (update version as needed, e.g., 1.9.0)
        classpath("org.jetbrains.kotlin:kotlin-gradle-plugin:1.9.0")
    }
}

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

// Set a custom root build directory
val newBuildDir = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.set(newBuildDir)

// Set custom build directories for each subproject
subprojects {
    val newSubprojectBuildDir = newBuildDir.dir(project.name)
    project.layout.buildDirectory.set(newSubprojectBuildDir)
    project.evaluationDependsOn(":app")
}

// Clean task
tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
