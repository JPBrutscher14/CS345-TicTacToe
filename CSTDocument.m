//
//  CSTDocument.m
//  Tic-Tac-Toe
//
//  Created by Bryant Adams on 4/30/13.
//  Copyright (c) 2013 Wells CS435: GUI Programming. All rights reserved.
//

#import "CSTDocument.h"
#import "CSTGameModel.h"
#import "CSTMove.h"
#import "CSTInterfaceGameModel.h"


@implementation CSTDocument
{
    //----JPB added Code Starts----
    id<CSTInterfaceGameModel> _myModel;
    //-------JPB added Code Ends -----
}

- (id)init
{
    self = [super init];
    if (self) {
        // Add your subclass-specific initialization here.
        //----JPB added Code Starts-----------
        _myModel = [[CSTGameModel alloc] init];
        [(id) _myModel addObserver: self
                        forKeyPath:@"gameOverState"
                           options: (NSKeyValueObservingOptionNew |
         NSKeyValueObservingOptionOld)
                           context:NULL];
        //----JPB added Code Ends -------------
        
    }
    return self;
}

- (NSString *)windowNibName
{
    // Override returning the nib file name of the document
    // If you need to use a subclass of NSWindowController or if your document supports multiple NSWindowControllers, you should remove this method and override -makeWindowControllers instead.
    return @"CSTDocument";
}

- (void)windowControllerDidLoadNib:(NSWindowController *)aController
{
    [super windowControllerDidLoadNib:aController];
    // Add any code here that needs to be executed once the windowController has loaded the document's window.
}

+ (BOOL)autosavesInPlace
{
    return YES;
}

- (NSData *)dataOfType:(NSString *)typeName error:(NSError **)outError
{
    // Insert code here to write your document to data of the specified type. If outError != NULL, ensure that you create and set an appropriate error when returning nil.
    // You can also choose to override -fileWrapperOfType:error:, -writeToURL:ofType:error:, or -writeToURL:ofType:forSaveOperation:originalContentsURL:error: instead.
    NSException *exception = [NSException exceptionWithName:@"UnimplementedMethod" reason:[NSString stringWithFormat:@"%@ is unimplemented", NSStringFromSelector(_cmd)] userInfo:nil];
    @throw exception;
    return nil;
}

- (BOOL)readFromData:(NSData *)data ofType:(NSString *)typeName error:(NSError **)outError
{
    // Insert code here to read your document from the given data of the specified type. If outError != NULL, ensure that you create and set an appropriate error when returning NO.
    // You can also choose to override -readFromFileWrapper:ofType:error: or -readFromURL:ofType:error: instead.
    // If you override either of these, you should also override -isEntireFileLoaded to return NO if the contents are lazily loaded.
    NSException *exception = [NSException exceptionWithName:@"UnimplementedMethod" reason:[NSString stringWithFormat:@"%@ is unimplemented", NSStringFromSelector(_cmd)] userInfo:nil];
    @throw exception;
    return YES;
}

@end
