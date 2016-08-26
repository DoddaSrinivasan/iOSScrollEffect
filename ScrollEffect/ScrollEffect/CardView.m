//
//  ShadowView.m
//  ScrollEffect
//
//  Created by Srinivasan Dodda on 26/08/16.
//  Copyright © 2016 srini. All rights reserved.
//

#import "CardView.h"

@implementation CardView

-(void)layoutSubviews{
    self.layer.cornerRadius = _cornerRadius;
    UIBezierPath *shadowPath = [UIBezierPath
                                bezierPathWithRoundedRect: self.bounds
                                cornerRadius: _cornerRadius];
    
    
    self.layer.masksToBounds = NO;
    self.layer.shadowColor = _shadowColor.CGColor;
    self.layer.shadowOffset = CGSizeMake(_shadowOffsetWidth, _shadowOffsetHeight);
    self.layer.shadowOpacity = _shadowOpacity;
    self.layer.shadowRadius = _shadowRadius;
    self.layer.shadowPath = shadowPath.CGPath;
    
}

@end
