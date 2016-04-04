#import <Foundation/Foundation.h>

@class NuHTTPRequest;
@class NuHTTPResponse;
@class NuHTTPRequestHandler;

@interface NuHTTPRequestRouter : NSObject

- (NuHTTPResponse *) responseForHTTPRequest:(NuHTTPRequest *) request;

- (void) insertHandler:(NuHTTPRequestHandler *) handler level:(NSUInteger) level;

@end
