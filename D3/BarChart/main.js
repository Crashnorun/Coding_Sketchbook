
var data = [4, 8, 15, 16, 23, 42];

// var svg = d3.select("svg"),
//     margin = { top: 20, right: 20, bottom: 20, left: 20 },
//     width = + svg.attr("width") - margin.left - margin.right,
//     height = + svg.attr("height") - margin.top - margin.bottom,
//     g = svg.append("g").attr("transform", "translate(" + margin.left + "," + margin.top + ")");

// svg.data(data);



var chart = d3.select(".chart")
    .selectAll("div")
    .data(data)
    .enter().append("div")
    .style("width", function (d) { return d * 10 + "px"; })
    .text(function (d) { return d; });