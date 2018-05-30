//
//  ViewController.m
//  FhtestUIStackView
//
//  Created by 方卉 on 2018/4/13.
//  Copyright © 2018年 znv. All rights reserved.
//

#import "ViewController.h"
#import "CirclePlayView.h"
#import "FHUseFDtemplateCellViewController.h"
@interface ViewController ()
@property (nonatomic,weak)IBOutlet UILabel *labal;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _labal.text = @"车金额达开导开导记得记得基督教杜莎夫人防患未然华容我rreoiuvnergeroiugrengrenerrvreifhdh的减肥减肥附加费黄飞鸿复合肥减肥减肥减肥机房机";
    CirclePlayView *scrollView = [[CirclePlayView alloc] initWithFrame:CGRectMake(0.f, 64.f, [UIScreen mainScreen].bounds.size.width , [UIScreen mainScreen].bounds.size.width/2)];
    [scrollView initUI:@[@"0", @"1", @"2", @"3", @"4"]];
    [self.view addSubview:scrollView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)btnPressed:(id)sender{
    FHUseFDtemplateCellViewController *play = [[FHUseFDtemplateCellViewController alloc]init];
    [self.navigationController pushViewController:play animated:YES];
}

@end
