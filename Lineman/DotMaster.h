//
//  DotMaster.h
//  Lineman
//
//  Created by Matt Luedke on 7/5/13.
//  Copyright (c) 2013 Matt Luedke. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DotMaster : NSObject

@property (strong, nonatomic) NSImageView *dot;
@property (nonatomic) CGPoint attackDot1Movement;

+ (DotMaster*)dotMaster;

@end
