Manifest for Android Oreo / LineageOS 15.0 (WIP)
====================================
Project Shuang|XperiaE1

---

Manual Way:

To initialize LineageOS 15.0 Repo:

    repo init -u git://github.com/LineageOS/android.git -b lineage-15.0 -g all,-notdefault,-darwin

---

To initialize Manifest for Xperia E1 devices:

    curl --create-dirs -L -o .repo/local_manifests/roomservice.xml -O -L https://raw.github.com/TeamVee-SS/android_.repo_local_manifests/lineage-15.0/roomservice.xml

---

Sync the repo:

    repo sync

---

Initialize the environment:

    source build/envsetup.sh

---

To build for Xperia E1:

    brunch shuang

