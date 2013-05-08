//
//  CSTTicOrTacOrToe.m
//  CS345 Pente
//
//  Created by Josh Brutscher on 5/7/13.
//  Copyright (c) 2013 Wells CS345: GUI programming. All rights reserved.
//

#import "CSTTicOrTacOrToe.h"

@implementation CSTTicOrTacOrToe
{
    id<CSTTicOrTacOrToeHost> _myBoard;
}
- (id)initWithFrame:(NSRect)frame
{
    //TODO: Make initWithFrame:andBoard: be the designated initializer (initWithFrame: will just pass the buck to it)
    return[self initWithFrame:frame andHost:nil];
    
}
-(void)setToTic{
    
    [self setTicOrTacOrToe:@"Tic"];
    [self setImage:[NSImage imageNamed:@"Tic.png"]];
     }
     
     
     -(void)setToTac{
         
         [self setTicOrTacOrToe:@"Tac"];
         [self setImage:[NSImage imageNamed:@"Tac.png"]];
          }
          
          -(void)setToToe{
              
              [self setTicOrTacOrToe:@"Toe"];
              [self setImage:[NSImage imageNamed:@"Toe.png"]];
               }

- (id)initWithFrame:(NSRect)frameRect andHost:(id <CSTTicOrTacOrToeHost>)hostingBoard
{
    self = [super initWithFrame:frameRect];
    if (self) {
        _myBoard = hostingBoard;
        [self setToToe];
        NSArray* acceptedTypes = @[NSPasteboardTypeString];
        [self registerForDraggedTypes:acceptedTypes];
    }
    return self;
}
int clickCounter = 0;
-(void)mouseDown:(NSEvent *)theEvent
{
    clickCounter+=1;
    if (clickCounter%2)
    {
    [self setToTic];
    } else {
        [self setToTac];
    }
}

@end