Manifest for Android 10 / LineageOS 17.1
====================================
Project Shuang|XperiaE1

---

Manual Way:

To initialize LineageOS 17.1 Repo:

    repo init -u git://github.com/LineageOS/android.git -b lineage-17.1

---

To initialize Manifest for Xperia E1 devices:

    curl --create-dirs -L -o .repo/local_manifests/roomservice.xml -O -L https://raw.githubusercontent.com/msm8610/android_.repo_local_manifests/lineage-17.1/roomservice.xml

---

Sync the repo:

    repo sync

---

Initialize the environment:

    source build/envsetup.sh

---

To build for Xperia E1:

    brunch shuang

or
    lunch
    

