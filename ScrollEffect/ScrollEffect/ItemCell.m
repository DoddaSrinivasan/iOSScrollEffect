//
//  ItemCell.m
//  ScrollEffect
//
//  Created by Srinivasan Dodda on 26/08/16.
//  Copyright © 2016 srini. All rights reserved.
//

#import "ItemCell.h"
#import "ScrollingLayoutAttributes.h"

#define WHITE_VIEW_FINAL_TRAILING  35
#define WHITE_VIEW_FINAL_LEADING  15

@implementation ItemCell

-(void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes{
    [super applyLayoutAttributes:layoutAttributes];
    ScrollingLayoutAttributes *attributes = (ScrollingLayoutAttributes *)layoutAttributes;
    [self updateWhiteView:attributes.percentComplete];
}

-(void)updateWhiteView:(CGFloat)percentage{
    CGSize bounds = self.bounds.size;
    CGFloat whiteViewInitialLeadingBounds = bounds.width + WHITE_VIEW_FINAL_LEADING;
    CGFloat whiteViewInitialTrailingBounds = bounds.width + WHITE_VIEW_FINAL_TRAILING;
    if(_indexPath.item%2 == 0){
        _constantWhiteViewLeading.constant = WHITE_VIEW_FINAL_LEADING + (1-percentage)*whiteViewInitialLeadingBounds;
        _constantWhiteViewTrailing.constant = WHITE_VIEW_FINAL_TRAILING - (1-percentage)*whiteViewInitialTrailingBounds;
    }else{
        _constantWhiteViewLeading.constant = WHITE_VIEW_FINAL_TRAILING - (1-percentage)*whiteViewInitialTrailingBounds;
        _constantWhiteViewTrailing.constant = WHITE_VIEW_FINAL_LEADING + (1-percentage)*whiteViewInitialLeadingBounds;
    }
}

@end
