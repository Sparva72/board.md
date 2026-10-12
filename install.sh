#!/usr/bin/env bash
# Board MD installer for Linux: fetches the app and adds a launcher to the application menu.
set -eu

REPO="redPanther/board.md"
REPO_URL="${BOARDMD_REPO:-https://github.com/$REPO.git}"
ZIP_URL="https://github.com/$REPO/archive/refs/heads/main.zip"
APPS_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/applications"

die() { echo "Error: $*" >&2; exit 1; }

# ---------- where to install ----------
dest=""
if (: </dev/tty) 2>/dev/null; then   # also works when piped: curl ... | bash
    read -r -p "Install into [$(pwd)]: " dest </dev/tty || dest=""
fi
[ -z "$dest" ] && dest="$(pwd)"
dest="${dest/#\~/$HOME}"
mkdir -p "$dest"
dest="$(cd "$dest" && pwd)"

# an existing install (or the repo itself) is updated in place, otherwise we use <dest>/board.md
if [ -f "$dest/boardmd.html" ]; then
    app="$dest"
else
    app="$dest/board.md"
fi

# ---------- fetch ----------
if [ -d "$app/.git" ]; then
    command -v git >/dev/null || die "$app is a git checkout but git is not installed"
    echo "Updating $app ..."
    git -C "$app" pull --ff-only
elif command -v git >/dev/null && { [ ! -e "$app" ] || [ -z "$(ls -A "$app")" ]; }; then
    echo "Cloning into $app ..."
    git clone "$REPO_URL" "$app"
else
    command -v curl >/dev/null || die "need git or curl"
    command -v unzip >/dev/null || die "git not found, and unzip is needed to unpack the download"
    echo "Downloading into $app ..."
    tmp="$(mktemp -d)"
    trap 'rm -rf "$tmp"' EXIT
    curl -fsSL "$ZIP_URL" -o "$tmp/board.zip"
    unzip -q "$tmp/board.zip" -d "$tmp"
    mkdir -p "$app"
    cp -a "$tmp"/*/. "$app"/
fi

[ -f "$app/boardmd.html" ] || die "boardmd.html not found in $app"

# ---------- find a Chromium-based browser ----------
browser=""
for b in chromium chromium-browser google-chrome-stable google-chrome brave-browser microsoft-edge-stable; do
    if command -v "$b" >/dev/null; then browser="$b"; break; fi
done
if [ -z "$browser" ]; then
    echo "Warning: no Chromium-based browser found (chromium, chrome, brave, edge)." >&2
    echo "         Board MD needs one to save files; using 'chromium' in the launcher." >&2
    browser="chromium"
fi

# ---------- desktop entry ----------
url="file://${app// /%20}/boardmd.html"
mkdir -p "$APPS_DIR"
# (a literal % in Exec must be written as %%)
cat > "$APPS_DIR/boardmd.desktop" <<EOF
[Desktop Entry]
Type=Application
Name=Board MD
Comment=Markdown files as Kanban boards
Exec=$browser "--app=${url//%/%%}"
Icon=$app/assets/boardmd.svg
Terminal=false
Categories=Office;ProjectManagement;
EOF
command -v update-desktop-database >/dev/null && update-desktop-database "$APPS_DIR" 2>/dev/null || true

echo
echo "Installed: $app"
echo "Launcher:  $APPS_DIR/boardmd.desktop (browser: $browser)"
echo "Open 'Board MD' from your application menu, or run: $browser --app=$url"
