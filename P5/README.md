# P5

## P5 Libraries

The P5 folder contains a series of sketches that are using the [P5.js](https://p5js.org/) library. P5 references three main files

- P5.js
- P5.dom.js
- P5.sound.js

Each of the files listed above has a .min.js file which is the minified js file.

## Intellisense

There are also two TypeScript files:

- P5.d.ts
- P5.global-mode.d.ts

The TypeScript files are used for intellisense when using Visual Studio Code as your IDE. You can find more information about these files at [this link](https://github.com/processing/p5.js/issues/1339). To use the intellisense you must reference the file in your JavaScript file by using the syntax below:
```javascript
///referencepath="<folder location>\p5.global-mode.d.ts";
```
Replace &lt;folder location&gt; with the directory where your p5.global-mode.d.ts file is located on your drive.

## IDE

All these sketches are created in Visual Studio Code as an IDE. It&#39;s a great environment to code and debug these projects. The .vscode folder contains the necessary JSON files for debugging.

- launch.json contains the necessary info to launch the index.html file associated with each project.
- tasks.json contains the file path to launch Chrome.
