//
//  CSTDocument.m
//  TicTacToe
//
//  Created by Josh Brutscher on 5/8/13.
//  Copyright (c) 2013 Joshua Brutscher. All rights reserved.
//

#import "CSTDocument.h"
#import "CSTInterfaceGameModel.h"
#import "CSTMove.h"
#import "CSTGameModel.h"

@implementation CSTDocument
{
    id<CSTInterfaceGameModel> _myModel;
}
-(id)init
{
    self = [super init];
    if (self) {
        _myModel = [[CSTGameModel alloc] init];
        [(id) _myModel addObserver:self forKeyPath:@"gameOverState" options: (NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:NULL];
    }
    return self;
}

- (BOOL)isLegalFor:(NSString *)playerMark
         toMoveAtX:(NSUInteger)x
              andY:(NSUInteger)y
{
    CSTPlayerID thePlayer;
    
    if([playerMark isEqualToString:@"tic"])
        thePlayer = CSTID_PlayerEx;
    else if([playerMark isEqualToString:@"tac"])
        thePlayer = CSTID_PlayerOh;
    else
        thePlayer = CSTID_NOBODY;
    return TRUE; //I don't know, just make this work!
    //return [_myModel isLegalMove:[CSTMove
    
}

- (void)executeMoveBy:(NSString *)playerMark
                  atX:(NSUInteger)x
                 andY:(NSUInteger)y
{
    CSTPlayerID thePlayer;
    
    if([playerMark isEqualToString:@"tic"])
        thePlayer = CSTID_PlayerEx;
    else if([playerMark isEqualToString:@"tac"])
        thePlayer = CSTID_PlayerOh;
    else
        thePlayer = CSTID_NOBODY;
    
    //[_myModel makeMove:[CSTMove moveWithPlayer:thePlayer
    //                                      atX:x andY:y]];
    
    
    [[self ticTacToeBoard] needsDisplay];
    
    //  NSUInteger captures;
    //NSString* capString = nil;
    
    //captures = [_myModel capturesByPlayer:CSTID_PlayerWhite];
    //capString = [NSString stringWithFormat:@"%ld", captures];
    //[[self whiteCounter] setStringValue:capString];
    
    //captures = [_myModel capturesByPlayer:CSTID_PlayerBlack];
    //capString = [NSString stringWithFormat:@"%ld", captures];
    //[[self blackCounter] setStringValue:capString];
}

- (NSString *)getPlayerMarkAtX:(NSUInteger)x
                           andY:(NSUInteger)y
{
    CSTPlayerID pieceCode;
    pieceCode = [_myModel whosePieceIsAt:[[CSTLocation alloc] initWithX:x
                                                                   andY:y]];
    switch(pieceCode)
    {
        case CSTID_PlayerEx: return @"tic";
        case CSTID_PlayerOh: return @"tac";
        case CSTID_NOBODY: return @"empty";
    }
}
 

@end
