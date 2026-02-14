# Magisk Module Guideline Compliance

This document verifies that the Terminal Systemizer module complies with the official Magisk module guidelines.

**Guidelines Reference:** https://topjohnwu.github.io/Magisk/guides.html  
**Last Verified:** 2026-02-14  
**Module Version:** v18.0.0

## Compliance Status: ✅ FULLY COMPLIANT

All mandatory Magisk module guidelines are honored. The module follows the official Magisk module format and best practices for Magisk v20.4+.

---

## Detailed Compliance Checklist

### 1. module.prop Format ✅

**Required Fields (Strict Format):**
- ✅ `id=terminal_systemizer` - Valid format matching `^[a-zA-Z][a-zA-Z0-9._-]+$`
- ✅ `name=App Systemizer (Terminal Emulator)` - Single-line string
- ✅ `version=v18.0.0` - Single-line string
- ✅ `versionCode=80` - Integer value
- ✅ `author=veez21, KreAch3R, Eddict` - Single-line string
- ✅ `description=Turn apps to System Apps Systemlessly! Supports all device running Magisk v20.4+` - Single-line string

**Additional Field:**
- ℹ️ `minMagisk=20400` - While not in the strict official format, this field is commonly used and supported by Magisk Manager for compatibility checking. No action required.

**Format Requirements:**
- ✅ UNIX (LF) line endings
- ✅ All values are single-line strings
- ✅ No invalid characters or formatting

### 2. customize.sh Script ✅

**Script Structure:**
- ✅ customize.sh exists and is properly structured
- ✅ Defines `SKIPMOUNT`, `PROPFILE`, `POSTFSDATA`, `LATESTARTSERVICE` flags
- ✅ Defines `REPLACE` variable for folder replacement
- ✅ Includes `set_permissions()` function

**Variable Usage:**
- ✅ Uses `$MODPATH` (provided by framework)
- ✅ Uses `$TMPDIR` (provided by framework)
- ✅ Uses `$ZIPFILE` (provided by framework)
- ✅ Uses `$MODID` (provided by framework)
- ✅ Uses `$NVBASE` (provided by framework)

**Function Usage:**
- ✅ `ui_print` for console output
- ✅ `set_perm` for setting file permissions
- ✅ `set_perm_recursive` for setting directory permissions
- ✅ `grep_prop` for reading properties

**Best Practices:**
- ✅ No hardcoded module paths (e.g., `/data/adb/modules/...`)
- ✅ No `exit` calls (allows proper cleanup by installer)
- ✅ Properly uses framework-provided variables

**Note:** `MODDIR=${0%/*}` is recommended for boot scripts (`post-fs-data.sh`, `service.sh`) but is not needed in `customize.sh` as it uses `$MODPATH` from the framework. This module has no boot scripts.

### 3. META-INF Structure ✅

**Required Files:**
- ✅ `META-INF/com/google/android/update-binary` - Official `module_installer.sh` from Magisk repository
- ✅ `META-INF/com/google/android/updater-script` - Contains only `#MAGISK`

**Verification:**
- ✅ update-binary is identical to latest official version
- ✅ No custom logic added to update-binary (as required)

### 4. Prohibited Files ✅

**Compliance:**
- ✅ No `install.sh` file (prohibited due to historical reasons)
- ✅ No other prohibited files found

### 5. Module Structure ✅

**Required:**
- ✅ `module.prop` - Module metadata
- ✅ `system/` folder - Contains files to be mounted

**Optional Files (Present):**
- ✅ `customize.sh` - Custom installation logic
- ✅ `common/aapt` - Android Asset Packaging Tool
- ✅ `common/mod-util.sh` - Module utilities

**Optional Files (Not Needed):**
- ⚪ `post-fs-data.sh` - Not needed for this module
- ⚪ `service.sh` - Not needed for this module
- ⚪ `system.prop` - Not needed for this module
- ⚪ `sepolicy.rule` - Not needed for this module
- ⚪ `uninstall.sh` - Not needed for this module

### 6. Best Practices ✅

**Code Quality:**
- ✅ Proper permissions setup with `set_perm` and `set_perm_recursive`
- ✅ Uses official Magisk BusyBox functions
- ✅ Follows modular design principles
- ✅ POSIX-compliant shell scripting
- ✅ Numeric comparisons use `-eq` operator

**Documentation:**
- ✅ Clear and descriptive module name
- ✅ Comprehensive description
- ✅ Proper version management
- ✅ README with usage instructions

---

## Optional Enhancements

The following are optional enhancements that could be added but are not required by the guidelines:

- 🔲 `updateJson` URL in module.prop for OTA update support
- 🔲 Module icon (`ic_launcher.png`) for visual identification in Magisk Manager

---

## Conclusion

✅ **The Terminal Systemizer module FULLY COMPLIES with all mandatory Magisk module guidelines.**

✅ **The module follows current best practices for Magisk v20.4+.**

✅ **No changes are required for guideline compliance.**

---

## References

- [Official Magisk Module Guidelines](https://topjohnwu.github.io/Magisk/guides.html)
- [Official module_installer.sh](https://github.com/topjohnwu/Magisk/blob/master/scripts/module_installer.sh)
- [Magisk Documentation](https://topjohnwu.github.io/Magisk/)
