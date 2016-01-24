import PackageDescription

let package = Package(
    name:"logexample",
    dependencies:[
      .Package(url:"https://github.com/iachievedit/swiftlog", majorVersion:1)
    ]
)
