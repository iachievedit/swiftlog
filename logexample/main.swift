import swiftlog

func multiply(multiplicand:Int, multiplier:Int) -> Int {
  ENTRY_LOG()
  let result = multiplicand * multiplier
  EXIT_LOG()
  return result
}

slogLevel = .Verbose
slogToFile(atPath:"/tmp/log.txt", append:false)

SLogVerbose(logString:"A verbose log")
SLogInfo(logString:"An info log")
SLogWarning(logString:"A warning log")
SLogError(logString:"An error log")

SLogVerbose(logString:"10 times 10 equals \(multiply(multiplicand:10, multiplier:10))")
