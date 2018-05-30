//
//  CirclePlayViewController.m
//  FhtestUIStackView
//
//  Created by 方卉 on 2018/5/2.
//  Copyright © 2018年 znv. All rights reserved.
//

#import "CirclePlayView.h"
#import "NSTimer+Extention.h"
@interface CirclePlayView ()<UICollectionViewDataSource,UICollectionViewDelegate>
{
    NSInteger currentIndex;
    NSInteger count;
    NSTimer *timer;
}
@property(nonatomic,strong) NSArray *imageArray;
@property(nonatomic,strong) UICollectionView *collectionView;
@property(nonatomic,strong) UIPageControl *pageCtrl;
@end

@implementation CirclePlayView

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
*/

-(instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        self.backgroundColor = [UIColor whiteColor];
        currentIndex = 0;
    }
    return self;
}

-(void)initUI:(NSArray *)imageArr{
    _imageArray = imageArr;
    count = [imageArr count];
    //添加collectionView
    [self addSubview:self.collectionView];
    //设置偏移量
    self.collectionView.contentOffset = CGPointMake(self.frame.size.width,0.0f);
    //开启定时器
    [self creatTimer];
    //设置pageNumberView
    [self addSubview:self.pageCtrl];
}

-(void)creatTimer{
    __weak typeof(self)weakSelf = self;
    if (@available(iOS 10.0, *)){//iOS10.0以上才有该接口
        timer = [NSTimer timerWithTimeInterval:2.0f repeats:YES block:^(NSTimer * _Nonnull timer){
            [weakSelf timerAction];
        }];
    } else {
        // Fallback on earlier versions
        timer = [NSTimer timerWithTimeInterval:2.0f block:^{
               [weakSelf timerAction];
        } repeat:YES];
    }
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}


-(void)timerAction{
    currentIndex++;
    [_collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:currentIndex inSection:0] atScrollPosition:UICollectionViewScrollPositionRight animated:YES];
}

#pragma mark ----UICollectionView的delegate-------
//减速动画停止时，代码跟手动都可以进入该回调
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if(scrollView.contentOffset.x == (count+1)*self.frame.size.width){//滑动到最右边
        [_collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
        currentIndex = 1;
    }
    else if(scrollView.contentOffset.x == 0){
        [_collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:count inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
        currentIndex = count;
    }
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
     NSInteger tmpIndex = scrollView.contentOffset.x/self.frame.size.width;
     tmpIndex = tmpIndex-1;
     _pageCtrl.currentPage = tmpIndex;
}

//代码调用滑动偏移时才会进入的回调
-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    if (scrollView.contentOffset.x == (count+1)*self.frame.size.width) {
        [_collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
        currentIndex = 1;
    }
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [timer invalidate];
    timer = nil;
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    [self creatTimer];
}


#pragma mark - UICollectionView delegate && datasource method
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return count+2;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    //此处cell来添加imageView有没有问题,可以思考看怎么解决
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"8pm" forIndexPath:indexPath];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.f, 0.f, self.frame.size.width, self.frame.size.height)];
    [cell addSubview:imageView];
    if (indexPath.row == 0) {
        imageView.image = [UIImage imageNamed:_imageArray[count-1]];
    } else if (indexPath.row == count+1) {
        imageView.image = [UIImage imageNamed:_imageArray[0]];
    } else {
        imageView.image = [UIImage imageNamed:_imageArray[indexPath.row-1]];
    }
    return cell;
}


#pragma mark - getter 方法
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.minimumLineSpacing = 0.f;
        flowLayout.minimumInteritemSpacing = 0.f;
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        flowLayout.itemSize = CGSizeMake(self.frame.size.width, self.frame.size.height);
        
        _collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:flowLayout];
        _collectionView.backgroundColor = [UIColor redColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.bounces = NO;
        _collectionView.pagingEnabled = YES;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.showsVerticalScrollIndicator = NO;
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"8pm"];
    }
    return _collectionView;
}

- (UIPageControl *)pageCtrl {
    if (!_pageCtrl) {
        
        CGFloat pageWidth = 80.f;
        CGFloat pageHeight = 20.f;
        _pageCtrl = [[UIPageControl alloc] initWithFrame:CGRectMake(20.f, self.frame.size.height-pageHeight, pageWidth, pageHeight)];
        _pageCtrl.numberOfPages = _imageArray.count;
        _pageCtrl.currentPageIndicatorTintColor = [UIColor redColor];
    }
    return _pageCtrl;
}
@end
