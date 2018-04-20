/**
 * Get name input
 * Calculate grid size and number of cells for text
 * Identify the grid cells where the text can live
 *  - need provisions for text with spaces
 * locate the text in a cell
 * create a text objects for all other cells
 * 
 */

///<reference path = "C:\Users\Charlie\Documents\Personal\P5\p5-zip\addons\TypeScript Files\p5.global-mode.d.ts" />
////<reference path = "C:\Users\Charlie\Documents\Personal\P5\p5-zip\Finding_Myself\cls_Cells.d.ts" />

//#region ----GLOBAL VARIABLES----
var startAscii = 32;
var endAscii = 254;
var letters = [];                                   // this will hold the text from the text box
var cells = [];                                     // this will hold the XY values of the grid cells
var canvas, textBox, button;                        // UI elements
var name;                                           // cls_Text Object
var canvasSize = 800;
var minNumGridX, minNumGridY;                       // minimum grid size, number of cells
var maxNumGridX, maxNumGridY;                       // maximum grid size, number of cells
var drawGrid = false;
var debug = true;
//#endregion ----GLOBAL VARIABLES----

function setup() {
    name = "";
    minNumGridX = minNumGridY = 10;                 // minimum 10 cells, default value
    maxNumGridX = maxNumGridY = minNumGridX + 10;   // maximum 20 cells, default value

    canvas = createCanvas(canvasSize, canvasSize);  // create canvas
    console.log(canvas);
    background(0);
    frameRate(10);

    textBox = createInput("", "text");              // create input text box
    textBox.position(canvas.canvas.offsetLeft, height + 10);    // position text box
    console.log(textBox);                           // get the text box value

    button = createButton("Run", "run");            // create button
    button.position(textBox.width + 10, textBox.y); // position button
    button.mousePressed(GetTextBoxInfo);            // attach event to button object
    console.log(button);

    fill(0, 102, 153);
    noStroke();
    textStyle(BOLD);
    /* stroke(255, 23, 23);
    strokeWeight(1);
     line(width/2, height/2, width/2, 20);
     line(width/2, height/2, 20, height/2);
     noFill();
     rect(width/2, height/2, 20, -20);
     noStroke();*/
}

function draw() {

    if (drawGrid) {
        LocateTextInGrid();
        DrawGrid();
    }

    if (name.value != undefined) {
        text(name, width / 2, height / 2);
    }
}

/* 
 * Get the text from the text box
 * Calculate the cell sizes for the grid
 * Calculate 2D array of cells (XY locations on canvas)
*/
function GetTextBoxInfo() {
    name = textBox.value();                             // get value from text box
    if (debug)
        console.log("Input text is of length: " + name.length);

    if (name.length <= 0)                               // if there is no text in the text box
        return;

    drawGrid = true;

    minNumGridX = minNumGridY = 10;                 // minimum 10 cells, default value
    maxNumGridX = maxNumGridY = minNumGridX + 10;   // maximum 20 cells, default value

    if (minNumGridX < name.length) {                    // check minimum grid count
        minNumGridX = minNumGridY = name.length;        // get the length of the input text
        maxNumGridX = maxNumGridY = minNumGridY + 10;
    }

    var w = width / maxNumGridX;                        // calculate cell width
    var h = height / maxNumGridY;                       // calculate cell height
    cells = [];
    for (var i = 0; i < maxNumGridX; i++) {
        var tempCells = [];
        for (var j = 0; j < maxNumGridY; j++) {
            var cell = new cls_Cell(i * w, j * h);      // create a cell
            tempCells.push(cell);                       // save the row of cells
        }
        cells.push(tempCells);                          // save the columns of cells
    }
    console.log(cells);

    if (debug) {
        console.log("Minimum grid X: " + minNumGridX + " Maximum grid X: " + maxNumGridX + " | Minimum grid Y: " + minNumGridY + " Maximum grid Y: " + maxNumGridY);
        console.log("Draw grid: " + drawGrid);
    }
}

/*
 * Identify the appropiate cells where the text can live
 * If the text has spaces, locate the words in the grid
*/
function LocateTextInGrid() {
    var locX = Math.floor(random(0, maxNumGridX - name.length));
    var locY = Math.floor(random(0, maxNumGridY - name.length));
    var textOrientation = Math.floor(random(0, 2));      // 0 = horizontal, 1 = vertical
    if (debug) {
        var orientation = (!textOrientation) ? "HORIZONTAL" : "VERTICAL";
        console.log("Orientation is: " + orientation +
            " X loc: " + locX + " Y loc: " + locY);
    }

    letters = [];
    for (var i = 0; i < cells.length; i++) {                     // populate gird with random letters
        var tempLetters = [];
        for (var j = 0; j < cells[i].length; j++) {
            var letter = random(startAscii, endAscii);          // get a random ascii value
            letter = String.fromCharCode(letter);               // convert ascii to char
            tempLetters.push(letter);                           // save the letter
        }
        letters.push(tempLetters);                              // save the letter into a list of letters
    }

    if (textOrientation == 0) {                                   // if text is horizontal
        for (var i = locX; i < name.length + locX; i++) {
            letters[i][locY] = name[i - locX];
        }
    } else {                                                     // if text is vertical
        for (var i = locY; i < name.length + locY; i++) {
            letters[locX][i] = name[i - locY];
        }
    }
    if (debug)
        console.log(letters);

    drawGrid = false;
}

/*
 * add the grid of text to the canvas
*/
function DrawGrid() {

    background(0);
    var w = width / maxNumGridX;
    var h = height / maxNumGridY;
    if (debug)
        console.log("Box width: " + w + " Box height: " + h);

    textSize(w * 0.66);
    fill(0, 102, 153);

    for (var i = 0; i < maxNumGridX; i++) {
        for (var j = 0; j < maxNumGridY; j++) {
            text(letters[i][j], (i + 0.25) * w, (j + 0.75) * h);
        }
    }
    drawGrid = false;
}

/*
 *If the user presses ENTER
*/
function keyPressed() {
    if (keyCode === 13) {
        GetTextBoxInfo()
    }
}

//createElement("Input", "HI");