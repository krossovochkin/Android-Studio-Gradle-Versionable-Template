<#if !(perModuleRepositories??) || perModuleRepositories>
buildscript {
    repositories {
        mavenCentral()
<#if mavenUrl != "mavenCentral">
        maven {
            url '${mavenUrl}'
        }
</#if>
    }
    dependencies {
        classpath project.GRADLE_PLUGIN_VERSION
    }
}
</#if>
<#if isLibraryProject?? && isLibraryProject>
apply plugin: 'android-library'
<#else>
apply plugin: 'android'
</#if>
<#if !(perModuleRepositories??) || perModuleRepositories>

repositories {
        mavenCentral()
<#if mavenUrl != "mavenCentral">
        maven {
            url '${mavenUrl}'
        }
</#if>
}
</#if>

android {

	compileSdkVersion Integer.parseInt(project.COMPILE_SDK_VERSION)
    buildToolsVersion project.BUILD_TOOLS_VERSION

    defaultConfig {
        minSdkVersion Integer.parseInt(project.MIN_SDK_VERSION)
        targetSdkVersion Integer.parseInt(project.TARGET_SDK_VERSION)
        versionCode Integer.parseInt(project.VERSION_CODE)
        versionName project.VERSION_NAME
    }
	
<#if javaVersion?? && javaVersion != "1.6">

    compileOptions {
        sourceCompatibility JavaVersion.VERSION_${javaVersion?replace('.','_','i')}
        targetCompatibility JavaVersion.VERSION_${javaVersion?replace('.','_','i')}
    }
</#if>
<#if enableProGuard>
    buildTypes {
        release {
            runProguard false
            proguardFiles getDefaultProguardFile('proguard-android.txt'), 'proguard-rules.txt'
        }
    }
</#if>
}

dependencies {
    <#if dependencyList?? >
    <#list dependencyList as dependency>
    compile '${dependency}'
    </#list>
    </#if>
    compile fileTree(dir: 'libs', include: ['*.jar'])
}
