# Homebrew Tap for Geant4

Currently experimental and under test - do not use for active work.

# Test procedure
```
$ brew tap drbenmorgan/geant4
$ brew install geant4
```

Try building any example application (compatible with the current 11.0.2
version).

The `geant4` formula is currently built with:

- Multithreading `ON`
- `global-dynamic` TLS, allowing use in both direct linking and dynamic loading
  applications
- GDML support
- Qt support

The data libraries are installed through the `geant4-data` dependency of `geant4`.
You will need to source the `geant4.sh` script in `HOMEBREW_PREFIX/bin` to set up
the needed environment variables.
