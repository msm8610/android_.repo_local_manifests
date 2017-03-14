Manifest for Android KitKat / OmniROM 4.4
====================================
Project FalconSS|XperiaE1

---

Automatic Way:

script to download manifests, sync repo  and build:

    curl --create-dirs -L -o build.sh -O -L https://raw.github.com/TeamVee-SS/android_.repo_local_manifests/android-4.4/build.sh

To use:

    source build.sh

---

Manual Way:

To initialize OmniROM 4.4 Repo:

    repo init -u git://github.com/omnirom/android.git -b android-4.4 -g all,-notdefault,-darwin

---

To initialize Manifest for Xperia E1 devices:

    curl --create-dirs -L -o .repo/local_manifests/falconss_manifest.xml -O -L https://raw.github.com/TeamVee-SS/android_.repo_local_manifests/android-4.4/falconss_manifest.xml


---

Sync the repo:

    repo sync

---

Initialize the environment:

    source build/envsetup.sh

---

To build for Xperia E1:

    brunch falconss
