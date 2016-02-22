CM11 Manifests
========================
Project FalconSS

Local manifests to build Android KitKat 4.4 to Xperia E1 FalconSS

To initialize CM11 Repo:

    repo init -u git://github.com/CyanogenMod/android.git -b cm-11.0 -g all,-notdefault,-darwin

To initialize Repo's:

    curl --create-dirs -L -o .repo/local_manifests/local_manifest.xml -O -L https://raw.github.com/TeamVee-SS/android_.repo_local_manifests/cm-11.0/local_manifest.xml

To sync:

    repo sync

To initialize the environment:

    . build/envsetup.sh

To build:

    brunch falconss
