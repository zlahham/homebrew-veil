# homebrew-veil

Homebrew tap for [Veil](https://github.com/zlahham/Veil) — a lightweight macOS menu bar manager.

## Install

```bash
brew tap zlahham/veil
brew install --cask veil
```

## Update

```bash
brew update
brew upgrade --cask veil
```

## Uninstall

```bash
brew uninstall --cask veil
brew untap zlahham/veil
```

## Notes

The cask installs an ad-hoc-signed build (no Apple Developer ID notarization). The cask's `postflight` removes the quarantine attribute so macOS doesn't block the first launch.

Apple Silicon and macOS 14+ only.
