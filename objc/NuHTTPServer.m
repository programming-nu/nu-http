//
//  NuHTTPServer.m
//  NuHTTP
//
//  Created by Tim Burks on 2/24/12.
//  Copyright (c) 2012 Radtastical Inc. All rights reserved.
//
#import "NuHTTPServer.h"
#import "NuHTTPService.h"

#import "NuCocoaHTTPServer.h"
#import "NuLibEVHTPServer.h"

@implementation NuHTTPServer
@synthesize service = _service, port, localOnly, verbose;

- (id)initWithService:(NuHTTPService *) service
{
    if (self = [super init]) {
        self.service = service;
        self.port = 8080;
        self.localOnly = NO;
        self.verbose = NO;
        
        NSArray *arguments = [[NSProcessInfo processInfo] arguments];
        for (int i = 0; i < [arguments count]; i++) {
            NSString *argument = [arguments objectAtIndex:i];
            if (([argument isEqualToString:@"-p"] || [argument isEqualToString:@"--port"]) &&
                (i+1 < [arguments count])) {
                self.port = [[arguments objectAtIndex:++i] intValue];
            }
            else if (([argument isEqualToString:@"-l"] || [argument isEqualToString:@"--local"])) {
                self.localOnly = YES;
            }
            else if (([argument isEqualToString:@"-v"] || [argument isEqualToString:@"--verbose"])) {
                self.verbose = YES;
            }
        }
    }
    return self;
}

- (id) init
{
    return [self initWithService:[NuHTTPService sharedService]];
}

- (void) start
{
    
}

- (void) run
{
    
}

+ (void) run
{
    if ([self isEqual:[NuHTTPServer class]]) {
#ifdef DARWIN
        [[[NuCocoaHTTPServer alloc] init] run];
#else
        [[[NuLibEVHTPServer alloc] init] run];
#endif
    } else {
        [[[self alloc] init] run];
    }
}

- (void) addEventWithOperation:(NSOperation *) operation
{
	
}

@end
