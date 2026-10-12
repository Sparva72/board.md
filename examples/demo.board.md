# Demo board

Text under the `#` title is the board description. It is kept in the file but not shown on the board, with one exception: a legend line (below) becomes filter chips.

Legend: 🟥 Urgent · 🟧 In progress · 🟨 Idea · 🟩 Good · 🟦 Info · 🟪 Design

## Backlog

Text under a `##` heading is the column description. Also kept, not shown. Columns can be renamed (double-click), dragged, archived (🗄) or deleted (×).

### Try drag and drop 🟦

Drag cards between columns, or drag a column by its header. Drag a card or column onto another board's tab to move it into that board.

### Flags are just emoji 🟥

Hover a card and press 1 to 8 to toggle a colored square in the title:
1 🟥 2 🟧 3 🟨 4 🟩 5 🟦 6 🟪 7 🟫 8 ⬜

### Legend filter 🟨

The `Legend:` line in the board description shows up as chips above the board. Click one to fade out all cards without that flag. Also recognized: `Farben:`, `Legend:`, `Flags:`.

### Search me

Press Ctrl+F and type "search". Cards that don't match fade out.

### Badges: decided ✅ 🟩

[E] A badge marks this card as decided. `[E]` and `[V]` in a description become badges and can be filtered with the chips above the board.

### Badges: proposal 🟪

[V] This one is only a proposal. Variants like `[V Coding]` keep their text in the badge and count as `[V]` for the filter.

## Doing

### Write the report 🟧

The first line of text is shown as a preview on the card.

- [x] Collect numbers
- [x] Draft outline
- [ ] Write summary
- [ ] Send to team

The checklist above shows as ☑ 2/4 on the card.

### Code blocks are safe

Headings inside code fences are not parsed as columns or cards:

```
## This is not a column
### This is not a card
```

#### Deeper headings

Headings with four or more `#` stay inside the card description.

### Copy, cut, paste 🟦

Hover a card, press Ctrl+C (or Ctrl+X), switch to another board tab, hover a column and press Ctrl+V. The same works for whole columns: hover the column header. Ctrl+D duplicates.

### Undo and redo

Ctrl+Z and Ctrl+Shift+Z work per board, including moves between boards.

## Done

### Open this file in Board MD ✅🟩

Edit it in any text editor too. If the file changes on disk, Board MD reloads it within a couple of seconds and the disk version wins.

### Cross-board links 🟦

Open this demo together with another board that has a card with the same title (flags and punctuation are ignored). The card then shows `↔ Board › Column`; click it to jump there.
