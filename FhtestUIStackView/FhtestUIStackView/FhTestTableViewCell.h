//
//  FhTestTableViewCell.h
//  FhtestUIStackView
//
//  Created by 方卉 on 2018/4/23.
//  Copyright © 2018年 znv. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^ButtonHide)();
@interface FhTestTableViewCell : UITableViewCell
@property(nonatomic,weak)IBOutlet UILabel *label;
@property(nonatomic,weak)IBOutlet UIButton *btn;
@property(nonatomic,copy)ButtonHide btnblock;
@property(nonatomic,assign)BOOL is_Open;
+(instancetype)cellWithTableView:(UITableView *)tableView;
-(void)drawCellContent:(NSString *)text;

@end

