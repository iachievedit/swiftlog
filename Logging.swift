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

enum SLogLevel : Int {
  case None = 0
  case Error
  case Warning
  case Info
  case Debug
}

var slogLevel:  SLogLevel = SLogLevel.None

func SLogDebug(logString:  String) {
  SLog(.Debug, logString)
}

func SLogInfo(logString:  String) {
  SLog(.Info, logString)
}

func SLogWarning(logString:  String) {
  SLog(.Warning, logString)
}

func SLogError(logString:  String) {
  SLog(.Error, logString)
}

func ENTRY_LOG(functionName:  String = __FUNCTION__) {
  SLogDebug("ENTRY " + functionName)
}

func EXIT_LOG(functionName:  String = __FUNCTION__) {
  SLogDebug("EXIT " + functionName)
}

func SLog(logLevel:  SLogLevel, logString:  String) {
  
  let log = stringForLogLevel(logLevel) + " - " + logString
  let appLogLevel = slogLevel.toRaw()
  if (appLogLevel >= logLevel.toRaw()) {
    NSLog(log)
  }
}

func stringForLogLevel(logLevel:  SLogLevel) -> String {
  switch logLevel {
  case .Debug:
      return "DEBUG"
  case .Info:
      return "INFO"
  case .Warning:
      return "WARNING"
  case .Error:
      return "ERROR"
  case .None:
      return "NONE"
  }

}
