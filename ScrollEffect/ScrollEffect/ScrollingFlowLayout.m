//
//  ScrollingFlowLayout.m
//  ScrollEffect
//
//  Created by Srinivasan Dodda on 26/08/16.
//  Copyright © 2016 srini. All rights reserved.
//

#import "ScrollingFlowLayout.h"
#import "ScrollingLayoutAttributes.h"

@implementation ScrollingFlowLayout{
    CGFloat previousOffset;
    NSDate *lastOffsetCapture;
    CGFloat currentSpeed;
}

+(Class)layoutAttributesClass{
    return ScrollingLayoutAttributes.class;
}

-(NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect{
    
    CGFloat currentOffset = self.collectionView.contentOffset.y;
    NSDate *currentTime = [NSDate date];
    if(lastOffsetCapture == nil){
        lastOffsetCapture = [NSDate date];
        currentSpeed = 0;
    }else{
        NSTimeInterval interval = [currentTime timeIntervalSinceDate:lastOffsetCapture];
        currentSpeed = fabs(currentOffset - previousOffset)/interval;
    }
    lastOffsetCapture = currentTime;
    previousOffset = currentOffset;
    
    
    CGFloat collectionViewCentreY = self.collectionView.bounds.size.height*3/4 - 50;
    NSMutableArray<UICollectionViewLayoutAttributes *> *arrayAttributes = [[super layoutAttributesForElementsInRect:rect] mutableCopy];
    for(ScrollingLayoutAttributes *attributes in  arrayAttributes){
        if(currentSpeed > 1000){
            attributes.percentComplete = 1;
            continue;
        }
        CGFloat yInCollectionViewBounds = MAX(0, attributes.center.y - self.collectionView.contentOffset.y);
        attributes.percentComplete = MAX(0,1 - (yInCollectionViewBounds - collectionViewCentreY)/collectionViewCentreY);
        if(attributes.percentComplete > 1){
            attributes.percentComplete = 1;
        }
    }
    return arrayAttributes;
}

-(BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    return YES;
}

@end
