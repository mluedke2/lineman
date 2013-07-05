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
    
    IBOutlet DetectorView *detectorView;
       
}

@property (strong, nonatomic) IBOutlet DetectorView *detectorView;

@end
