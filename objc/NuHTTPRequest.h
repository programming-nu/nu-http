//
//  NuHTTPRequest.h
//  NuHTTP
//
//  Created by Tim Burks on 2/24/12.
//  Copyright (c) 2012 Radtastical Inc. All rights reserved.
//
#import <Foundation/Foundation.h>

@class NuHTTPServer;

@protocol NuHTTPResponder <NSObject>
- (void) respondWithMessageData:(NSData *) data;
@end

@interface NuHTTPRequest : NSObject
@property (nonatomic, strong) NSURL *URL;
@property (nonatomic, strong) NSString *method;
@property (nonatomic, strong) NSDictionary *headers;
@property (nonatomic, strong) NSData *body;
@property (nonatomic, strong) NSMutableDictionary *bindings;
@property (nonatomic, strong) NSString *scheme;

- (NSString *) path;
- (NSString *) fragment;
- (NSString *) query;
- (NSDictionary *) cookies;
- (NSDictionary *) post;
- (NSString *) hostWithPort;

@property (nonatomic, weak) id<NuHTTPResponder> connection;
@property (nonatomic, weak) NuHTTPServer *server;
@property (nonatomic, assign) void *context;

@end
