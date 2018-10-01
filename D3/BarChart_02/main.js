

let path = "201808-citibike-tripdata/201808-citibike-tripdata.csv";

let data = d3.csv(path, function (data){ 
    console.log(data); 
});