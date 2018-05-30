//
//  TextCoreExampleViewController.m
//  FhtestUIStackView
//
//  Created by 方卉 on 2018/5/14.
//  Copyright © 2018年 znv. All rights reserved.
//

#import "TextCoreExampleViewController.h"

@interface TextCoreExampleViewController ()

@end

@implementation TextCoreExampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    //Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

/*-(void)lean:(CGRect)rect{
    //翻转画布，使得与iOS的坐标方向相同
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
    CGContextTranslateCTM(context, 0, self.bounds.size.height);
    CGContextScaleCTM(context,1.0,-1.0);
    
    NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc]initWithString:@"\n这里在测试图文混排，\n我是一个富文本"];
    
}*/

@end
