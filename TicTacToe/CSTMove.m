#import "CSTMove.h"

@implementation CSTMove
- (id)initWithPlayer:(CSTPlayerID)who
                 atX:(NSUInteger)initialX
                andY:(NSUInteger)initialY
{
    self = [super initWithX:initialX
                       andY:initialY];
    if (self) {
        [self setPlayer:who];
    }
    return self;
}

- (id)initWithPlayer:(CSTPlayerID)who
          atLocation:(id <CSTInterfaceLocation>)where
{
    return [self initWithPlayer:who
                            atX:[where x]
                           andY:[where y]];
}

@end
