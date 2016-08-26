//
//  ItemCell.m
//  ScrollEffect
//
//  Created by Srinivasan Dodda on 26/08/16.
//  Copyright © 2016 srini. All rights reserved.
//

#import "ItemCell.h"
#import "ScrollingLayoutAttributes.h"

#define WHITE_VIEW_FINAL_TRAILING  15
#define WHITE_VIEW_FINAL_LEADING  35

@implementation ItemCell

-(void)prepareForReuse{
    
}

-(void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes{
    [super applyLayoutAttributes:layoutAttributes];
    ScrollingLayoutAttributes *attributes = (ScrollingLayoutAttributes *)layoutAttributes;
    [self updateWhiteView:attributes.percentComplete];
    [self updateImageView:attributes.percentComplete];
}

-(void)updateWhiteView:(CGFloat)percentage{
    CGSize bounds = self.bounds.size;
    CGFloat whiteViewInitialLeadingBounds = bounds.width + WHITE_VIEW_FINAL_LEADING;
    CGFloat whiteViewInitialTrailingBounds = bounds.width + WHITE_VIEW_FINAL_TRAILING;
    if(_indexPath.item%2 == 0){
        _constraintWhiteViewLeading.constant = WHITE_VIEW_FINAL_LEADING + (1-percentage)*whiteViewInitialLeadingBounds;
        _constraintWhiteViewTrailing.constant = WHITE_VIEW_FINAL_TRAILING - (1-percentage)*whiteViewInitialTrailingBounds;
    }else{
        _constraintWhiteViewLeading.constant = WHITE_VIEW_FINAL_TRAILING - (1-percentage)*whiteViewInitialTrailingBounds;
        _constraintWhiteViewTrailing.constant = WHITE_VIEW_FINAL_LEADING + (1-percentage)*whiteViewInitialLeadingBounds;
    }
}

-(void)updateImageView:(CGFloat)percentage{
    CGSize bounds = self.bounds.size;
    if(_indexPath.item%2 == 0){
        CGFloat imgViewInitialCentre = bounds.height/2;
        CGFloat imgViewInitialTrailing = -(160 + 30); //width + trailing
        
        _constraintImgCentre.constant = -25 + (1-percentage)*imgViewInitialCentre;
        _constraintImgTrailing.constant = 30 + (1-percentage)*imgViewInitialTrailing;
    }else{
        CGFloat imgViewInitialCentre = bounds.height/2;
        CGFloat imgViewInitialTrailing = bounds.width + 160 + 30; //width + trailing
        
        _constraintImgCentre.constant = 25 + (1-percentage)*imgViewInitialCentre;
        _constraintImgTrailing.constant = 20 + (1-percentage)*imgViewInitialTrailing;
        _constraintImageWidth.constant = 160 + percentage*(bounds.width*2/3 - 160);
    }
}

-(void)updateContentView:(CGFloat)percentage{
    
}

@end
