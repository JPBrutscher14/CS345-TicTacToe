#import <Foundation/Foundation.h>
#import "CSTInterfaceGameModel.h"

@interface CSTGameModel : NSObject <CSTInterfaceGameModel>
@property (assign, readwrite) CSTGameOverID gameOverState;


@end
