
// let path = "201808-citibike-tripdata/Short_File_01.csv";
let urlPath = "https://raw.githubusercontent.com/Crashnorun/Coding_Sketchbook/master/D3/BarChart_02/Short_File_01.csv";
let years = [];

function draw() {

    // Option 04
    let canvas = d3.select("body")
        .append("svg")
        .attr("width", 500)
        .attr("height", 500);

    let data = d3.csv(urlPath).then(function (d) {

        for (let i = 0; i < d.length; i++) {
            years.push(d[i]["birth year"]);
        }
        
        let scale = d3.scaleLinear()
            .domain(d3.extent(years))
            .range([0, 500]);

        canvas.selectAll("rect")
            .data(years)
            .enter()
            .append("rect")
            .attr("fill", "blue")
            .attr("width", function (y) { return scale(y); })
            .attr("height", 500 / years.length-1)
            .attr("y", function (y, i) { return i * (500 / years.length); })
    });

}
