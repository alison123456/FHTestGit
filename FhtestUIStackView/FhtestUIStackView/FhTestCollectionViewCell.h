//
//  FhTestCollectionViewCell.h
//  FhtestUIStackView
//
//  Created by 方卉 on 2018/4/24.
//  Copyright © 2018年 znv. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FhTestCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIImageView *image;
-(void)drawCellContent:(NSString *)text;
@end
