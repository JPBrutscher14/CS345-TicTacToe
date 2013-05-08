//
//  CSTBoardViewDelegate.h
//  TicTacToe
//
//  Created by Josh Brutscher on 5/8/13.
//  Copyright (c) 2013 Joshua Brutscher. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CSTBoardViewDelegate <NSObject>
-(BOOL) isLegalFor:(NSString*) playerMark
         toMoveAtX:(NSUInteger) x
              andY:(NSUInteger) y;
-(void) executeMoveBy:(NSString*) playerMark
                  atX:(NSUInteger) x
                 andY:(NSUInteger) y;
-(NSString*) getPlayerMarkAtX:(NSUInteger) x
                          andY:(NSUInteger) y;
@end