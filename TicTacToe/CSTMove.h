#import <Foundation/Foundation.h>
#import "CSTLocation.h"
#import "CSTInterfaceMove.h"

@interface CSTMove : CSTLocation <CSTInterfaceMove>
@property (assign) CSTPlayerID player;

@end
