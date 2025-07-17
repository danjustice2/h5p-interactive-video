# H5P Interactive Video (Enhanced Fork)

Put texts, tasks and other media on top of your video.

[See it in action on H5P.org](https://h5p.org/interactive-video)

## New Features in This Fork

This fork adds two new behavioral control options to give admins more flexibility to control how users interact with interactive videos:

### Hide Video Controls
**Option**: `hideControls` (Boolean, default: false)

Hide the entire video control bar (play/pause button, progress bar, volume, etc.) for a clean, minimalist video experience.

**How it works:**
- Video control bar is completely hidden via CSS
- Interactions (bookmarks, endscreens, etc.) remain fully functional
- Video can still be controlled programmatically
- Keyboard shortcuts remain active (unless also disabled - see below)

### Disable Keyboard Controls
**Option**: `disableKeyboardControls` (Boolean, default: false)

Disable keyboard shortcuts for video control while keeping the visual controls intact.

**Disabled shortcuts:**
- `K` key: Play/pause toggle
- `M` key: Mute/unmute toggle

**How it works:**
- Keyboard event handlers exit early when disabled
- Button tooltips don't show keyboard shortcut hints "(k)" and "(m)"
- Visual controls remain fully functional
- Other accessibility features (tab navigation, screen readers) are preserved

### Configuration Options

Both options are available in the "Behavioral settings" section of the H5P Interactive Video editor:

```json
{
  "override": {
    "hideControls": false,
    "disableKeyboardControls": false
  }
}
```

## Original Documentation

## Contributing

Translators, make sure to read through the [tips for language contributors](https://h5p.org/contributing). A good approach is to check that the updated language file matches the structure of the [norwegian translation](language/nn.json).  

Developers, take a look at the [developer guide](https://h5p.org/developers) which has information on [coding guidelines](https://h5p.org/code-style), [api-references](https://h5p.org/documentation/api/H5P.html) and much more. Before submitting pull-requests, please consider [testing your code thoroughly](https://github.com/h5p/h5p-interactive-video/wiki/Interactive-Video-Testplan-(November-2106-Release)) to speed up the review process.


## Building the distribution files
Downloading these files will not provide you with h5p libraries that you can upload to your system. They will have to be built and packed first.

Pull or download this archive files and go into the main folder. There run

```bash
npm install
```

to get the required modules. Then build the project using

```bash
npm run build
```

or for development with auto-rebuild on changes:

```bash
npm run watch
```

### Creating an H5P Package

After building, you have several options to create an H5P package:

#### Option 1: Manual ZIP Creation (Recommended when CLI doesn't work)
1. Ensure all files are built:
   ```bash
   npm run build
   ```

2. Create a ZIP file containing these files and folders:
   ```
   h5p-interactive-video/
   ├── library.json
   ├── semantics.json
   ├── presave.js
   ├── upgrades.js
   ├── icon.svg
   ├── dist/
   │   ├── h5p-interactive-video.js
   │   └── h5p-interactive-video.css
   └── language/
       ├── .en.json
       ├── af.json
       ├── ar.json
       └── [all other language files...]
   ```

3. **Important**: Rename the ZIP file to `h5p-interactive-video-enhanced.h5p`

4. The `.h5p` file is now ready to upload to your H5P platform!

#### Option 2: Using H5P CLI (if available)
First install the H5P CLI globally:
```bash
npm install -g h5p
```

Then create the package:
```bash
h5p create interactive-video-enhanced.h5p
```

#### Option 3: Using the H5P Hub
Upload the built files directly through your H5P-enabled platform's content creation interface.

Alternatively, you can arrange and zip files manually, but make sure to adhere to the [H5P specification](https://h5p.org/documentation/developers/h5p-specification).

## License

(The MIT License)

Copyright (c) 2012-2014 Joubel AS

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
