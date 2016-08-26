//
//  ShadowView.h
//  ScrollEffect
//
//  Created by Srinivasan Dodda on 26/08/16.
//  Copyright © 2016 srini. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CardView : UIView

@property (copy, nonatomic) IBInspectable UIColor *shadowColor;
@property (assign, nonatomic) IBInspectable CGFloat cornerRadius;
@property (assign, nonatomic) IBInspectable CGFloat shadowOffsetWidth;
@property (assign, nonatomic) IBInspectable CGFloat shadowOffsetHeight;
@property (assign, nonatomic) IBInspectable CGFloat shadowOpacity;
@property (assign, nonatomic) IBInspectable CGFloat shadowRadius;

@end
