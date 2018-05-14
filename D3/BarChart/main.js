/**
 * By adding the non minified D3 file into the project directory
 * adds intellisense to this document.
 */

var svg = d3.select("svg");
var margin = { top: 20, right: 20, bottom: 20, left: 20 },
    width = + svg.attr("width") - margin.left - margin.right,
    height = + svg.attr("height") - margin.top - margin.bottom;

var formatPercent = d3.format(".0%");

var x = d3.scaleOrdinal([0, width]);
var y = d3.scaleLinear([height, 0]);

var xAxis = d3.svg.scaleOrdinal; //(x.range).orient.bottom();

console.log(xAxis);
