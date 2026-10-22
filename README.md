# Split Gradient Studio

A single-page tool for building column gradients: a row of 4, 8 or 16 columns that subdivide toward one side, each carrying the same gradient at a different phase. Exports SVG (editable gradients in Figma), CSS, PNG and a seamlessly looping MP4.

Everything lives in `index.html`. There is no build step and no server-side code.

## Run it

Open `index.html` in a browser, or serve the folder with any static server.

## Publish on GitHub Pages

1. Create a new repository on GitHub, for example `split-gradient-studio`.
2. In this folder:

   ```bash
   git init
   git add .
   git commit -m "Split Gradient Studio"
   git branch -M main
   git remote add origin git@github.com:YOUR-USER/split-gradient-studio.git
   git push -u origin main
   ```

3. On GitHub open **Settings → Pages**, set **Source** to *Deploy from a branch*, pick `main` and the `/ (root)` folder, and save.
4. After a minute the tool is live at `https://YOUR-USER.github.io/split-gradient-studio/`.

## Using the tool

- **Columns** picks 4, 8 or 16 columns. **Depth** sets how many times any one column may be split, so a higher depth gives a more uneven hierarchy. **Which split** chooses where the splits go.
- Click a column in the artwork to split it, shift-click or use Merge to join it back, and use Tune to set one column's shift, length and flip by hand.
- **Gradient** holds the colour stops. **Symmetric** folds them so the ends share one colour and the middle another.
- **Per-column variation** shifts, flips and stretches the gradient per column. **Shuffle** re-rolls those; **Rebuild structure** re-rolls the columns; **Randomise** does both.
- **Finish** overlays a blurred copy. **Motion** makes the gradients drift while the shapes stay put.
- **Export**: Download SVG for Figma (one editable gradient per column), Download PNG, or Download MP4 loop for one full drift cycle at 30 fps. Copy buttons put the same code on the clipboard.

## Browser notes

- MP4 export uses the browser's built-in video encoder (WebCodecs) and needs Chrome, Edge or Safari 17 or newer.
- The MP4 writer loads from a CDN (`mp4-muxer`), and the UI font from Google Fonts, so first load needs a connection.
- Settings are remembered in the browser's local storage.
