//
//  FhTestCollectionViewCell.m
//  FhtestUIStackView
//
//  Created by 方卉 on 2018/4/24.
//  Copyright © 2018年 znv. All rights reserved.
//

#import "FhTestCollectionViewCell.h"

@implementation FhTestCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}



-(void)drawCellContent:(NSString *)text{
    [_image setImage:[UIImage imageNamed:@"广告01"]];
    _label.text = text;
}


-(UICollectionViewLayoutAttributes *)preferredLayoutAttributesFittingAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes
{
    UICollectionViewLayoutAttributes * attr = [super preferredLayoutAttributesFittingAttributes:layoutAttributes]; //必须调用
    CGRect frame= attr.frame;
    frame.size.width = layoutAttributes.size.width; //这里的关键
    attr.frame =frame;
    return attr;
}


@end
