//
//  CSTTicOrTacOrToe.h
//  TicTacToe
//
//  Created by Josh Brutscher on 5/7/13.
//  Copyright (c) 2013 Joshua Brutscher. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Cocoa/Cocoa.h>
#import "CSTTicOrTacOrToeHost.h"

@interface CSTTicOrTacOrToe : NSImageView

@property (strong) NSString* TicOrTacOrToe;
-(void)setToTic;
-(void)setToTac;
-(void)setToToe;

-(id)initWithFrame:(NSRect) frameRect
           andHost:(id <CSTTicOrTacOrToeHost>) hostingBoard;
@end
