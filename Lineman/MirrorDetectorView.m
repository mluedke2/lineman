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

-(void)redefinePts {
    
    float height = self.window.frame.size.height;
    float width = self.window.frame.size.width;
        
    pt1 = NSMakePoint(width-(pt1.x * width), height-(pt1.y * height));
    pt2 = NSMakePoint(width-(pt2.x * width), height-(pt2.y * height));
    pt3 = NSMakePoint(width-(pt3.x * width), height-(pt3.y * height));
    pt4 = NSMakePoint(width-(pt4.x * width), height-(pt4.y * height));
    pt5 = NSMakePoint(width-(pt5.x * width), height-(pt5.y * height));
    
    lineColor = [NSColor redColor];
    
    [super drawDots];
    
}


@end
