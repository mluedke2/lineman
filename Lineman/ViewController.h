//
//  ViewController.h
//  TrackpadTest
//
//  Created by Matt Luedke on 6/19/13.
//  Copyright (c) 2013 Matt Luedke. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class DetectorView;

@interface ViewController : NSViewController {
    
    IBOutlet NSImageView *attackDot1;
    CGPoint attackDot1Movement;
        
    NSTimer *theTimer;
    
    DetectorView *detectorView;
    
}
@property (nonatomic) CGPoint attackDot1Movement;
@property (strong, nonatomic) IBOutlet NSImageView *attackDot1;

-(void)initializeTimer;
-(void)ballMovementLogic;


@end
