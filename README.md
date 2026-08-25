# NovaTerm Homebrew Tap

Official [Homebrew](https://brew.sh) tap for [NovaTerm](https://novaterm.novitasweb.works) — the AI-native terminal with built-in editor, local AI inference via Ollama, and ghost-text predictions.

## Install

```sh
brew tap novitaswebworks/tap
brew install --cask novaterm
```

Or in a single command:

```sh
brew install --cask novitaswebworks/tap/novaterm
```

## Update

```sh
brew upgrade --cask novaterm
```

## Uninstall

```sh
brew uninstall --cask novaterm
# Fully remove all app data:
brew uninstall --zap --cask novaterm
```

## Auto-updating the formula

This tap's Cask formula is **automatically updated** by a GitHub Actions workflow whenever a new NovaTerm release is published. The version and SHA256 checksum are updated without any manual intervention.
