//
//  DDLogLib.m
//  DDLogLib
//
//  Created by huyt on 15/11/19.
//  Copyright © 2015年 infocare. All rights reserved.
//

#import "DDLogLib.h"

#import "DDLog.h"
#import "DDFileLogger.h"
#import "DDTTYLogger.h"

static int ddLogLevel	= LOG_LEVEL_INFO;

@implementation DDLogLib

- (void)printABC{
	NSLog(@"ABC");
	
	DDLogFileManagerDefault *logFileManager = [[DDLogFileManagerDefault alloc] init];
	DDFileLogger* _fileLogger = [[DDFileLogger alloc] initWithLogFileManager:logFileManager];
	_fileLogger.rollingFrequency = 60 * 60 * 24; // 24 hour rolling
	_fileLogger.logFileManager.maximumNumberOfLogFiles = 7; // a weeks worth
	
	//#ifdef DEBUG
	[DDLog addLogger:[DDTTYLogger sharedInstance]];// this is log to xcode window.
	//#else
	[DDLog addLogger:_fileLogger];
	//#endif
	
	DDLogInfo(@"DDLog ABC");
}

@end
