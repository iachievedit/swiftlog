import PackageDescription

let package = Package(
    name:"example",
    dependencies:[
      .Package(url:"https://github.com/iachievedit/swiftlog", majorVersion:1)
    ]
                )
