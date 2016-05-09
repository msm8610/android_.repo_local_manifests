Manifest for Android KitKat / CyanogenMod 11.0
====================================
Project FalconSS|XperiaE1

---

To initialize CyanogenMod 11.0 Repo:

    repo init -u git://github.com/CyanogenMod/android.git -b cm-11.0 -g all,-notdefault,-darwin

---

To initialize Common Manifest:

    curl --create-dirs -L -o .repo/local_manifests/common_manifest.xml -O -L https://raw.github.com/TeamVee-SS/android_.repo_local_manifests/cm-11.0/common_manifest.xml

---

To initialize Manifest for Xperia E1 devices:

    curl --create-dirs -L -o .repo/local_manifests/falconss_manifest.xml -O -L https://raw.github.com/TeamVee-SS/android_.repo_local_manifests/cm-11.0/falconss_manifest.xml


---

Sync the repo:

    repo sync

---

Initialize the environment:

    source build/envsetup.sh

---

To build for Xperia E1:

    brunch falconss
