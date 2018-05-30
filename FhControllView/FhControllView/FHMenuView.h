//
//  FHMenuView.h
//  FhControllView
//
//  Created by 方卉 on 2018/5/25.
//  Copyright © 2018年 znv. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^btnActionBlock)(int index);
@interface FHMenuView : UIScrollView{
    CGFloat btnWidth;
    NSMutableArray *btnArray;
    UILabel *indicatorLabel;
}

@property(nonatomic, strong)UIColor *titleColor;
@property(nonatomic, strong)UIColor *indicatorColor;
@property(nonatomic, strong)NSArray *titleArray;
@property(nonatomic, copy)btnActionBlock btnBlock;
@end
