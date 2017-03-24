Manifest for Android Nougat / LineageOS 14.1 (WIP)
====================================
Project Shuang|XperiaE1

---

Automatic Way:

script to download manifests, sync repo  and build:

    curl --create-dirs -L -o build.sh -O -L https://raw.github.com/TeamVee-SS/android_.repo_local_manifests/cm-14.1/build.sh

To use:

    source build.sh

---

Manual Way:

To initialize LineageOS 14.1 Repo:

    repo init -u git://github.com/LineageOS/android.git -b cm-14.1 -g all,-notdefault,-darwin

---

To initialize Manifest for Xperia E1 devices:

    curl --create-dirs -L -o .repo/local_manifests/roomservice.xml -O -L https://raw.github.com/TeamVee-SS/android_.repo_local_manifests/cm-14.1/roomservice.xml

---

Sync the repo:

    repo sync

---

Initialize the environment:

    source build/envsetup.sh

---

If Jack run out of memory <http://wiki.lineageos.org/mako_build.html#configure-jack>:

    export ANDROID_JACK_VM_ARGS="-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx4G"

---

To build for Xperia E1:

    brunch falconss
