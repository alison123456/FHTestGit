//
//  GuideCollectionViewCell.m
//  FhtestUIStackView
//
//  Created by 方卉 on 2018/4/28.
//  Copyright © 2018年 znv. All rights reserved.
//

#import "GuideCollectionViewCell.h"
@interface GuideCollectionViewCell()
@property (weak ,nonatomic)IBOutlet UIImageView  *imageback;
@end


@implementation GuideCollectionViewCell
//initWithCoder  -> awakeFromNib ,xib创建的调用这两个函数，initWithFrame只适用纯代码创建时调用

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setBackImage:(UIImage *)image{
    [_imageback setImage:image];
}
@end
