#import <Foundation/Foundation.h>
#import "CSTInterfaceLocation.h"

typedef enum {
    CSTID_NOBODY,
    CSTID_PlayerEx,
    CSTID_PlayerOh
} CSTPlayerID;

@protocol CSTInterfaceMove <CSTInterfaceLocation>

@property (readonly, assign) CSTPlayerID player;

-(id)initWithPlayer:(CSTPlayerID) who
                atX:(NSUInteger) initialX
               andY:(NSUInteger) initialY;
-(id)initWithPlayer:(CSTPlayerID) who
         atLocation:(id<CSTInterfaceLocation>) where;

@end
