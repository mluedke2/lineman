//
//  DetectorView.h
//  TrackpadTest
//
//  Created by Matt Luedke on 6/19/13.
//  Copyright (c) 2013 Matt Luedke. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface DetectorView : NSView {
    
    NSBezierPath *drawingPath;
    
    NSImageView *dot1;
    NSImageView *dot2;
    NSImageView *dot3;
    NSImageView *dot4;
    NSImageView *dot5;
    
    NSPoint pt1;
    NSPoint pt2;
    NSPoint pt3;
    NSPoint pt4;
    NSPoint pt5;
    
    NSColor *lineColor;
    
    NSRect lineRect;
    
    int incomingXDir;
    int incomingYDir;
}

@property (strong, nonatomic) NSImageView *dot1;
@property (strong, nonatomic) NSImageView *dot2;
@property (strong, nonatomic) NSImageView *dot3;
@property (strong, nonatomic) NSImageView *dot4;
@property (strong, nonatomic) NSImageView *dot5;

@property (nonatomic) NSPoint pt1;
@property (nonatomic) NSPoint pt2;
@property (nonatomic) NSPoint pt3;
@property (nonatomic) NSPoint pt4;
@property (nonatomic) NSPoint pt5;

@property (nonatomic) NSColor *lineColor;

@property (nonatomic) NSRect lineRect;

@property (nonatomic) int incomingXDir;
@property (nonatomic) int incomingYDir;

-(void)redefinePts;
- (void)drawDots;

@end
