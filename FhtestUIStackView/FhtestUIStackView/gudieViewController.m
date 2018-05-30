//
//  gudieViewController.m
//  FhtestUIStackView
//
//  Created by 方卉 on 2018/4/28.
//  Copyright © 2018年 znv. All rights reserved.
//

#import "gudieViewController.h"
#import "GuideCollectionViewCell.h"
@interface gudieViewController ()
@property(weak,nonatomic)IBOutlet UICollectionView *collectionView;
@property (nonatomic,strong)NSArray *imageArray;
@end

static NSString * const reuseIdentifier = @"GuideCollectionViewCell";
@implementation gudieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    UINib *cellNib=[UINib nibWithNibName:@"GuideCollectionViewCell" bundle:nil];
    [self.collectionView registerNib:cellNib forCellWithReuseIdentifier:reuseIdentifier];
     _imageArray = @[@"introd01.png",@"introd02.png",@"introd03.png"];
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    layout.minimumLineSpacing = 0;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    [self.collectionView setCollectionViewLayout:layout];
    self.view.frame = CGRectMake(0,0,[UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    self.collectionView.pagingEnabled = YES;
    self.collectionView.contentInset = UIEdgeInsetsMake(0,0,0,[UIScreen mainScreen].bounds.size.width);
    self.collectionView.showsHorizontalScrollIndicator = NO;
    self.collectionView.bounces = NO;
    self.collectionView.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//-(instancetype)init{
//    if(self = [super init]){
//        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
//        layout.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
//        layout.minimumLineSpacing = 0;
//        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
//        [self.collectionView setCollectionViewLayout:layout];
//        self.view.frame = CGRectMake(0,0,[UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
//        self.collectionView.pagingEnabled = YES;
//        self.collectionView.contentInset = UIEdgeInsetsMake(0,0,0,[UIScreen mainScreen].bounds.size.width);
//        self.collectionView.showsHorizontalScrollIndicator = NO;
//        self.collectionView.bounces = NO;
//        self.collectionView.backgroundColor = [UIColor whiteColor];
//    }
//    return self;
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [_imageArray count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    GuideCollectionViewCell *cell = (GuideCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    // Configure the cell
    UIImage *image = [UIImage imageNamed:_imageArray[indexPath.row]];
    [cell setBackImage:image];
    NSLog(@"进入一次");
    return cell;
}




- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (self.collectionView.contentOffset.x == self.collectionView.contentSize.width) {
        NSLog(@"测距");
        [self.view removeFromSuperview];
    }
}


@end
