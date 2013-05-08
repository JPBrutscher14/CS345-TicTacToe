#import <Foundation/Foundation.h>
#import "CSTInterfaceMove.h"
#import "CSTInterfaceLocation.h"

typedef enum {
    CSTGO_WinnerEx,
    CSTGO_WinnerOh,
    CSTGO_CatsGame,
    CSTGO_GameNotOver
} CSTGameOverID;

@protocol CSTInterfaceGameModel <NSObject>

//Do we have a winner?
@property (assign, readonly) CSTGameOverID gameOverState;

// Is ___ a legal place to move? / Is ___ a legal move? (yes/no)
-(BOOL) isLegalMove:(id<CSTInterfaceMove>) aMove;

// Place ___'s stone at ___ / Make move ____
-(void)makeMove:(id<CSTInterfaceMove>) aMove;

// Whose turn is it? (White/Black)
-(CSTPlayerID) whoseTurnIsIt;

// What piece is at location _____? (White/Black/Empty)
-(CSTPlayerID) whosePieceIsAt:(id<CSTInterfaceLocation>) aLocation;

@end
