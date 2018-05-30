//
//  FHMenuView.m
//  FhControllView
//
//  Created by 方卉 on 2018/5/25.
//  Copyright © 2018年 znv. All rights reserved.
//

#import "FHMenuView.h"

@implementation FHMenuView
//宏定义不能进行类型检查
static const CGFloat width =60.0f;
static const CGFloat height = 40.0f;

-(instancetype)init{
    if(self = [super init]){
        self.frame = CGRectMake(0.0f, 64.0f, [[UIScreen mainScreen] bounds].size.width,height);
        self.showsHorizontalScrollIndicator = NO;
    }
    return self;
}

//self已经生成大小颜色之后才会调用该方法
//适用于，要在self添加其他控件，同时这些赋值的属性生效。与self相关的属性，frame.backgroundcolor不生效
-(void)drawRect:(CGRect)rect{
    if(!btnArray){
        btnArray = [NSMutableArray array];
    }
    btnWidth = width;
    //计算self的宽度
    if(_titleArray.count *width< [[UIScreen mainScreen] bounds].size.width){
        btnWidth = [[UIScreen mainScreen] bounds].size.width / _titleArray.count;
    }
    self.contentSize = CGSizeMake(btnWidth*_titleArray.count, height);
    for(int i =0;i<[_titleArray count];i++){
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(i*btnWidth, 0.0f, btnWidth, height);
        [btn setTitle:_titleArray[i] forState:UIControlStateNormal];
        [btn setTitleColor:_titleColor forState:UIControlStateNormal];
        [btn setTitleColor:_indicatorColor forState:UIControlStateSelected];
        [btn addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
        [btn setAccessibilityValue:[NSString stringWithFormat:@"%d",i]];
        [self addSubview:btn];
        [btnArray addObject:btn];
        if(0 == i){
            //btn文字颜色修改
            btn.selected = YES;
            indicatorLabel = [[UILabel alloc]init];
            indicatorLabel.backgroundColor = _indicatorColor;
            indicatorLabel.frame = ({
                CGRect frame = btn.frame;
                frame.origin.y = height-1;
                frame.size.height = 1.0f;
                frame;
            });
            [self addSubview:indicatorLabel];
        }
    }
}


//-(void)setTitleArray:(NSArray *)titleArray{
//    _titleArray = titleArray;
  /*  btnWidth = width;
   //计算self的宽度
    if(titleArray.count *width< [[UIScreen mainScreen] bounds].size.width){
        btnWidth = [[UIScreen mainScreen] bounds].size.width / titleArray.count;
    }
    
    //设置self的contentsize，否则不会滑动
    self.contentSize = CGSizeMake(btnWidth*titleArray.count, height);
//  NSLog(@"contentSize 是：%@",NSStringFromCGSize(self.contentSize));
    for(int i =0;i<[titleArray count];i++){
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(i*btnWidth, 0.0f, btnWidth, height);
        [btn setTitle:titleArray[i] forState:UIControlStateNormal];
        [btn setTitleColor:_titleColor forState:UIControlStateNormal];
        [btn setTitleColor:_indicatorColor forState:UIControlStateSelected];
        [self addSubview:btn];
        
        if(0 == i){
            //btn文字颜色修改
            btn.selected = YES;
            UILabel *indicatorLabel = [[UILabel alloc]init];
            indicatorLabel.backgroundColor = _indicatorColor;
            indicatorLabel.frame = ({
                CGRect frame = btn.frame;
                frame.origin.y = height-1;
                frame.size.height = 1.0f;
                frame;
            });
//            [self ]
        }
    }*/
//}


-(void)btnPressed:(UIButton *)btn{
    for(UIButton *button in btnArray){
        if(btn == button){
            button.selected = YES;
        }else{
            button.selected = NO;
        }
    }
    indicatorLabel.frame =({
        CGRect frame = btn.frame;
        frame.origin.y = height-1;
        frame.size.height = 1.0f;
        frame;
    });
    int index  = [btn.accessibilityValue intValue];
    if(_btnBlock){
        _btnBlock(index);
    }
}


-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if([keyPath isEqualToString:@"contentOffset"]){
        UIScrollView *scrollView = (UIScrollView *)object;
        CGFloat offset = scrollView.contentOffset.x;
        int index = offset/self.frame.size.width;
        UIButton *btn = [btnArray objectAtIndex:index];
//        [btnArray makeObjectsPerformSelector:@selector(setBtnNoSelect:)];
        for(UIButton *button in btnArray){
            if(btn == button){
                button.selected = YES;
            }else{
                button.selected = NO;
            }
        }
        //修改下划线
        indicatorLabel.frame =({
            CGRect frame = btn.frame;
            frame.origin.y = height-1;
            frame.size.height = 1.0f;
            frame;
        });
        
        //当我们的self 它的contentSize减去它的x的偏移量 小于或等于屏幕宽度，那么self不进行偏移了
        CGPoint offsettmp = self.contentOffset;
        offsettmp.x = btnWidth*offset/self.frame.size.width;//坐标转换，从主屏幕转换到本控件内部
        if(self.contentSize.width -offsettmp.x >self.frame.size.width){
            self.contentOffset = offsettmp;
        }
    }
}

//-(void)setBtnNoSelect:(UIButton *)btn{
//    btn.selected = NO;
//}

@end
