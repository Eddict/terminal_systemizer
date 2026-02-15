## App Systemizer (Terminal Emulator)
[More info and details in the XDA Thread](https://forum.xda-developers.com/apps/magisk/module-terminal-app-systemizer-ui-t3585851)

## Download

**Latest Release**: [Download from Releases](https://github.com/Eddict/terminal_systemizer/releases/latest)

Download the latest `terminal_systemizer-v*.zip` file from the [Releases page](https://github.com/Eddict/terminal_systemizer/releases).

 Systemize your App systemlessly!
 Using terminal emulator.
 Enter this command and choose the app you want to systemize.

	systemize

or

	systemize -h
	
 And you will be presented with a list of installed apps.
 And Reboot to apply changes.

## Compatibility

### Tested & Verified
- ✅ **Android 6-10** (API 23-29) - Original developer testing
- ✅ **Android 11** (API 30) - Verified by KreAch3R, jenslody

### Theoretical Support (Code Updated, Untested)
- ⚠️ **Android 12** (API 31) - Should work (using Android 11 path structure)
- ⚠️ **Android 13** (API 32) - Should work (using Android 11 path structure)
- ⚠️ **Android 14** (API 33) - Should work (using Android 11 path structure)
- ⚠️ **Android 15** (API 34) - Should work (using Android 11 path structure)

### Requirements
- **Magisk**: v20.4+ (version code 20400)
- **Root**: Required
- **Architecture**: All (arm, arm64, x86, x64)

### Known Limitations
- Android 11+ requires appropriate storage permissions for manual APK selection
- Some system apps may be blocked by SELinux policies on newer Android versions
- Package visibility may be limited on Android 11+ without QUERY_ALL_PACKAGES

### Help Us Test!
If you've successfully used this module on Android 12+, please report your results:
- Open an issue with your Android version, Magisk version, and device info
- We'll update the compatibility list based on your feedback

## Error?
 Go to the menu and type `logs`, this will upload the log files of this module and will generate a link. Send that :)
 Alternatively, Send `/data/local/tmp/terminal_debloater-verbose.log` in the XDA thread. I'll examine it for problems and will try to fix it.

## Changelog

### v18.0.4
* **CRITICAL FIX**: Actually call set_permissions() in customize.sh
* Fixes "mod-util.sh: No such file or directory" error
* Module now properly installs required files (aapt, mod-util.sh)
* systemize command now works correctly after installation

### v18.0.2
* Updated authorship credits throughout codebase
* Changed donation link to reflect current maintainer
* Added comprehensive credits section

### v18.0.1
* Future-proofed Android version detection code
* Added explicit comments for Android 11+ path handling
* Updated documentation with tested vs theoretical compatibility
* No functional changes for currently supported versions

### v18.0.0
* Modernized to current Magisk module template format
* Updated to use customize.sh instead of install.sh
* Requires Magisk v20.4+ (was v18.0+)
* Updated module installer to latest official version

### v17.4.1
* More Android 11 support by jenslody

### v17.4
* Android 11 support
### v17.3.1
* Updated mod-util
### v17.3
* Updated mod-util
### v17.2.2
* Fix errors systemizing
### v17.2
* Updated mod-util
### v17.1
* Support back Magisk v18
### v17
* Update module template
### v16.2
* Update mod-util
* Support only Magisk v18+!
### v16.1
* Update mod-util
  * Reverted A/B detection
### v16
* Update mod-util
  * Changes related to Magisk's path changes (will be removed when it's added in stable)
  * Better A/B detection
* Add -f option
  * This uses 'Set SELinux' function directly, and only once
* Misc improvements
### v15.1
* Update mod-util
  * This contains a fix for the ProgressBar on small devices (with small dpi)
* Misc improvements
### v15
* Properly fix systemizing when magisk.img is out of space
* Misc improvements
### v14.3
* Fix an error in systemizing large apps
* Move systemize to xbin
* Misc improvements
### v14.2.1
* Misc improvements
### v14.2
* Re-add root detection
* Include app libs when systemizing
### v14.1
* Update module template
### v14
* Add Set SELinux option to make app detection faster
* Make "Enter Label" option faster and more efficient
* Name apk to it's parent folder
* Misc improvements

## Credits

### Original Authors
- **veez21** - Original Terminal Systemizer concept and implementation
- **KreAch3R** - Android 11 support
- **jenslody** - Android 11 support contributions

### Modernization
- **Eddict** - Modern Magisk template migration (v18.0+), GitHub Actions automation, Android 12-15 compatibility updates

### Special Thanks
- The Magisk development team for the modding framework
- XDA Developers community for testing and feedback
