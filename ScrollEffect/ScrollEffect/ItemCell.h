//
//  ItemCell.h
//  ScrollEffect
//
//  Created by Srinivasan Dodda on 26/08/16.
//  Copyright © 2016 srini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CardView.h"

@interface ItemCell : UICollectionViewCell

@property (weak, nonatomic) NSIndexPath *indexPath;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintWhiteViewTrailing;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintWhiteViewLeading;

@property (weak, nonatomic) IBOutlet CardView *viewContent;


@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintImageHolderWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintImgHolderCentre;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintImgHolderTrailing;
@property (weak, nonatomic) IBOutlet CardView *viewImage;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintContentWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintContentCentre;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintContentLeading;



@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintImgTrailing;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintImgLeading;


@property (weak, nonatomic) IBOutlet UILabel *lblContentText;
@property (weak, nonatomic) IBOutlet UILabel *lblContentNumber;


@end
