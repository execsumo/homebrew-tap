# AGENTS.md — execsumo/homebrew-tap

Personal Homebrew tap for `execsumo`'s projects. One tap, many formulas/casks —
do not create a new tap repo per project. Tapped as `execsumo/tap`
(Homebrew maps `user/tap` → the `homebrew-tap` repo automatically).

## Layout

- `Formula/*.rb` — CLI tools / cross-platform binaries (installed via `brew install <name>`)
- `Casks/*.rb` — macOS `.app` bundles distributed as a DMG (installed via `brew install --cask <name>`)

Use a **Formula** for a Go/Rust/etc. CLI binary. Use a **Cask** for a macOS `.app`.

## Pattern: adding a new CLI tool (Formula)

Reference: `Formula/dossier.rb`, sourced from `execsumo/dossiers`.

1. In the project's own repo, its release CI (e.g. `.github/workflows/release.yml`)
   already builds per-platform binaries on `git push --tags` and uploads them to a
   GitHub Release along with a `checksums.txt` (via `sha256sum`).
2. Add a job to that same workflow (see `execsumo/dossiers/.github/workflows/release.yml`,
   job `update-tap`) that runs **after** the release job:
   - reads `checksums.txt` from the just-published release,
   - regenerates `Formula/<name>.rb` from a heredoc template (version + per-platform
     `url`/`sha256`, using `on_macos`/`on_linux` + `Hardware::CPU.arm?` blocks),
   - clones this tap repo with a `GH_PAT` secret, commits, and pushes to `main`.
3. The project's repo needs a `GH_PAT` secret: a **fine-grained PAT**, scoped to
   *only* this tap repo (`execsumo/homebrew-tap`), with **Contents: Read and write**.
   Generate at https://github.com/settings/tokens?type=beta. This tap repo itself
   needs no secrets — it's just a push target.
4. Formula skeleton (adapt name/desc/platforms):

```ruby
class Name < Formula
  desc "One-line description"
  homepage "https://github.com/execsumo/<repo>"
  version "X.Y.Z"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/execsumo/<repo>/releases/download/vX.Y.Z/<name>-darwin-arm64"
      sha256 "..."
    else
      url "https://github.com/execsumo/<repo>/releases/download/vX.Y.Z/<name>-darwin-amd64"
      sha256 "..."
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/execsumo/<repo>/releases/download/vX.Y.Z/<name>-linux-arm64"
      sha256 "..."
    else
      url "https://github.com/execsumo/<repo>/releases/download/vX.Y.Z/<name>-linux-amd64"
      sha256 "..."
    end
  end

  def install
    bin.install Dir["<name>-*"].first => "<name>"
  end

  test do
    system "#{bin}/<name>", "--version"
  end
end
```

5. Bootstrap the first version by hand once (clone this repo, add the file, push),
   then verify: `brew untap execsumo/tap 2>/dev/null; brew tap execsumo/tap && brew install --formula <name>`.
6. Document in the project's own README: `brew tap execsumo/tap && brew install <name>`
   to install, `brew upgrade <name>` to update.

## Pattern: adding a new macOS app (Cask)

Reference: `Casks/heard.rb`, sourced from `execsumo/heard` (project repo `Heard`).

1. The project's release CI builds a notarized, signed DMG and publishes it to a
   GitHub Release, printing its SHA256.
2. CI's release job (see `execsumo/Heard/.github/workflows/ci.yml`) then, in the same
   run: `sed`-patches `Casks/<name>.rb` in the *project's own repo* with the new
   `version`/`sha256`, commits that back to the project repo, **then** clones this tap
   repo (same `GH_PAT` secret pattern as above), copies the updated cask file over, and
   pushes.
3. Cask skeleton (adapt name/paths/bundle id):

```ruby
cask "name" do
  version "X.Y.Z"
  sha256 "..."

  url "https://github.com/execsumo/<repo>/releases/download/v#{version}/Name-#{version}.dmg"
  name "Name"
  desc "One-line description"
  homepage "https://github.com/execsumo/<repo>"

  depends_on macos: :sequoia  # adjust to actual minimum OS

  app "Name.app"

  uninstall quit: "com.execsumo.name"

  zap trash: [
    "~/Library/Application Support/Name",
    "~/Library/Caches/com.execsumo.name",
    "~/Library/Preferences/com.execsumo.name.plist",
    "~/Library/Saved Application State/com.execsumo.name.savedState",
  ]
end
```

4. Document in the project's own README: `brew tap execsumo/tap && brew install --cask <name>`
   to install, `brew upgrade --cask <name>` to update.

## Shared conventions

- Formula/cask class or block name matches the filename (lowercase, no dashes unless
  the tool name has one).
- Every project's own release workflow owns pushing to this tap — this repo is a pure
  publish target, never hand-edited for routine version bumps.
- Each project repo holds its own `GH_PAT` secret (fine-grained, scoped to this repo,
  Contents: Read/write). There's no way to share one secret across repos on a personal
  GitHub account — generate a fresh token per project.
- Don't rename this tap again without updating every project's workflow that pushes to
  it (search each project repo for `homebrew-tap`).
