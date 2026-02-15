# Terminal Systemizer - Compatibility Information

## Android Version Support

### How It Works

Terminal Systemizer detects where Android stores installed app APKs based on the Android API level:

#### Android 6-10 (API 23-29)
**Path Structure**: `/data/app/com.example.app-randomString/base.apk`

Apps are stored in directories named after the package with a random suffix.

#### Android 11+ (API 30+)
**Path Structure**: `/data/app/~~randomHash~~/com.example.app-randomString/base.apk`

Starting with Android 11, Google added an extra layer of randomized directories (the `~~hash~~` part) for improved security.

### Compatibility Status

| Android Version | API Level | Status | Notes |
|----------------|-----------|---------|-------|
| Android 6 (Marshmallow) | 23 | ✅ Verified | Original testing |
| Android 7 (Nougat) | 24-25 | ✅ Verified | Original testing |
| Android 8 (Oreo) | 26-27 | ✅ Verified | Original testing |
| Android 9 (Pie) | 28 | ✅ Verified | Original testing |
| Android 10 | 29 | ✅ Verified | Original testing |
| Android 11 | 30 | ✅ Verified | Tested by KreAch3R, jenslody |
| Android 12 | 31 | ⚠️ Untested | Code supports it (same path as A11) |
| Android 12L | 32 | ⚠️ Untested | Code supports it (same path as A11) |
| Android 13 | 33 | ⚠️ Untested | Code supports it (same path as A11) |
| Android 14 | 34 | ⚠️ Untested | Code supports it (same path as A11) |
| Android 15 | 35 | ⚠️ Untested | Code supports it (same path as A11) |

## Magisk Compatibility

- **Minimum**: Magisk v20.4 (version code 20400)
- **Recommended**: Latest stable Magisk version
- **Template**: Modern Magisk Module Template v2 (customize.sh format)

## Device Compatibility

### Supported Architectures
- ✅ ARM (32-bit)
- ✅ ARM64 (64-bit)
- ✅ x86 (32-bit)
- ✅ x64 (64-bit)

### Known Working Devices
*Help us build this list! Report your device if the module works.*

## Potential Issues on Modern Android

### Android 11+ Storage Access
- **Issue**: Scoped storage restrictions
- **Impact**: May affect manual APK selection from `/sdcard/`
- **Workaround**: Grant storage permissions or use command-line options

### Android 11+ Package Visibility
- **Issue**: Apps can't see all packages without permission
- **Impact**: May affect app listing functionality
- **Workaround**: Run with `-f` flag or set SELinux to permissive

### Android 13+ Themed Icons
- **Issue**: Systemized apps may lose themed icons
- **Impact**: Visual only, doesn't affect functionality
- **Workaround**: None currently

## Testing Checklist

If you're testing on a new Android version, please verify:

- [ ] Module installs without errors
- [ ] `systemize` command runs successfully
- [ ] Can list installed apps (`systemize -l`)
- [ ] Can systemize an app from the list (option 1)
- [ ] Can systemize an app by package name (option 2)
- [ ] Can systemize an APK file (option 3)
- [ ] Systemized app appears in `/system/app` or `/system/priv-app`
- [ ] Systemized app works correctly after reboot
- [ ] Can revert systemized apps (option 4)

## Reporting Results

Please report your testing results by opening an issue with:

**Device Info**:
- Device model
- Android version (e.g., "Android 14")
- API level (check Settings → About Phone)
- Architecture (arm64, x86, etc.)

**Magisk Info**:
- Magisk version (e.g., "v27.0")
- Magisk app variant (official, delta, etc.)

**Test Results**:
- What worked ✅
- What didn't work ❌
- Any error messages

Your feedback helps improve compatibility for everyone!
