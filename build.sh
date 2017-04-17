#!/bin/bash
# Generic Variables
_android="7.1.2"
_android_version="Nougat"
_custom_android="cm-14.1"
_custom_android_version="LineageOS14.1"
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
	echo "  | Downloading Xperia E1 Manifest from ${_github_device_place} branch ${_custom_android}"
	_if_fail_break "curl -# --create-dirs -L -o .repo/local_manifests/roomservice.xml -O -L https://raw.github.com/${_github_device_place}/android_.repo_local_manifests/${_custom_android}/roomservice.xml"

	# Real 'repo sync'
	echo "  |"
	echo "  | Starting Sync:"
	_if_fail_break "repo sync -q --force-sync -f"

	# external/iw: Fix builds with .git at top
	if [[ -d .git ]]
	then
		export CUR_DIR=$(pwd)
		cd ${CUR_DIR}/external/iw
		git fetch https://android.googlesource.com/platform/external/iw refs/changes/08/307208/1 && git cherry-pick FETCH_HEAD
		git reset
		cd ${CUR_DIR}/
	fi

	# Initialize environment
	echo "  |"
	echo "  | Initialize the environment"
	_if_fail_break "source build/envsetup.sh"

	# SELinux please, don't skip starting a service with no domain if permissive
	repopick -f 60713 142846

	# Builing Android
	echo "  |"
	echo "  | Starting Android Building!"
	echo "  | For Sony Xperia E1"
	if [[ "$(free -m | awk '/^Mem:/{print ${2}}')" -lt "4096" ]]
	then
		echo "  | Using Optimizations for building Android Nougat+ in 4GB RAM System"
		echo "  | Forcing JACK VM to use only 3GB due low-ram"
		sleep 5
		export ANDROID_JACK_VM_ARGS="-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx3G"
		echo "  | Forcing JACK Server to use only 1 Background Service"
		sleep 5
		if [[ -f "~/.jack-server/config.properties" ]]
		then
			if [[ "$(cat ~/.jack-server/config.properties | grep jack.server.max-service=1 | wc -l)" == "0" ]]
			then
				sed -i "/jack.server.max-service=*/c\jack.server.max-service=1" ~/.jack-server/config.properties
			fi
		fi
		if [[ -f "~/.jack" ]]
		then
			if [[ "$(cat ~/.jack | grep SERVER_NB_COMPILE=1 | wc -l)" == "0" ]]
			then
				sed -i "/SERVER_NB_COMPILE=*/c\SERVER_NB_COMPILE=1" ~/.jack
			fi
		fi
		echo "  | Cleaning old JACK Session"
		sleep 5
		rm -fr /tmp/jack-*
		jack-admin kill-server
		breakfast shuang
		mka -j2 bacon
	else
		brunch shuang
	fi

	# Exit
	break
done

# Goodbye!
echo "  |"
echo "  | Thanks for using this script!"
