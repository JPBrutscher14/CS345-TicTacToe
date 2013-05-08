#import <Foundation/Foundation.h>
#import "CSTInterfaceLocation.h"

@interface CSTLocation : NSObject <CSTInterfaceLocation>
@property (assign) NSUInteger x;
@property (assign) NSUInteger y;

@end
