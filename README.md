Android-Studio-Gradle-Versionable-Template
==========================================

##Why?##

If in your Android Studio project there are many modules, then you may have troubles
if new Build Tools, Android API or Gradle plugin released.
You have to change these versions in all build.gradle files.
If you have more than two modules this is annoying.

##How to use##

So, in this repo you will find Android Studio Templates for NewProject and for NewModule.
Everything, you need to do is copy these folders to:
```
%ANDROID_STUDIO_ROOT%\plugins\android\lib\templates\gradle-projects
```
and replace corresponding templates.

Then, when you create new project or new module, you will have in gradle.properties file
in the project root values like:
```
BUILD_TOOLS_VERSION=19.0.3
COMPILE_SDK_VERSION=19
MIN_SDK_VERSION=8
TARGET_SDK_VERSION=19

GRADLE_PLUGIN_VERSION com.android.tools.build:gradle:0.9.+

VERSION_NAME=1.0.0
VERSION_CODE=1
```
You can change these values in one place and they will be applied to all build.gradle files.

##What can I do?##

This version provides one-time change for:
- build tools version
- compile sdk version
- min sdk version
- target sdk version
- gradle plugin version
- version name
- version code

Values in gradle.properties file by default are values choosen in Android Studio when create new project.

##I have existing project already##

If you already have existing project, I strongly recommend you to do such a structure, it's useful.
Just change these values in build.gradle files like:
```
...
	  compileSdkVersion Integer.parseInt(project.COMPILE_SDK_VERSION)
    buildToolsVersion project.BUILD_TOOLS_VERSION

    defaultConfig {
        minSdkVersion Integer.parseInt(project.MIN_SDK_VERSION)
        targetSdkVersion Integer.parseInt(project.TARGET_SDK_VERSION)
        versionCode Integer.parseInt(project.VERSION_CODE)
        versionName project.VERSION_NAME
    }
...
```
and don't forget about 
```
...
	  dependencies {
        classpath project.GRADLE_PLUGIN_VERSION
    }
...	
```

Happy coding!
