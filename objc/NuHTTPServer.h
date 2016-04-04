//
//  NuHTTPServer.h
//  NuHTTP
//
//  Created by Tim Burks on 2/24/12.
//  Copyright (c) 2012 Radtastical Inc. All rights reserved.
//
#import <Foundation/Foundation.h>

@class NuHTTPService;

//
// NuHTTPServer
// A common interface for Objective-C web servers
//
@interface NuHTTPServer : NSObject 
@property (nonatomic, assign) unsigned port;
@property (nonatomic, assign) BOOL localOnly;
@property (nonatomic, assign) BOOL verbose;
@property (nonatomic, strong) NuHTTPService *service;

- (id)initWithService:(NuHTTPService *) service;
- (void) start;
- (void) run;
- (void) addEventWithOperation:(NSOperation *) operation;

@end

