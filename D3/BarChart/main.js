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

var xAxis = d3.axisBottom(x);
xAxis.name = "bottom";
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

d3.tsv("data.tsv", type, function(error, data) {
    x.domain(data.map(function(d) { return d.letter; }));
    y.domain([0, d3.max(data, function(d) { return d.frequency; })]);
