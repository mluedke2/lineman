//
//  DotMaster.m
//  Lineman
//
//  Created by Matt Luedke on 7/5/13.
//  Copyright (c) 2013 Matt Luedke. All rights reserved.
//

#import "DotMaster.h"

@implementation DotMaster
@synthesize dot;

+ (DotMaster*)dotMaster
{
    static DotMaster* master = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        master = [[DotMaster alloc] init];
    });
    
    return master;
}

@end
