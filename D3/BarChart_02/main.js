
// let path = "201808-citibike-tripdata/Short_File_01.csv";
let urlPath = "https://raw.githubusercontent.com/Crashnorun/Coding_Sketchbook/master/D3/BarChart_02/Short_File_01.csv";
let years = [];

function draw() {

    let tooltip = d3.select("body").append("div")
        .style("position", "absolute")
        .style("background", "black")
        .style("padding", "5 15px")
        .style("border", "1px #333 solid")
        .style("border-radius", "5px")
        .style("opacity", "0");

    // create canvas
    let canvas = d3.select("body")
        .append("svg")
        .attr("width", 500)
        .attr("height", 500);

    // load csv data
    let data = d3.csv(urlPath).then(function (d) {

        for (let i = 0; i < d.length; i++) {                    // save birth year data
            years.push(d[i]["birth year"]);
        }

        let scale = d3.scaleLinear()                            // set a linear domain / range
            .domain(d3.extent(years))
            .range([0, 500]);

        canvas.selectAll("rect")
            .data(years)                                        // data binding
            .enter()                                
            .append("rect")
            .attr("fill", function (d, i) {                     
                let val = Math.round((255 / (years.length + 50)) * (years.length) - i);     // calc fill color
                return "rgb(" + val + "," + val + ",255)";      // format rgb vals
            })
            .attr("y", function (y, i) { return i * (500 / years.length) })     // set height
            .attr("width", function (y) { return scale(y); })   // animate width
                .transition()
                .duration(100)
                .delay(function (d, i) { return i * 25 })
            .attr("height", 500 / years.length - 1)             // set height - bar thickness
    });
}
