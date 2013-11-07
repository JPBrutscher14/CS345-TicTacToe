//
//  CSTBoardView.m
//  TicTacToe
//
//  Created by Josh Brutscher on 5/7/13.
//  Copyright (c) 2013 Joshua Brutscher. All rights reserved.
//

#import "CSTBoardView.h"
#import "CSTTicOrTacOrToe.h"
#import "CSTLocation.h"


const int BOARD_SIZE = 500;
const int GRID_SQUARES = 3;
const int GRID_SIZE = BOARD_SIZE/(GRID_SQUARES);
int screenoffset = 200;

@implementation CSTBoardView
{
    NSMapTable* ourMapTable;
    NSMutableArray* twoDArray;
}

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
        ourMapTable = [NSMapTable mapTableWithKeyOptions:NSPointerFunctionsStrongMemory
                                            valueOptions:NSPointerFunctionsStrongMemory];
        twoDArray = [NSMutableArray array];
        
        
        NSRect jpbRect;
        CSTTicOrTacOrToe* tempMark;
        NSPoint location;
        
        CSTLocation* tempLocation;
        // int offset=GRID_SIZE/2;
        int numPlaces = 3;
        
        for(int x=0; x<numPlaces; x+=1)
        {
            NSMutableArray* tempRowArray = nil;
            tempRowArray = [NSMutableArray array];
            for(int y=0; y<numPlaces; y+=1)
            {
                location.x =x*GRID_SIZE+screenoffset;
                location.y = y*GRID_SIZE+screenoffset;
                jpbRect = NSMakeRect(location.x, location.y, GRID_SIZE, GRID_SIZE);
                tempMark = [[CSTTicOrTacOrToe alloc] initWithFrame:jpbRect andHost:self];
                [self addSubview:tempMark];
                [tempRowArray addObject: tempMark];
                tempLocation = [[CSTLocation alloc] initWithX:x andY:y];
                [ourMapTable setObject: tempLocation forKey:tempMark];
                
            }
            [twoDArray addObject: tempRowArray];
        }
        
    }
    
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
    // Drawing code here.
    [super drawRect:dirtyRect];
    [self drawGrid];
}

- (void)drawGrid
{
    
    NSPoint startPoint;
    NSPoint endPoint;
    NSBezierPath * path = [NSBezierPath bezierPath];
    //Sketch horizontal lines
    for (int i=screenoffset; i<BOARD_SIZE+screenoffset; i+=GRID_SIZE)
    {
        startPoint = NSMakePoint(screenoffset, i);
        endPoint   = NSMakePoint(BOARD_SIZE+screenoffset, i);
        [path  moveToPoint:startPoint];
        [path lineToPoint:endPoint];
    }
    
    //Sketch vertical lines
    for (int i=screenoffset; i<BOARD_SIZE+screenoffset; i+=GRID_SIZE)
    {
        startPoint = NSMakePoint(i, screenoffset);
        endPoint   = NSMakePoint(i, BOARD_SIZE+screenoffset);
        [path  moveToPoint: startPoint];
        [path lineToPoint:endPoint];
    }
    
    //Ink the sketch
    [[NSColor blackColor] set];
    [path setLineWidth: 2];
    [path stroke];
    
}


-(void)setMark:(CSTTicOrTacOrToe *) ticTacOrToeObject
toMark: (NSString *) markString
{
if([markString isEqualToString:@"tic"])
{
    [ticTacOrToeObject setToTic];
} else if([markString isEqualToString:@"tac"]) {
    [ticTacOrToeObject setToTac];
} else if([markString isEqualToString:@"toe"]) {
    [ticTacOrToeObject setToToe];
} else {
    NSLog(@"Error, bad mark %@ for space", markString);
}
}
/*
-(void)mouseDown:(NSEvent *)theEvent
{
    [self setTo
}
*/
@end
