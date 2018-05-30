//
//  FhTestViewController.m
//  FhtestUIStackView
//
//  Created by 方卉 on 2018/4/23.
//  Copyright © 2018年 znv. All rights reserved.
//

#import "FhTestViewController.h"
#import "FhTestTableViewCell.h"

@interface FhTestViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,weak)IBOutlet UITableView *texttable;
@property(nonatomic,strong)NSArray *dataArray;
@property (nonatomic, strong) NSMutableDictionary *heightAtIndexPath;//缓存高度所用字典
@end


@implementation FhTestViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [_texttable registerNib:[UINib nibWithNibName:@"FhTestTableViewCell" bundle:nil] forCellReuseIdentifier:@"FhTestTableViewCell"];
    _texttable.rowHeight = UITableViewAutomaticDimension;
    _texttable.estimatedRowHeight = 44.0;
    _dataArray = @[@"HJDkfdhffnvmdf方式的角度看复合肥海沸江翻监管机构快高考高跟宽告警然后和诶日方法感觉告警跟",@"dhfjffjfdjgjfdhefiueh车间二季度电话费广发华福机房机告警告警国际公馆监管机构给好看好看好看好看好看客户赶快赶快给反馈反馈附加费基督教的基督教",@"dhfjffjfdjgjfdhefiueh车间二季度电话费广发华福机房机告警告警国际公馆监管机构给好看好看好看好看好看客户赶快赶快给反馈反馈附加费基督教的基督教"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSNumber *height = @(cell.frame.size.height);
    [self.heightAtIndexPath setObject:height forKey:indexPath];
}


- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSNumber *height = [self.heightAtIndexPath objectForKey:indexPath];
    if(height)
    {
        return height.floatValue;
    }
    else
    {
        return 44.0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FhTestTableViewCell *cell = [FhTestTableViewCell cellWithTableView:tableView];
   [cell drawCellContent:_dataArray[indexPath.row]];
    return cell;
}


@end
