
// let path = "201808-citibike-tripdata/Short_File_01.csv";
let urlPath = "https://raw.githubusercontent.com/Crashnorun/Coding_Sketchbook/D3_Barchart_02/D3/BarChart_02/Short_File_01.csv";
let nums = [20, 30, 40];
console.log("Url Path:" + urlPath);



function draw() {

   let data =  d3.csv(urlPath)

    let canvas = d3.select("body")
        .append("svg")
        .attr("width", 500)
        .attr("height", 500)

    console.log(canvas);


    let scale = d3.scaleLinear

    let rect = canvas.selectAll("rect")
        .data(nums)
        .enter()
        .append("rect")
        .attr("width", function (d) { return d; })
        .attr("height", 90)
        .attr("fill", "blue")
        .attr("y", function (d, i) { return i * 100; })
}

//let data = d3.csv(urlPath, function (data){ 


// canvas.selectAll("rect")
//     .data(data)
//     .enter()
//         .append("rect")
//         .attr("width", )
//         .attr("height", 50)
//         .attr("y", )
//         .attr("x")
// });

// let data = d3.csv(urlPath, function (data){ return data; });
// console.log(data);
// console.log(data.length);
