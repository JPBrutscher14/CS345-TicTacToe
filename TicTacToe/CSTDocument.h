//
//  CSTDocument.h
//  TicTacToe
//
//  Created by Josh Brutscher on 5/8/13.
//  Copyright (c) 2013 Joshua Brutscher. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "CSTBoardViewDelegate.h"
#import "CSTBoardView.h"

@interface CSTDocument : NSDocument <CSTBoardViewDelegate>

@property (weak) IBOutlet NSTextField *ticTacToeBoard;

-(void)popupGameOverAlertWithWinner:(NSString*) winnerName;

@end
