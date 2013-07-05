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

@synthesize detectorView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Initialization code here.
        [self.view setAcceptsTouchEvents:YES];
        
    }
    
    return self;
}


-(void)loadView {
    
    [super loadView];
        
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
