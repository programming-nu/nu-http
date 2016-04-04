#import <Foundation/Foundation.h>

@class NuHTTPRequest;
@class NuHTTPResponse;

@interface NuHTTPRequestHandler : NSObject 
+ (NuHTTPRequestHandler *) handlerWithHTTPMethod:(id)httpMethod path:(id)path block:(id)block;
+ (NuHTTPRequestHandler *) handlerWithPath:(NSString *) path directory:(NSString *) directory;
- (NuHTTPResponse *) responseForHTTPRequest:(NuHTTPRequest *) request;
@end