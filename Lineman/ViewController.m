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
        
        int r = arc4random() % 2;
        switch (r) {
            case 0:
                // make it a standard detectorView
                NSLog(@"detectorView");
                break;
            case 1:
                // make it a mirror detectorView
                NSLog(@"mirrorDetectorView");
               // self.detectorView
                break;
            default:
                break;
        }
    

    }
    
    return self;
}

@end
