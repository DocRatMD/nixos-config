# NixOS Configuration

My personal NixOS configuration using flakes, Home Manager, and flake-parts using the dendritic pattern.

## Architecture

- **NixOS:** System configuration
- **Home Manager:** User configuration
- **flake-parts:** Flake organization
- **import-tree:** Automatic module discovery
- **Dendritic pattern:** Feature-oriented configuration modules

## Hosts

| Host | Description |
|---|---|
| `desktop` | Primary NixOS desktop |
| `laptop` | Planned |

## Building

This configuration currently uses assets excluded from Git for licensing reasons.

A fresh clone will require the missing wallpaper assets or adjustments to their references.

## Notes

This repository reflects my personal hardware and preferences. It isn't intended to work on other machines without modification.

## License

My original configuration code is licensed under the [MIT License](LICENSE).

Third-party software and assets referenced by this configuration retain their respective licenses.
