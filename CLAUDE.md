# Board MD – Hinweise für Claude

Kanban-Board als einzelne HTML-Datei (`boardmd.html`), Speicher sind lokale `.md`-Dateien.
Kein Build, keine Dependencies, kein Server. Vanilla JS, bewusst minimal halten.

## Struktur
- `boardmd.html` – die gesamte App (Parser/Serializer, Tabs, Datei-I/O, Rendering, Shortcuts)
- `examples/` – Beispiel-Boards
- `assets/` – Screenshot, Icon, Favicon
- `install.sh` – Linux-Installer (git clone oder zip, legt .desktop-Eintrag an)
- `README.md` – Format, Shortcuts, Browser-Support

## Board-Format
`# Titel` = Board, `## ` = Spalte, `### ` = Karte, Text darunter = Beschreibung, `- [ ]`/`- [x]` = Checkliste.
Flags sind Emoji im Kartentitel. Headings in Code-Fences werden ignoriert, `####`+ bleibt Beschreibung.

## Arbeiten an Board-Dateien (Claude-Sessions)
- Board-Dateien dürfen parallel extern bearbeitet werden, während sie im Browser offen sind.
  Bei externer Änderung gewinnt die Version auf der Platte (die UI lädt neu und zeigt einen Hinweis).
- Beim Schreiben das Format einhalten (Leerzeile nach Headings), die UI normalisiert beim Speichern ohnehin.

## Konventionen
- README aktuell halten, wenn sich Features/Shortcuts ändern.
- Sprache der UI: Englisch. Kommunikation mit Sarah: Deutsch.
