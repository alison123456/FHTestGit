//
//  FHUseFDtemplateCellViewController.m
//  FhtestUIStackView
//
//  Created by 方卉 on 2018/5/16.
//  Copyright © 2018年 znv. All rights reserved.
//

#import "FHUseFDtemplateCellViewController.h"
#import "UITableView+FDTemplateLayoutCell.h"
#import "FhTestTableViewCell.h"
@interface FHUseFDtemplateCellViewController ()
@property(nonatomic,weak)IBOutlet UITableView *texttable;
@property(nonatomic,strong)NSArray *dataArray;
@property (nonatomic, strong) NSMutableDictionary *heightAtIndexPath;//缓存高度所用字典
@end

@implementation FHUseFDtemplateCellViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [_texttable registerNib:[UINib nibWithNibName:@"FhTestTableViewCell" bundle:nil] forCellReuseIdentifier:@"FhTestTableViewCell"];
//    _texttable.rowHeight = UITableViewAutomaticDimension;
//    _texttable.estimatedRowHeight = 44.0;
    _heightAtIndexPath = [NSMutableDictionary dictionary];
    _dataArray = @[@"HJDkfdhffnvmdf方式的角度看复合肥海沸江翻监管机构快高考高跟宽告警然后和诶日方法感觉告警跟",@"dhfjffjfdjgjfdhefiueh车间二季度电话费广发华福机房机告警告警国际公馆监管机构给好看好看好看好看好看客户赶快赶快给反馈反馈附加费基督教的基督教",@"dhfjffjfdjgjfdhefiueh车间二季度电话费广发华福机房机告警告警国际公馆监管机构给好看好看好看好看好看客户赶快赶快给反馈反馈附加费基督教的基督教",@"dhfjffjfdjgjfdhefiueh车间二季度电话费广发华福机房机告警告警国际公馆监管机构给好看好看好看好看好看客户赶快赶快给反馈反馈附加费基督教的基督教dhfjffjfdjgjfdhefiueh车间二季度电话费广发华福机房机告警告警国际公馆监管机构给好看好看好看好看好看客户赶快赶快给反馈反馈附加费基督教的基督教",@"dhfjffjfdjgjfdhefiueh车间二季度电话费广发华福机房机告警告警国际公馆监管机构给好看好看好看好看好看客户赶快赶快给反馈反馈附加费基督教的基督教dhfjffjfdjgjfdhefiueh车间二季度电话费广发华福机房机告警告警国际公馆监管机构给好看好看好看好看好看客户赶快赶快给反馈反馈附加费基督教的基督教dhfjffjfdjgjfdhefiueh车间二季度电话费广发华福机房机告警告警国际公馆监管机构给好看好看好看好看好看客户赶快赶快给反馈反馈附加费基督教的基督教dhfjffjfdjgjfdhefiueh车间二季度电话费广发华福机房机告警告警国际公馆监管机构给好看好看好看好看好看客户赶快赶快给反馈反馈附加费基督教的基督教"];
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


//- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    NSNumber *height = @(cell.frame.size.height);
//    [self.heightAtIndexPath setObject:height forKey:indexPath];
//}


- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
  return [tableView fd_heightForCellWithIdentifier:@"FhTestTableViewCell" cacheByIndexPath:indexPath configuration:^(id cell){
      [self drawCell:cell indexPath:indexPath];
   }];
}


-(void)drawCell:(id)cell indexPath:(NSIndexPath *)index{
    FhTestTableViewCell *cellNew = (FhTestTableViewCell *)cell;
    [cellNew drawCellContent:_dataArray[index.row]];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FhTestTableViewCell *cell = [FhTestTableViewCell cellWithTableView:tableView];
    [cell drawCellContent:_dataArray[indexPath.row]];
    __weak typeof(self)weakSelf = self;
    cell.btnblock = ^(){//更新这个cell
        [weakSelf.texttable reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    };
    return cell;
}

@end
