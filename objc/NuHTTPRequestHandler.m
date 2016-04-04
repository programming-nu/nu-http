#import "NuHTTPRequestHandler.h"
#import "NuHTTPRequest.h"
#import "NuHTTPResponse.h"
#import "NuHTTPService.h"

@interface NuHTTPRequestHandler ()
@property (nonatomic, strong) NSString *httpMethod;
@property (nonatomic, strong) NSString *path;
@property (nonatomic, strong) id block;
@property (nonatomic, strong) NSArray *parts; // used to expand pattern for request routing
@end

@implementation NuHTTPRequestHandler
@synthesize httpMethod, path, block, parts;

+ (NuHTTPRequestHandler *) handlerWithHTTPMethod:(id)httpMethod path:(id)path block:(id)block
{
    NuHTTPRequestHandler *handler = [[NuHTTPRequestHandler alloc] init];
    handler.httpMethod = httpMethod;
    handler.path = path;
    handler.parts = [[NSString stringWithFormat:@"%@%@", httpMethod, path]
                     componentsSeparatedByString:@"/"];
    handler.block = block;
    return handler;
}

+ (NuHTTPRequestHandler *) handlerWithPath:(NSString *) path directory:(NSString *) directory
{
    NuHTTPRequestHandler *handler = [[NuHTTPRequestHandler alloc] init];
    handler.httpMethod = @"GET";
    handler.path = path;
    handler.parts = [[NSString stringWithFormat:@"%@%@", @"GET", path]
                     componentsSeparatedByString:@"/"];
    handler.block = ^(NuHTTPRequest *REQUEST) {
        NSString *path = [REQUEST.bindings objectForKey:@"*path"];
        NSData *data = [NSData dataWithContentsOfFile:
                        [directory stringByAppendingPathComponent:path]];
        if (data) {
            NuHTTPResponse *response = [[NuHTTPResponse alloc] init];
            response.body = data;
            [response setValue:[[NuHTTPService sharedService] mimeTypeForFilename:path]
                 forHTTPHeader:@"Content-Type"];
            [response setValue:@"max-age=3600"
                 forHTTPHeader:@"Cache-Control"];
            return response;
        } else {
            return (NuHTTPResponse *) nil;
        }
    };
    return handler;
}

static Class NuBlock;
static Class NuCell;

+ (void) initialize {
    NuBlock = NSClassFromString(@"NuBlock");
    NuCell = NSClassFromString(@"NuCell");
}

// Handle a request. Used internally.
- (NuHTTPResponse *) responseForHTTPRequest:(NuHTTPRequest *) request;
{
    // NSLog(@"handling request %@", [[request URL] description]);
    @autoreleasepool {
        if (NuBlock && NuCell && [self.block isKindOfClass:NuBlock]) {
            id args = [[NuCell alloc] init];
            [args performSelector:@selector(setCar:) withObject:request];
            return [self.block performSelector:@selector(evalWithArguments:context:)
                                    withObject:args
                                    withObject:[NSMutableDictionary dictionary]];
        } else {
            return ((id(^)(id)) self.block)(request);
        }
    }
}

@end
