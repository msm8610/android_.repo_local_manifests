Manifest for Android Nougat / LineageOS 14.1 (WIP)
====================================
Project FalconSS|XperiaE1

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

    curl --create-dirs -L -o .repo/local_manifests/falconss_manifest.xml -O -L https://raw.github.com/TeamVee-SS/android_.repo_local_manifests/cm-14.1/falconss_manifest.xml


---

Sync the repo:

    repo sync

---

Initialize the environment:

    source build/envsetup.sh

---

To build for Xperia E1:

    brunch falconss
