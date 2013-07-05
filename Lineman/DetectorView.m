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
    
    // now draw lines between the dots!
    drawingPath = [NSBezierPath bezierPath];
    [drawingPath setLineWidth:0.5];
    
    [drawingPath moveToPoint:pt1];
    
    [drawingPath lineToPoint:pt2];
    [drawingPath lineToPoint:pt3];
    [drawingPath lineToPoint:pt4];
    [drawingPath lineToPoint:pt5];
    [drawingPath lineToPoint:pt1];
    [drawingPath lineToPoint:pt3];
    [drawingPath lineToPoint:pt5];
    [drawingPath lineToPoint:pt2];
    [drawingPath lineToPoint:pt4];
    [drawingPath lineToPoint:pt1];
    
    [drawingPath stroke];
}


- (void)touchesBeganWithEvent:(NSEvent *)event {
    
    [super touchesBeganWithEvent:event];
    
    [self clearDots];
    
    [self drawDots:event];
    
}

-(void)touchesMovedWithEvent:(NSEvent *)event {
    
    [super touchesMovedWithEvent:event];
    
    [self clearDots];
    
    [self drawDots:event];
    
}

- (void)touchesEndedWithEvent:(NSEvent *)event {
   
    [super touchesEndedWithEvent:event];
     
    [self clearDots];
     
}

- (void)touchesCancelledWithEvent:(NSEvent *)event {
    
    [super touchesCancelledWithEvent:event];
    
    [self clearDots];
     
}

- (void)clearDots {
    
    [[self subviews]
    makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    //[self clearLines];
}

- (void) clearLines {
    pt1=NSMakePoint(0.0, 0.0);
    pt2=NSMakePoint(0.0, 0.0);
    pt3=NSMakePoint(0.0, 0.0);
    pt4=NSMakePoint(0.0, 0.0);
    pt5=NSMakePoint(0.0, 0.0);
    
    [self setNeedsDisplay:YES];
}

- (void)drawDots:(NSEvent *)event {
        
    NSSet *touches = [event touchesMatchingPhase:NSTouchPhaseTouching inView:self];
    
    if (touches.count == 5) {
        // do some things
        
        NSArray *array = [touches allObjects];
        
        pt1 = [[array objectAtIndex:0] normalizedPosition];
        pt2 = [[array objectAtIndex:1] normalizedPosition];
        pt3 = [[array objectAtIndex:2] normalizedPosition];
        pt4 = [[array objectAtIndex:3] normalizedPosition];
        pt5 = [[array objectAtIndex:4] normalizedPosition];
        
        // redefine the points we really want!
        [self redefinePts];
    
        // make things appear!
        self.dot1 = [[NSImageView alloc] init];
        [self.dot1 setFrame:NSRectFromCGRect(CGRectMake((pt1.x-8), (pt1.y-8), 16, 16))];
        [self.dot1 setImage:[NSImage imageNamed:@"mapPin"]];
        [self addSubview:self.dot1];
        
        self.dot2 = [[NSImageView alloc] init];
        [self.dot2 setFrame:NSRectFromCGRect(CGRectMake((pt2.x-8), (pt2.y-8), 16, 16))];
        [self.dot2 setImage:[NSImage imageNamed:@"mapPin"]];
        [self addSubview:self.dot2];
        
        self.dot3 = [[NSImageView alloc] init];
        [self.dot3 setFrame:NSRectFromCGRect(CGRectMake((pt3.x-8), (pt3.y-8), 16, 16))];
        [self.dot3 setImage:[NSImage imageNamed:@"mapPin"]];
        [self addSubview:self.dot3];
        
        self.dot4 = [[NSImageView alloc] init];
        [self.dot4 setFrame:NSRectFromCGRect(CGRectMake((pt4.x-8), (pt4.y-8), 16, 16))];
        [self.dot4 setImage:[NSImage imageNamed:@"mapPin"]];
        [self addSubview:self.dot4];
        
        self.dot5 = [[NSImageView alloc] init];
        [self.dot5 setFrame:NSRectFromCGRect(CGRectMake((pt5.x-8), (pt5.y-8), 16, 16))];
        [self.dot5 setImage:[NSImage imageNamed:@"mapPin"]];
        [self addSubview:self.dot5];
        
        [self setNeedsDisplay:YES];
                
    }
   
}

-(void)redefinePts {
    
    NSLog(@"standard detector view redefining points");
    
    float height = self.window.frame.size.height;
    float width = self.window.frame.size.width;
        
    pt1 = NSMakePoint((pt1.x * width), (pt1.y * height));
    pt2 = NSMakePoint((pt2.x * width), (pt2.y * height));
    pt3 = NSMakePoint((pt3.x * width), (pt3.y * height));
    pt4 = NSMakePoint((pt4.x * width), (pt4.y * height));
    pt5 = NSMakePoint((pt5.x * width), (pt5.y * height));
    
    
}

@end
