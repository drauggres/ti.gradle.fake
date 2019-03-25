#!/bin/sh

if [ ! -h ./src ];
then
    git mv src app/src/main/java
    ln -s app/src/main/java src
    git add src
fi

if [ ! -h ./lib ];
then
    git mv lib app/libs
    ln -s app/libs/ lib
    git add lib
fi

if [ -d platform/res ];
then
    git mv platform/res app/src/main/res
else
    if [ ! -e app/src/main/res ];
    then
        mkdir app/src/main/res
        > app/src/main/res/.gitkeep
        git add app/src/main/res/.gitkeep
    fi
fi

if [ ! -h platform/res ];
then
    ln -s ../app/src/main/res platform/res
    git add platform/res
fi

echo "# ti.gradle.fake
/.gradle
/local.properties
/migrate.sh
# ti.gradle.fake" >> .gitignore

git add app .gitignore .gitattributes \
build.gradle gradle gradle.properties gradlew gradlew.bat settings.gradle
