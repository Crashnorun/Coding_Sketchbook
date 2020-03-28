///<reference path = "C:\Users\cportelli\Documents\01 DLL's\P5\p5-zip\p5.global-mode.d.ts" />

const dim = 5;
let slideX, slideY, slideZ;

function setup() {
    createCanvas(200, 200, WEBGL);
    background(0);
    fill("red");
    //noStroke();
    stroke('white');
    strokeWeight(0.5);

    slideX = createSlider(-200, 200, 0, 1);
    slideY = createSlider(-200, 200, 0, 1);
    slideZ = createSlider(-200, 200, 150, 1);
    
    slideX.style = "style.slider";
    
    camera(slideX.value(), slideY.value(), slideZ.value(),
        0, 0, 0, 0, 1, 0);

    /* default box is drawn at the center of the screen
    when using webgl, the origin 0,0,0 is at the center of the canvas
    */
    box(dim);

    push()
    translate(10, 0, 0);
    fill('blue');
    box(dim);

    translate(10, 0, 10);
    fill('green');
    box(dim);
    pop()
}

function draw() {
    background(0);
    camera(slideX.value(), -slideY.value(), slideZ.value(), 0, 0, 0, 0, 1, 0);

     /* default box is drawn at the center of the screen
    when using webgl, the origin 0,0,0 is at the center of the canvas
    */
   box(dim);

   push()
   translate(10, 0, 0);
   fill('blue');
   box(dim);

   translate(10, 0, 75);
   fill('green');
   box(dim);
   pop()
}
