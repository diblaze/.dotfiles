# Dotfiles

Managed with [yadm](https://yadm.io). Supports CachyOS/Arch (KDE Plasma 6) and macOS.

## Install

### 1. Prerequisites

**Arch / CachyOS:**
```bash
sudo pacman -S --needed yadm git
```

**macOS:**
```bash
xcode-select --install          # git
brew install yadm               # or install Homebrew first (bootstrap does it too)
```

### 2. Clone

Clone over **HTTPS** — the SSH key lives in Bitwarden, which isn't set up yet:

```bash
yadm clone https://github.com/USERNAME/dotfiles.git
```

If yadm reports conflicts with existing default files:
```bash
yadm status
# back up or discard the conflicting file, then:
yadm checkout <file>
```

### 3. Bootstrap

yadm offers to run it right after clone. To run manually:
```bash
yadm bootstrap
```

Installs packages, antidote, mise runtimes, VS Code extensions, and (Linux only)
yay, IBus autostart, and KWin tiling config.

### 4. Bitwarden SSH agent

1. Open Bitwarden desktop, log in
2. **Settings → enable SSH agent**
3. Verify the socket path matches `~/.config/environment.d/ssh-agent.conf` (Linux)
   or the export in `.zshrc##os.Darwin` (macOS)
4. Switch the remote to SSH:
```bash
yadm remote set-url origin git@github.com:USERNAME/dotfiles.git
ssh -T git@github.com
```

### 5. Log out and back in

Required on Linux for: zsh as default shell, IBus env vars, KWin changes.

First shell launch is slow while antidote caches plugins. One-time.

## Verify

```bash
echo $SHELL                 # zsh
echo $GTK_IM_MODULE         # ibus (Linux only)
echo $SSH_AUTH_SOCK         # bitwarden socket
antidote list               # plugins loaded
yadm status                 # clean
```

## Structure

| File | Purpose |
|------|---------|
| `.zshrc##os.Linux` / `##os.Darwin` | Shell config, per-OS |
| `.zsh_plugins.txt` | antidote plugin list |
| `.config/yadm/bootstrap##os.*` | Per-OS setup scripts |
| `.config/ghostty/config` | Terminal |
| `.tmux.conf` | tmux |
| `.config/environment.d/*.conf` | Session env vars (Linux/systemd only) |
| `.config/Code/User/settings.json` | VS Code |
| `.config/mise/config.toml` | Runtime versions |

## Notes

- `plasmazones-bin` pins an exact KWin version and often lags Plasma updates.
  The bootstrap tolerates its failure — install manually when the AUR catches up.
- Ghostty over SSH: remote hosts may not know `xterm-ghostty`. Fix per-server with
  `infocmp -x xterm-ghostty | ssh user@host -- tic -x -`
