Manifest for Android Nougat / LineageOS 14.1
====================================
Project Shuang|XperiaE1

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

To build for Xperia E1:

    brunch shuang

