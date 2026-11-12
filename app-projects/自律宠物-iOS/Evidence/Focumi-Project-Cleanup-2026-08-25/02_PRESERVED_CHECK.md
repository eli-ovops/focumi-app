# Preserved check

- All required retained paths exist: `.git`, current Xcode project and `project.yml`, runtime Asset Catalogs, Approved Milo/Max masters, `Design/SelectedDirection`, required current Docs, the five specified release/regression Evidence directories, and this cleanup Evidence directory.
- Runtime asset sentinel counts: AppIcon 1; Milo 47; Max 45; Launch 2; Duration 6.
- `DisciplinedPet/DesignLab` was retained: it has an explicit `project.pbxproj` reference (`path = DesignLab`).
- `reasonix.toml` was retained. No `.reasonix/` deletion was attempted.
- All 67 move-to-trash rows from the before-manifest are absent from their original paths.
- Static reference scan found no deleted directory/file path reference in `project.pbxproj` or `project.yml`. The generic string `build` appears only in Xcode build-setting keys, not as a `build` or `.build` file path.
