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
        [subview setFrame:self.view.frame];
        if([subview.class isSubclassOfClass:[DetectorView class]]){
            DetectorView *detectorView = (DetectorView *)subview;
            [detectorView redefinePts];
            [detectorView setNeedsDisplay:YES];
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
    
}

@end
