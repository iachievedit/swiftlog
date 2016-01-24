import swiftlog

func multiply(multiplicand:Int, multiplier:Int) -> Int {
  ENTRY_LOG()
  let result = multiplicand * multiplier
  EXIT_LOG()
  return result
}

slogLevel = .Verbose
slogToFileAtPath("/tmp/log.txt", append:false)

SLogVerbose("A verbose log")
SLogInfo("An info log")
SLogWarning("A warning log")
SLogError("An error log")

SLogVerbose("10 times 10 equals \(multiply(10, multiplier:10))")
