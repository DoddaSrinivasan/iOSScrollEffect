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
    _viewContent.alpha = 0.95;
    _indexPath = attributes.indexPath;
    
    if(_indexPath.item%2 == 0){
        _viewImage.layer.zPosition = 999;
        _viewContent.layer.zPosition = 888;
    }else{
        _viewImage.layer.zPosition = 888;
        _viewContent.layer.zPosition = 999;
    }
    [self layoutIfNeeded];
    
    [self updateWhiteView:attributes.percentComplete];
    [self updateImageView:attributes.percentComplete];
    [self updateContentView:attributes.percentComplete];
}

-(void)updateWhiteView:(CGFloat)percentage{
    CGSize bounds = self.bounds.size;
    CGFloat whiteViewInitialLeadingBounds = bounds.width + WHITE_VIEW_FINAL_LEADING;
    CGFloat whiteViewInitialTrailingBounds = bounds.width + WHITE_VIEW_FINAL_TRAILING;
    if(_indexPath.item%2 != 0){
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
        
        _constraintImgHolderCentre.constant = -25 + (1-percentage)*imgViewInitialCentre;
        _constraintImgHolderTrailing.constant = 30 + (1-percentage)*imgViewInitialTrailing;
        _constraintImageHolderWidth.constant = 160;
        _constraintImgLeading.constant = - 400 + percentage*400;
        _constraintImgTrailing.constant = 0;
    }else{
        CGFloat imgViewInitialTrailing = bounds.width + 160 + 30; //width + trailing
        
        _constraintImgHolderCentre.constant = percentage*25;
        _constraintImgHolderTrailing.constant = 20 + (1-percentage)*imgViewInitialTrailing;
        _constraintImageHolderWidth.constant = bounds.width*3/4;
        _constraintImgTrailing.constant = - 400 + percentage*400;
        _constraintImgLeading.constant = 0;
    }
}

-(void)updateContentView:(CGFloat)percentage{
    CGSize bounds = self.bounds.size;
    if(_indexPath.item%2 == 0){
        CGFloat contentViewInitialLeading = bounds.width;
        CGFloat contentViewInitialWidth = bounds.width - 80;
    
        _constraintContentCentre.constant = -percentage*20;
        _constraintContentLeading.constant = 15 + (1-percentage)*contentViewInitialLeading;
        _constraintContentWidth.constant = bounds.width - 50 - 140 - 15 + (1-percentage)*contentViewInitialWidth;
    }else{
        CGFloat contentViewInitialLeading = bounds.width;
        CGFloat contentViewInitialCentre = bounds.height/2;
        
        _constraintContentCentre.constant = contentViewInitialCentre - percentage*(contentViewInitialCentre - 45);
        _constraintContentLeading.constant = 40 + (1-percentage)*contentViewInitialLeading;
        _constraintContentWidth.constant = 140; 
    }
}

@end
