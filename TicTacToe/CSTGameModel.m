#import "CSTGameModel.h"

NSUInteger indexOfLocation(id<CSTInterfaceLocation> where);
BOOL isLocationInBounds(id<CSTInterfaceLocation> where);
const NSUInteger SPACES_ON_BOARD = 9;

@implementation CSTGameModel
{
    CSTPlayerID moves[SPACES_ON_BOARD]; //For storing all moves
    CSTPlayerID currentTurn;
    NSUInteger playsMade;
}

- (id)init
{
    self = [super init];
    if (self) {
        //Initialze game over state
        [self setGameOverState:CSTGO_GameNotOver];
        //Set first player to X
        currentTurn = CSTID_PlayerEx;
        //Clear the board
        playsMade=0;
        for(NSUInteger i=0; i<SPACES_ON_BOARD; i+=1)  moves[i] = CSTID_NOBODY;
    }
    return self;
}

- (BOOL)isLegalMove:(id <CSTInterfaceMove>)aMove
{
    if(!isLocationInBounds(aMove)) return NO;
    if([self whosePieceIsAt:aMove] != CSTID_NOBODY) return NO;
    return YES;
}

- (void)makeMove:(id <CSTInterfaceMove>)aMove
{
    //Set the move at aMove's index to aMove's player
    moves[indexOfLocation(aMove)] = [aMove player];
    
    //Count the play
    playsMade+=1;
    
    //Update turn
    switch(currentTurn)
    {
        case CSTID_PlayerEx: currentTurn=CSTID_PlayerOh; break;
        case CSTID_PlayerOh: currentTurn=CSTID_PlayerEx; break;
        case CSTID_NOBODY: //Oh noes!
            @throw [NSException exceptionWithName:@"Illegal game mode"
                                          reason:@"Nobody's turn"
                                        userInfo:nil];
    }
    
    //That may have ended the game
    [self updateGameOverState];
}

- (CSTPlayerID)whoseTurnIsIt
{
    return currentTurn;
}

- (CSTPlayerID)whosePieceIsAt:(id <CSTInterfaceLocation>)aLocation
{
    NSUInteger index = indexOfLocation(aLocation);
    return moves[index];
}

- (CSTPlayerID) commonPlayerAtIndex: (NSUInteger) firstIndex
                           andIndex: (NSUInteger) secondIndex
                           andIndex: (NSUInteger) thirdIndex
{
    CSTPlayerID testPoint = moves[firstIndex];
    if(testPoint == CSTID_NOBODY) return CSTID_NOBODY;
    if(testPoint != moves[secondIndex]) return CSTID_NOBODY;
    if(testPoint != moves[thirdIndex]) return CSTID_NOBODY;
    return testPoint;    
}

-(BOOL) winningComboAtIndex: (NSUInteger) firstIndex
                   andIndex: (NSUInteger) secondIndex
                   andIndex: (NSUInteger) thirdIndex
{
    CSTGameOverID winnerFound;
    //Assume the worst
    BOOL gameOverFound=YES;
    
    switch ([self commonPlayerAtIndex:firstIndex
                             andIndex:secondIndex
                             andIndex:thirdIndex])
    {
        case CSTID_PlayerEx: winnerFound = CSTGO_WinnerEx; break;
        case CSTID_PlayerOh: winnerFound = CSTGO_WinnerOh; break;
            //Oh, guess we didn't find a winner
        case CSTID_NOBODY: gameOverFound=NO; break;
    }

    if(gameOverFound)
        [self setGameOverState:winnerFound];

    return gameOverFound;
}

-(void) updateGameOverState
{
    //Check columns
    if([self winningComboAtIndex:0 andIndex:3 andIndex:6]) return; //winningCombo
    if([self winningComboAtIndex:1 andIndex:4 andIndex:7]) return; //auto-sets
    if([self winningComboAtIndex:2 andIndex:5 andIndex:8]) return; //gameOverState
    
    //Check rows
    if([self winningComboAtIndex:0 andIndex:1 andIndex:2]) return;
    if([self winningComboAtIndex:3 andIndex:4 andIndex:5]) return;
    if([self winningComboAtIndex:6 andIndex:7 andIndex:8]) return;
    
    //Check diagonals
    if([self winningComboAtIndex:0 andIndex:4 andIndex:8]) return;
    if([self winningComboAtIndex:6 andIndex:4 andIndex:2]) return;

    //If no moves left, it's a tie
    if(playsMade>=SPACES_ON_BOARD) [self setGameOverState:CSTGO_CatsGame]; //we set this one
}
@end

NSUInteger indexOfLocation(id<CSTInterfaceLocation> where)
{
    return [where x] + 3*[where y];
}

BOOL isLocationInBounds(id<CSTInterfaceLocation> where)
{
    //Unsigned integers are never negative,
    //so we need no lower bound checks, only upper bound
    return ([where x]<3 && [where y]<3);
}