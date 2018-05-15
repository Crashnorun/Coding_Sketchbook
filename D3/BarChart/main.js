/**
 * By adding the non minified D3 file into the project directory
 * adds intellisense to this document.
 * Reference link: http://bl.ocks.org/Caged/6476579
 */

var svg = d3.select("svg");
var margin = { top: 20, right: 20, bottom: 20, left: 20 },
    width = + svg.attr("width") - margin.left - margin.right,
    height = + svg.attr("height") - margin.top - margin.bottom;

var formatPercent = d3.format(".0%");

var x = d3.scaleOrdinal([0, width]);
var y = d3.scaleLinear([height, 0]);

var xAxis = d3.axisBottom(x);
// xAxis.name = "bottom";
var yAxis = d3.axisLeft(y).tickFormat(formatPercent);
var tip = d3.tip().attr("class", "d3-tip").offset();

// var tip = d3.tip()
//   .attr('class', 'd3-tip')
//   .offset([-10, 0])
//   .html(function(d) {
//     return "<strong>Frequency:</strong> <span style='color:red'>" + d.frequency + "</span>";
//   })

svg = d3.select("body").append("svg")
    .attr("width", width + margin.left + margin.right)
    .attr("height", height + margin.top + margin.bottom)
    .append("g")
    .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

svg.call(tip);

var file = "https://raw.githubusercontent.com/Crashnorun/Coding_Sketchbook/master/D3/BarChart/data.tsv";
d3.tsv(file, type, function (error, data) {
    x.domain(data.map(returnLetter));
    y.domain([0, d3.max(data, returnFrequency)]);
})

function returnFrequency(d) {
    return d.frequency;
}

function returnLetter(d) {
    return d.letter;
}

function type(d) {
    d.frequency = +d.frequency;
    return d;
}
