//
//  FhTestTableViewCell.m
//  FhtestUIStackView
//
//  Created by 方卉 on 2018/4/23.
//  Copyright © 2018年 znv. All rights reserved.
//

#import "FhTestTableViewCell.h"

@implementation FhTestTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+(instancetype)cellWithTableView:(UITableView *)tableView{
   static NSString * rid =@"FhTestTableViewCell";
    FhTestTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:rid];
    if(cell==nil){
        cell = [[FhTestTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:rid];
        cell.is_Open = YES;
    }
    return cell;
}

-(void)drawCellContent:(NSString *)text{
    if(text.length > 88){
        [_btn setHidden:NO];
        if(_is_Open == YES)//默认是打开的
        {
            [_btn setTitle:@"收起" forState:UIControlStateNormal];
            _label.numberOfLines = 0;
            _label.text = text;
        }else{
            [_btn setTitle:@"全部" forState:UIControlStateNormal];
            _label.numberOfLines = 4;
            _label.text = text;
        }
    }
    else{
        _label.numberOfLines = 4;
        _label.text = text;
        [_btn setHidden:YES];
    }
}


-(IBAction)btnPressed:(id)sender{
    if(_btnblock){
        _is_Open = !_is_Open;
        _btnblock();
    }
}

@end
