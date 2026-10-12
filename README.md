# Board MD

Use plain Markdown files as Kanban boards. One HTML file, no dependencies, no build step, no server. Your data stays on your machine.

Inspired by [Kanban md](https://kanbanmd.lecaro.me/index.html) by Renan Le Caro (not affiliated).

![Kanban MD showing the example board](assets/screenshot_board_md.png)

## Quick start

1. Download `boardmd.html`.
2. Open it in Chrome, Edge, Brave or another Chromium browser.
3. Click **Open** and pick a `.md` file, or **New** to start a board.

Changes are saved to the file automatically. Because boards are plain `.md` files, you can edit them in any text editor, keep them in git, or sync them with tools like Syncthing. Changes made outside the app are picked up within a couple of seconds. If the file changed on disk, the version on disk wins and the app reloads it (unsaved edits in the app are replaced, with a notice in the status bar).

## File format

| Markdown | Meaning |
|---|---|
| `# Title` | Board title |
| `## Heading` | Column |
| `### Heading` | Card |
| Text below a heading | Description (shown as a one-line preview on cards) |
| `- [ ]` / `- [x]` | Checklist, shown as progress (e.g. ☑ 2/4) on the card |

Headings inside code fences are ignored, and headings with four or more `#` stay part of the card description. Text under the board title and column headings is preserved in the file. See [`examples/example_board.md`](examples/example_board.md) for an example.

## Features

- Drag and drop cards and columns
- Multiple boards in tabs
- Copy, cut and paste cards between boards
- Search that fades out non-matching cards
- Colored flags (emoji in the card title)
- Undo and redo per board
- Autosave to disk, no save dialog after the first permission prompt
- Remembers your open boards between visits
- Light and dark theme, follows the system setting

## Shortcuts

Card shortcuts apply to the card under the mouse pointer.

| Key | Action |
|---|---|
| `Enter` / click | Open card |
| `Esc` / `Ctrl+Enter` | Close card, clear search |
| `1`–`8` | Toggle colored flag |
| `Ctrl+C` / `Ctrl+X` / `Ctrl+V` | Copy / cut / paste card (paste goes into the hovered column) |
| `Ctrl+D` | Duplicate card |
| `Del` / `Backspace` | Delete card |
| `Ctrl+Z` / `Ctrl+Shift+Z` | Undo / redo |
| `Ctrl+F` | Search |
| `Ctrl+S` | Save now |
| Double-click background | New column |
| Double-click a title | Rename column or board |

On macOS use `Cmd` instead of `Ctrl`.

## Browser support

Writing back to the original file uses the [File System Access API](https://developer.mozilla.org/docs/Web/API/File_System_API), which works in Chrome, Edge, Opera and Brave.

- **Brave:** enable `brave://flags/#file-system-access-api` and restart.
- **Firefox / Safari:** boards can be opened and edited, and open boards are remembered, but **Save** downloads a new `.md` instead of overwriting the file.

When you reopen the page, Chromium may ask again for file access. Click **Restore boards from last session** in the header to grant it.

## Run it like an app

Chromium browsers can open the page in its own window without tabs or address bar

### Windows
```
chrome app=file:///C:\Users\<your place\boardmd.html
```

### Linux

```
chromium --app=file:///path/to/boardmd.html
```

To add it to your application menu, create `~/.local/share/applications/boardmd.desktop`:

```
[Desktop Entry]
Type=Application
Name=Kanban MD
Exec=chromium --app=file:///path/to/board.html
Icon=/path/to/assets/boardmd.svg
Terminal=false
Categories=Office;ProjectManagement;
```

Replace `chromium` with `google-chrome-stable`, `chromium-browser` as needed. Add `--user-data-dir=$HOME/.config/boardmd` to give the app its own browser profile.


## License

GLP-3.0, see `LICENSE`. Change this to whatever you prefer.
