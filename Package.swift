import PackageDescription

let package = Package(
    name:"swiftlog",
    dependencies:[
      //.Package(url:"https://github.com/iachievedit/Rainbow", majorVersion:1)
      .Package(url:"../Rainbow", majorVersion:1)
    ]
                )
