//
//  CSTTicOrTacOrToeHost.h
//  TicTacToe
//
//  Created by Josh Brutscher on 5/7/13.
//  Copyright (c) 2013 Joshua Brutscher. All rights reserved.
//

#import "Foundation/Foundation.h"

@class CSTTicOrTacOrToe;

@protocol CSTTicOrTacOrToeHost <NSObject>
-(BOOL) isTicTacOrToe:(NSString*) whichMark
         legalAtSpace: (CSTTicOrTacOrToe*) whichSpace;
-(void)clickTicOrTac: (NSString*) whichMark
           ontoSpace:(CSTTicOrTacOrToe*) whichSpace;


@end
