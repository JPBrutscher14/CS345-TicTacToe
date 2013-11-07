#import <Foundation/Foundation.h>
#import "CSTLocation.h"
#import "CSTInterfaceMove.h"

@interface CSTMove : CSTLocation <CSTInterfaceMove>
@property (assign) CSTPlayerID player;
//JPB Code Begins
@property (assign) NSUInteger x;
@property (assign) NSUInteger y;
//@property (assign) CSTPlayerID player;
//JPB Code Ends
@end
