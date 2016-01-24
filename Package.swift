import PackageDescription

let package = Package(
    name:"swiftlog",
    dependencies:[
      .Package(url:"https://github.com/onevcat/Rainbow", majorVersion:1)
    ]
                )
