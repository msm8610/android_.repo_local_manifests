#!/bin/bash
# Generic Variables
_android="4.4.4"
_android_version="KitKat"
_custom_android="cm-11.0"
_custom_android_version="LineageOS11"
_github_custom_android_place="LineageOS"
_github_device_place="TeamVee-SS"
# Make loop for usage of 'break' to recursive exit
while true
do
	_if_fail_break() {
		${1}
		if [ "${?}" != "0" ]
		then
			echo "  |"
			echo "  | Something failed!"
			echo "  | Exiting from script!"
			break
		fi
	}
	# Check if 'repo' is installed
	if [ ! "$(which repo)" ]
	then
		echo "  |"
		echo "  | You will need to install 'repo'"
		echo "  | Check in this link:"
		echo "  | <https://source.android.com/source/downloading.html>"
		echo "  | Exiting from script!"
		break
	fi

	# Check if 'curl' is installed
	if [ ! "$(which curl)" ]
	then
		echo "  |"
		echo "  | You will need 'curl'"
		echo "  | Use 'sudo apt-get install curl' to install 'curl'"
		echo "  | Exiting from script!"
		break
	fi

	# Name of script
	echo "  |"
	echo "  | Live Android ${_android_version} (${_android}) - ${_custom_android_version} (${_custom_android}) Sync and Build Script"

	# Repo Sync
	echo "  |"
	echo "  | Starting Sync of Android Tree Manifest"

	# Device
	echo "  |"
	echo "  | For Sony Xperia E1"

	# Remove old Manifest of Android Tree
	echo "  |"
	echo "  | Removing old Manifest before download new one"
	rm -rf .repo/manifests .repo/manifests.git .repo/manifest.xml .repo/local_manifests/

	# Initialization of Android Tree
	echo "  |"
	echo "  | Downloading Android Tree Manifest from ${_github_custom_android_place} branch ${_custom_android}"
	_if_fail_break "repo init -u git://github.com/${_github_custom_android_place}/android.git -b ${_custom_android} -g all,-notdefault,-darwin"

	# Device manifest download
	echo "  |"
	echo "  | Downloading falconss_manifest.xml from ${_github_device_place} branch ${_custom_android}"
	_if_fail_break "curl -# --create-dirs -L -o .repo/local_manifests/falconss_manifest.xml -O -L https://raw.github.com/${_github_device_place}/android_.repo_local_manifests/${_custom_android}/falconss_manifest.xml"

	# Real 'repo sync'
	echo "  |"
	echo "  | Starting Sync:"
	_if_fail_break "repo sync -q --force-sync -f"

	# Initialize environment
	echo "  |"
	echo "  | Initialize the environment"
	_if_fail_break "source build/envsetup.sh"
	
	# Builing Android
	echo "  |"
	echo "  | Starting Android Building!"

	# Dont waste time building libwebviewchromium lib again
	if [ -f "out/target/product/falconss/system/lib/libwebviewchromium.so" ]
	then
		export PRODUCT_PREBUILT_WEBVIEWCHROMIUM=yes
	fi

	# Device
	echo "  |"
	echo "  | For Sony Xperia E1"
	_if_fail_break "brunch falconss"

	# Exit
	break
done

# Goodbye!
echo "  |"
echo "  | Thanks for using this script!"
