//
//  MirrorDetectorView.m
//  Lineman
//
//  Created by Matt Luedke on 7/5/13.
//  Copyright (c) 2013 Matt Luedke. All rights reserved.
//

#import "MirrorDetectorView.h"

@implementation MirrorDetectorView

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
    // Drawing code here.
    [super drawRect:dirtyRect];
}

-(void)redefinePt1:(NSPoint)rawPt1 andPt2:(NSPoint)rawPt2 andPt3:(NSPoint)rawPt3 andPt4:(NSPoint)rawPt4 andPt5:(NSPoint)rawPt5 forScreenWidth:(float)width andHeight:(float)height {
        
    pt1 = NSMakePoint((rawPt1.x * width), (rawPt1.y * height));
    pt2 = NSMakePoint((rawPt2.x * width), (rawPt2.y * height));
    pt3 = NSMakePoint((rawPt3.x * width), (rawPt3.y * height));
    pt4 = NSMakePoint((rawPt4.x * width), (rawPt4.y * height));
    pt5 = NSMakePoint((rawPt5.x * width), (rawPt5.y * height));
    
    
}


@end
