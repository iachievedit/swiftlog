//
//  Logging.swift
//
//  Copyright (c) 2014 iAchieved.it LLC.
//  All rights reserved.
//
//  Redistribution and use in source and binary forms are permitted
//  provided that the above copyright notice and this paragraph are
//  duplicated in all such forms and that any documentation,
//  advertising materials, and other materials related to such
//  distribution and use acknowledge that the software was developed
//  by iAchieved.it LLC. The name of the
//  iAchieved.it LLC may not be used to endorse or promote products derived
//  from this software without specific prior written permission.
//  THIS SOFTWARE IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR
//  IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED
//  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
//

import Foundation
import Rainbow

public enum SLogLevel:Int {
  case None = 0
  case Error
  case Warning
  case Info
  case Verbose
}

public var slogLevel:SLogLevel = SLogLevel.None

private var slogFilePath:String? = nil

public func SLogVerbose(_ logString:String, filePath:String = #file, lineNumber:Int = #line) {
  SLog(logLevel:.Verbose, logString:logString.green, filePath:filePath, lineNumber:lineNumber)
}

public func SLogInfo(_ logString:String, filePath:String = #file, lineNumber:Int = #line) {
  SLog(logLevel:.Info, logString:logString.white, filePath:filePath, lineNumber:lineNumber)
}

public func SLogWarning(_ logString:String, filePath:String = #file, lineNumber:Int = #line) {
  SLog(logLevel:.Warning, logString:logString.yellow, filePath:filePath, lineNumber:lineNumber)
}

public func SLogError(_ logString:String, filePath:String = #file, lineNumber:Int = #line) {
  SLog(logLevel:.Error, logString:logString.red, filePath:filePath, lineNumber:lineNumber)
}

public func ENTRY_LOG(functionName:String = #function, filePath:String = #file, lineNumber:Int = #line) {
  SLogVerbose("ENTRY " + functionName, filePath:filePath, lineNumber:lineNumber)
}

public func EXIT_LOG(functionName:String = #function, filePath:String = #file, lineNumber:Int = #line) {
  SLogVerbose("EXIT  " + functionName, filePath:filePath, lineNumber:lineNumber)
}

public func slogToFile(atPath path:String, append:Bool = false) {
  let fileManager = FileManager.default()
  slogFilePath = path

  if let logFile = slogFilePath {
    if !append || !fileManager.fileExists(atPath:path) {
      _ = fileManager.createFile(atPath:logFile, contents:nil, attributes:nil)
    }
  }
}

func SLog(logLevel:SLogLevel, logString:String, filePath:String, lineNumber:Int) {
  let date = Date()
  let fileUrl = URL(fileURLWithPath:filePath)!
  let log  = "\(date) - \(fileUrl.lastPathComponent):\(lineNumber) - " + stringForLogLevel(logLevel:logLevel) + " - " + logString + "\n"
  let appLogLevel = slogLevel.rawValue
  if (appLogLevel >= logLevel.rawValue) {
    print(log, terminator:"")
    if let logFilePath = slogFilePath,
       let fileHandle = FileHandle(forWritingAtPath:logFilePath),
       let data       = log.data(using:String.Encoding.utf8) {
        _ = fileHandle.seekToEndOfFile()
	fileHandle.write(data)
	fileHandle.closeFile()
    }
  }
}

func stringForLogLevel(logLevel:SLogLevel) -> String {
  Rainbow.outputTarget = .Console
  switch logLevel {
  case .Verbose:
    return "VERBOSE".green
  case .Info:
    return "INFO   ".white
  case .Warning:
    return "WARNING".yellow
  case .Error:
    return "ERROR  ".red
  case .None:
    return "NONE"
  }

}
