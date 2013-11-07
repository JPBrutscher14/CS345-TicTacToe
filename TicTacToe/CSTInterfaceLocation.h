#import <Foundation/Foundation.h>

@protocol CSTInterfaceLocation <NSObject>

@property (readonly, assign) NSUInteger x;
@property (readonly, assign) NSUInteger y;
-(id)initWithX:(NSUInteger) initialX andY:(NSUInteger) initialY;

@end
