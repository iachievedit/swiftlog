import PackageDescription

let package = Package(
    name:"logexample",
    dependencies:[
      .Package(url:"../", majorVersion:1)
    ]
)
