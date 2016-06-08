import PackageDescription

let package = Package(
    name:"swiftlog",
    dependencies:[
      .Package(url:"https://github.com/FredLoh/Rainbow", majorVersion:1, minor:1)
    ]
                )
