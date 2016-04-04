//
//  NuHTTPService.h
//  NuHTTP
//
//  Created by Tim Burks on 5/16/13.
//  Copyright (c) 2013 Radtastical Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NuHTTPRequest;
@class NuHTTPResponse;

@interface NuHTTPService : NSObject

+ (NuHTTPService *) sharedService;

- (void) addHandlerWithHTTPMethod:(NSString *) httpMethod path:(NSString *) path block:(id) block;
- (void) addHandlerWithPath:(NSString *) path directory:(NSString *) directory;

- (NuHTTPResponse *) responseForHTTPRequest:(NuHTTPRequest *) request;

- (void) setMimeType:(NSString *) mimeType forExtension:(NSString *) extension;
- (NSString *) mimeTypeForFilename:(NSString *) filename;

@end
