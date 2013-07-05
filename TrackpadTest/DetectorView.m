//
//  DetectorView.m
//  TrackpadTest
//
//  Created by Matt Luedke on 6/19/13.
//  Copyright (c) 2013 Matt Luedke. All rights reserved.
//

#import "DetectorView.h"

@implementation DetectorView

- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code here.
        
        [self setAcceptsTouchEvents:YES];
    }
    
    return self;
}

- (void)drawRect:(NSRect)dirtyRect
{
    // Drawing code here.
}


- (void)touchesBeganWithEvent:(NSEvent *)event {
    
    NSSet *touches = [event touchesMatchingPhase:NSTouchPhaseTouching inView:self];
    NSLog(@"hee");
    if (touches.count == 5) {
        // do some things
        
        NSArray *array = [touches allObjects];
        
        NSPoint pt0 = [[array objectAtIndex:0] normalizedPosition];
        NSPoint pt1 = [[array objectAtIndex:1] normalizedPosition];
        NSPoint pt2 = [[array objectAtIndex:2] normalizedPosition];
        NSPoint pt3 = [[array objectAtIndex:3] normalizedPosition];
        NSPoint pt4 = [[array objectAtIndex:4] normalizedPosition];
        
        float width = [[array objectAtIndex:0] deviceSize].width;
        
        float height = [[array objectAtIndex:0] deviceSize].height;
        
        NSLog(@"{%.2f,%.2f},{%.2f,%.2f},{%.2f,%.2f},{%.2f,%.2f},{%.2f,%.2f}", (pt0.x * width), (pt0.y * height), (pt1.x * width), (pt1.y * height), (pt2.x * width), (pt2.y * height), (pt3.x * width), (pt3.y * height), (pt4.x * width), (pt4.y * height));
        
    }
    
    
}

@end
