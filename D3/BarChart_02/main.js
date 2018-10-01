

let path = "201808-citibike-tripdata/Short_File_01.csv";

let data = d3.csv(path, function (data){ 
    console.log(data); 
});