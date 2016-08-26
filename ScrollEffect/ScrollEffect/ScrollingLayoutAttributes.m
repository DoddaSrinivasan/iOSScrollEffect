//
//  ScrollingLayoutAttributes.m
//  ScrollEffect
//
//  Created by Srinivasan Dodda on 26/08/16.
//  Copyright © 2016 srini. All rights reserved.
//

#import "ScrollingLayoutAttributes.h"

@implementation ScrollingLayoutAttributes

-(id)copyWithZone:(NSZone *)zone{
     ScrollingLayoutAttributes *attributes = (ScrollingLayoutAttributes *)[super copyWithZone:zone];
    attributes.percentComplete = _percentComplete;
    return attributes;
}

-(BOOL)isEqual:(id)object{
    ScrollingLayoutAttributes *attributes = (ScrollingLayoutAttributes *)object;
    if(attributes.percentComplete == _percentComplete){
        return [super isEqual:object];
    }
    return false;
}

@end
