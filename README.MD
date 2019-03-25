# Ti.Gradle.Fake #

This is a project created for helping in development of native Titanium
modules for Android in Android Studio.
It does not provide real gradle-powered module build system
(which is why it called so), but it can give you proper navigation and
completion in Android Studio for titanium core and modules code and also
for any of your module dependencies.

## How to use it ##
 1. Go to [release page](https://github.com/drauggres/ti.gradle.fake/releases) and download this repository archive (zip or tar.gz)
 2. Extract content of `ti.gradle.fake-x.y.z` directory from archive into you module directory
 3. Run `migrate.sh` from the `android` directory
 3. Run Android Studio, select `Import project` and choose your module directory
 4. Open the `Project` pane from the left side of the IDE and select the `Project` view
 5. Open `build.gradle` and change `tiSDKName`
 6. Run `Sync Project with Gradle Files` (in `File` menu)

Now you should be able to open you code files from `app/src/main/java`
and have all features provided by IDE.

```bash
 $ ti create -t module --id module.id -n module.name -p android -d .
 $ cd module.name
 $ wget https://github.com/drauggres/ti.gradle.fake/archive/0.0.2.zip
 $ unzip 0.0.2.zip
 $ cp -r ti.gradle.fake-0.0.2/. .
 $ rm -r ti.gradle.fake-0.0.2 0.0.2.zip
 $ cd android
 $ ./migrate.sh
 ```

## Running module build ##
`ti.gradle.fake` also provides task `tiBuild` which is a simple wrapper of
command:

    ti build --build-only --platform android
You can run this task from `Gradle` on the right side or create
`Run configuration`:
 1. Open `Run` menu
 2. Select `Edit configurations`
 3. Click on plus button
 4. Select `Gradle`
 5. Change your configuration name
 6. Select your project
 7. Write task name `tiBuild`

## Dependencies resolving by gradle ##
[Official documentation](https://docs.axway.com/bundle/Titanium_SDK_allOS_en/page/android_module_project.html) says:
> Due to the fact that we do not yet support Gradle, we can not automatically resolve those dependencies for you

So you can use method described in documentation and manually resolve
dependencies and put them into the `android/lib` directory or you can use
`ti.gradle.fake` to do it for you.
1. Clean your `android/lib` directory
2. Put you dependencies in `app/build.gradle` file inside `libs`
 configuration
3. Run `gradlew app:downloadLibrary`

## How it works ##
Your android module stays in old place under `android` directory and
`ti.gradle.fake` uses symbolic links to connect it to directory structure
used by gradle which Android Studio understands.
Also Android Studio will provide code navigation and completion for
libraries defined as dependencies in gradle build scripts.
