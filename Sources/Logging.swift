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

public func SLogVerbose(_ logString:String) {
  SLog(logLevel:.Verbose, logString:logString.green)
}

public func SLogInfo(_ logString:String) {
  SLog(logLevel:.Info, logString:logString.white)
}

public func SLogWarning(_ logString:String) {
  SLog(logLevel:.Warning, logString:logString.yellow)
}

public func SLogError(_ logString:String) {
  SLog(logLevel:.Error, logString:logString.red)
}

public func ENTRY_LOG(functionName:String = #function) {
  SLogVerbose("ENTRY " + functionName)
}

public func EXIT_LOG(functionName:String = #function) {
  SLogVerbose("EXIT  " + functionName)
}

public func slogToFile(atPath path:String, append:Bool = false) {
  let fileManager = NSFileManager.defaultManager()
  slogFilePath = path

  if let logFile = slogFilePath {
    if !append || !fileManager.fileExists(atPath:path) {
      _ = fileManager.createFile(atPath:logFile, contents:nil, attributes:nil)
    }
  }
}

func SLog(logLevel:SLogLevel, logString:String) {
  
  let log = stringForLogLevel(logLevel:logLevel) + " - " + logString
  let appLogLevel = slogLevel.rawValue
  if (appLogLevel >= logLevel.rawValue) {
    print(log)
    if let logFilePath = slogFilePath,
       let fileHandle = NSFileHandle(forWritingAtPath:logFilePath),
       let data       = log.data(using:NSUTF8StringEncoding) {
        _ = fileHandle.seekToEndOfFile()
	fileHandle.writeData(data)
	fileHandle.closeFile()
    }
  }
}

func stringForLogLevel(logLevel:SLogLevel) -> String {
  Rainbow.outputTarget = .Console
  switch logLevel {
  case .Verbose:
    return "VERBOSE".green.bold
  case .Info:
    return "INFO   ".white.bold
  case .Warning:
    return "WARNING".yellow.bold
  case .Error:
    return "ERROR  ".red.bold
  case .None:
    return "NONE"
  }

}
