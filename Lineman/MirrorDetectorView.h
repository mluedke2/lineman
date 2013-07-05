//
//  MirrorDetectorView.h
//  Lineman
//
//  Created by Matt Luedke on 7/5/13.
//  Copyright (c) 2013 Matt Luedke. All rights reserved.
//

#import "DetectorView.h"

@interface MirrorDetectorView : DetectorView

-(void)redefinePt1:(NSPoint)rawPt1 andPt2:(NSPoint)rawPt2 andPt3:(NSPoint)rawPt3 andPt4:(NSPoint)rawPt4 andPt5:(NSPoint)rawPt5 forScreenWidth:(float)width andHeight:(float)height;

@end
