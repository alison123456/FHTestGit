//
//  ViewController.m
//  FhControllView
//
//  Created by 方卉 on 2018/5/25.
//  Copyright © 2018年 znv. All rights reserved.
//

#import "ViewController.h"
#import "FHMenuView.h"
@interface ViewController()<UITableViewDelegate,UITableViewDataSource>{
//
//@property(nonatomic,retain)UITableView *tableView;
//    UIScrollView  *mainScrollView;
    UITableView *tableView;
}
@property(nonatomic,retain)UIScrollView  *mainScrollView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.title = @"方卉测试";
    self.view.backgroundColor = [UIColor whiteColor];
    
    //只要在iOS8之后，在UINavigationContoller，加了UIScrollView,那么UIScrollView.contentInset.top值为64
    self.automaticallyAdjustsScrollViewInsets = NO; //iOS11中废弃
    
    FHMenuView *titleView = [[FHMenuView alloc]init];
    NSArray *titleArr = @[@"科学",@"人文",@"教育",@"体育",@"天文",@"地理",@"母婴",@"财经",@"时尚",@"军事",@"科技"];
    titleView.titleArray = titleArr;
    titleView.titleColor = [UIColor whiteColor];
    titleView.backgroundColor = [UIColor lightGrayColor];
    titleView.indicatorColor = [UIColor redColor];
//    titleView.btnBlock = ^{};
    [self.view addSubview:titleView];
    
    _mainScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0.0f, titleView.frame.size.height+titleView.frame.origin.y, self.view.frame.size.width,self.view.frame.size.height-titleView.frame.size.height-titleView.frame.origin.y)];
    _mainScrollView.delegate =self;
    _mainScrollView.pagingEnabled = YES;
    _mainScrollView.contentSize = CGSizeMake(self.view.frame.size.width*titleArr.count,_mainScrollView.frame.size.height);
    [self.view addSubview:_mainScrollView];
    __weak typeof(self)weakSelf = self;
    titleView.btnBlock = ^(int index){
        NSLog(@"进入block");
        CGRect frame = weakSelf.mainScrollView.frame;
        frame.origin.x = index*self.view.frame.size.width;
        [weakSelf.mainScrollView scrollRectToVisible:frame animated:YES];
    };
    [_mainScrollView addObserver:titleView forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
    //加载UITableView
    tableView = [[UITableView alloc]initWithFrame:CGRectMake(0.0f, 0.0f, self.view.frame.size.width, _mainScrollView.frame.size.height) style:UITableViewStylePlain];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.tableFooterView = [[UIView alloc]init];
    tableView.allowsSelection = NO;
    tableView.backgroundColor = [UIColor redColor];
    [_mainScrollView addSubview:tableView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UItableViewCell"];
    return cell;
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [self scrollAction:scrollView];
}

-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
   [self scrollAction:scrollView];
}

-(void)scrollAction:(UIScrollView *)scrollView{
    tableView.frame = ({
        CGRect frame = tableView.frame;
        frame.origin.x = scrollView.contentOffset.x;
        frame;
    });
    [tableView reloadData];
}

@end
