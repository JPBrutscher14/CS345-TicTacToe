#import "CSTLocation.h"

@implementation CSTLocation
- (id)initWithX:(NSUInteger)initialX
           andY:(NSUInteger)initialY
{
    self = [super init];
    if (self) {
        [self setX:initialX];
        [self setY:initialY];
    }
    return self;
}
@end
