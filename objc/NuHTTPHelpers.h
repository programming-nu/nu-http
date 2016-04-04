//
//  NuHTTPHelpers.h
//  NuHTTP
//
//  Created by Tim Burks on 2/24/12.
//  Copyright (c) 2012 Radtastical Inc. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface NSString (NuHTTPHelpers)
- (NSString *) urlEncodedString;
- (NSString *) urlDecodedString;
- (NSDictionary *) urlQueryDictionary;
@end

@interface NSData (NuHTTPHelpers)
- (NSDictionary *) urlQueryDictionary;
@end

@interface NSDictionary (NuHTTPHelpers)
- (NSString *) urlQueryString;
- (NSData *) urlQueryData;
@end

@interface NSData (NuBinaryEncoding)
- (NSString *) hexEncodedString;
+ (id) dataWithHexEncodedString:(NSString *) string;
@end

