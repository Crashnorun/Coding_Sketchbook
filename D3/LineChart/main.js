

var svg = d3.select("svg"),                                             // declare svg object
    margin = { top: 20, right: 20, bottom: 30, left: 50 },              // declare margin object
    width = +svg.attr("width") - margin.left - margin.right,            // declare width object
    height = +svg.attr("height") - margin.top - margin.bottom,          // declare height object
    g = svg.append("g").attr("transform", "translate(" + margin.left + "," + margin.top + ")");     // declare g object

var parseTime = d3.timeParse("%d-%b-%y");                               // parse the date time

var x = d3.scaleTime()                                                  // set X scale to be within 0 - width
    .rangeRound([0, width]);

var y = d3.scaleLinear()                                                // set Y scale to be within 0 and height
    .rangeRound([height, 0]);

var line = d3.line()                                                    // draw axis
    .x(function (d) { return x(d.date); })
    .y(function (d) { return y(d.close); });

// loaded the data file onto github and then linked the raw data file here.
var file = "https://raw.githubusercontent.com/Crashnorun/Coding_Sketchbook/master/D3/LineChart/data.tsv";

//d3.tsv("data.tsv", function (d) {
d3.tsv(file, function (d) {                                             // read data file
    d.date = parseTime(d.date);                                         // parse by date
    d.close = +d.close;
    return d;
}, function (error, data) {
    if (error) throw error;

    x.domain(d3.extent(data, function (d) { return d.date; }));
    y.domain(d3.extent(data, function (d) { return d.close; }));

    g.append("g")
        .attr("transform", "translate(0," + height + ")")
        .call(d3.axisBottom(x))
        .select(".domain")
        .remove();

    g.append("g")
        .call(d3.axisLeft(y))
        .append("text")
        .attr("fill", "#000")
        .attr("transform", "rotate(-90)")
        .attr("y", 6)
        .attr("dy", "0.71em")
        .attr("text-anchor", "end")
        .text("Price ($)");

    g.append("path")
        .datum(data)
        .attr("fill", "none")
        .attr("stroke", "steelblue")
        .attr("stroke-linejoin", "round")
        .attr("stroke-linecap", "round")
        .attr("stroke-width", 1.5)
        .attr("d", line);
});