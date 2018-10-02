
// let path = "201808-citibike-tripdata/Short_File_01.csv";
let urlPath = "https://raw.githubusercontent.com/Crashnorun/Coding_Sketchbook/D3_Barchart_02/D3/BarChart_02/Short_File_01.csv";
//let nums = [20, 30, 40];

function draw() {
    let years = [];

    let data = d3.csv(urlPath, function (d) {
        years.push(d["birth year"]);
    });

    console.log("Years: " + years);
    console.log("Extend: " + d3.extent(years));

    let scale = d3.scaleLinear()        //.domain(d3.extent(years))
        .domain(d3.extent(years))
        .range(0, 500);

    console.log("Scale: " + scale);
    console.log("Scale 2000: " + scale(2000));

    let canvas = d3.select("body")
        .append("svg")
        .attr("width", 500)
        .attr("height", 500);

    canvas.append("rect")
        .attr("width", "100%")
        .attr("height", "100%")
        .attr("fill", "pink");
    console.log("Canvas: " + canvas);

    let rect = canvas.selectAll("rect")
        .data(years)
        .enter()
        .append("rect")
        .attr("width", function (d) { return scale(d); })
        .attr("height", 90)
        .attr("fill", "blue")
        .attr("y", function (d, i) { return i * 100; })
}
