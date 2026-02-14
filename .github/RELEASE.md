# Creating a Release

This repository uses GitHub Actions to automatically build and publish Magisk module releases.

## How to Create a Release

1. **Update version in `module.prop`**:
   ```
   version=v18.1.0
   versionCode=81
   ```

2. **Update changelog in `README.md`**

3. **Commit changes**:
   ```bash
   git add module.prop README.md
   git commit -m "Bump version to v18.1.0"
   git push
   ```

4. **Create and push a tag**:
   ```bash
   git tag v18.1.0
   git push origin v18.1.0
   ```

5. **GitHub Actions will automatically**:
   - Create a clean Magisk module ZIP
   - Create a GitHub Release
   - Attach the ZIP as a downloadable asset

## Manual Release (Alternative)

If you prefer to create releases manually:

```bash
# Create the ZIP
zip -r terminal_systemizer-v18.1.0.zip \
  META-INF/ \
  common/ \
  system/ \
  customize.sh \
  module.prop

# Then create release on GitHub and upload the ZIP
```

## Verification

After release creation, verify the ZIP:
```bash
unzip -l terminal_systemizer-v18.1.0.zip
```

Should show only module files, no `.git`, `.md`, or `.gitattributes` files.
