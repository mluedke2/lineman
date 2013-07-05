//
//  ViewController.m
//  TrackpadTest
//
//  Created by Matt Luedke on 6/19/13.
//  Copyright (c) 2013 Matt Luedke. All rights reserved.
//

#import "ViewController.h"
#import "DetectorView.h"
#import "MirrorDetectorView.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize attackDot1, attackDot1Movement;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Initialization code here.
        [self.view setAcceptsTouchEvents:YES];
        
    }
    
    return self;
}

-(void)resize:(NSNotification *)notif {
    
    [self.view setFrame:NSMakeRect([[notif.userInfo objectForKey:@"x"] floatValue], [[notif.userInfo objectForKey:@"y"] floatValue], [[notif.userInfo objectForKey:@"w"] floatValue], [[notif.userInfo objectForKey:@"h"] floatValue])];
    
    for (NSView *subview in self.view.subviews)
    {
        if([subview.class isSubclassOfClass:[DetectorView class]]){
            [subview setFrame:self.view.frame];
            DetectorView *detectorView = (DetectorView *)subview;
            [detectorView redefinePts];
            [detectorView setNeedsDisplay:YES];
        }
        else if([subview.class isSubclassOfClass:[NSImageView class]]){
            NSRect imageFrame = subview.frame;
            imageFrame.origin = self.view.frame.origin;
            [subview setFrame:imageFrame];
        }
    }
    
    // recreate the points!
    
//    NSLog(@"resized to: height:%.2f, width: %.2f", [[notif.userInfo objectForKey:@"height"] floatValue], [[notif.userInfo objectForKey:@"width"] floatValue]);
    
}

-(void)loadView {
    
    [super loadView];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(resize:) name:@"window_resized" object:nil];
        
    NSRect frame = self.view.frame;
    
    DetectorView *standardDetectorView = [[DetectorView alloc] initWithFrame:frame];
    MirrorDetectorView *mirrorDetectorView = [[MirrorDetectorView alloc] initWithFrame:frame];
    
    // create a view
    int r = arc4random() % 2;
    switch (r) {
        case 0:
            // initialize a standard detectorView
            [self.view addSubview:standardDetectorView];
            break;
        case 1:
            // initialize a mirror detectorView
            [self.view addSubview:mirrorDetectorView];
            break;
        default:
            break;
    }
    
    
    [self.attackDot1 setFrame:NSMakeRect(frame.origin.x, frame.origin.y, 30, 30)];
    
    NSLog(@"origin x:%.2f, y: %.2f", attackDot1.frame.origin.x, attackDot1.frame.origin.y);
    
    [self initializeTimer];
    
}


-(void)initializeTimer {
    
    attackDot1Movement = CGPointMake(1.0, 1.0);
    
    float theInterval = 1.0/60.0;
    theTimer = [NSTimer scheduledTimerWithTimeInterval:theInterval target:self selector:@selector(ballMovementLogic) userInfo:nil repeats:YES];
    
}

-(void)ballMovementLogic {
    
    NSRect newFrame = attackDot1.frame;
    newFrame.origin = CGPointMake(attackDot1.frame.origin.x + attackDot1Movement.x, attackDot1.frame.origin.y + attackDot1Movement.y);
     
    [attackDot1 setFrame:newFrame];
    
    /*
     
     // collision with line 
     // hopefully we can access the line?
     
    // maybe use: http://makemacgames.com/2005/10/24/collision-detection-with-cocoa/
     
     BOOL attackDotCollision = ball.center.y >= paddle.center.y - 32 && ball.center.y <=paddle.center.y + 32 && ball.center.x > paddle.center.x - 120 && ball.center.x < paddle.center.x + 120;
     
     if (paddleCollision) {
     
     ballMovement.y = -ballMovement.y;
     
     if (ball.center.y >= paddle.center.y - 32 && ballMovement.y < 0) {
     ball.center = CGPointMake(ball.center.x, paddle.center.y- 32);
     }
     else if (ball.center.y <= paddle.center.y + 32 && ballMovement.y >0) {
     ball.center = CGPointMake(ball.center.x, paddle.center.y + 32);
     }
     else if (ball.center.x >= paddle.center.x - 120 && ballMovement.x < 0) {
     ball.center = CGPointMake(paddle.center.x - 120, ball.center.y);
     }
     else if (ball.center.x <= paddle.center.x + 120 && ballMovement.x > 0) {
     ball.center = CGPointMake(paddle.center.x + 120, ball.center.y);
     }
     
     }
     */
    
    // window edge collision
     
     if ((attackDot1.frame.origin.x + attackDot1.frame.size.width) > (self.view.frame.origin.x + self.view.frame.size.width) || attackDot1.frame.origin.x < self.view.frame.origin.x) {
     attackDot1Movement.x = -attackDot1Movement.x;
     }
     
     if (attackDot1.frame.origin.y < self.view.frame.origin.y || (attackDot1.frame.origin.y + attackDot1.frame.size.height) > (self.view.frame.origin.y + self.view.frame.size.height)) {
     attackDot1Movement.y = -attackDot1Movement.y;
     }
    
     /*
     if (ball.center.y > 568) {
     [self pauseGame];
     isPlaying = NO;
     lives--;
     livesLabel.text = [NSString stringWithFormat:@"Lives: %i", lives];
     
     if(!lives) {
     messageLabel.text = @"Game Over";
     } else {
     messageLabel.text = @"Ball Out of Bounds";
     }
     messageLabel.hidden = NO;
     }

     
     */
    
}

@end
