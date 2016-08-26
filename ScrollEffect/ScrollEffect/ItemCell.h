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

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constantWhiteViewTrailing;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constantWhiteViewLeading;

@end
