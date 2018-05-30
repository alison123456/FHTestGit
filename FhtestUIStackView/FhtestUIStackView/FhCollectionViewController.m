//
//  FhCollectionViewController.m
//  FhtestUIStackView
//
//  Created by 方卉 on 2018/4/24.
//  Copyright © 2018年 znv. All rights reserved.
//

#import "FhCollectionViewController.h"
#import "FhTestCollectionViewCell.h"
@interface FhCollectionViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property(nonatomic,strong)NSArray *dataSource;
@end

@implementation FhCollectionViewController

static NSString * const reuseIdentifier = @"FhTestCollectionViewCell";
-(UICollectionViewFlowLayout*)flowLayout{
    return (UICollectionViewFlowLayout*)self.collectionViewLayout;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerNib:[UINib nibWithNibName:@"FhTestCollectionViewCell" bundle:nil]  forCellWithReuseIdentifier:reuseIdentifier];
    _dataSource = @[@"HJDkfdhffnvmdf方式的角度看复合肥海沸江翻监管机构快高考高跟宽告警然后和诶日方法感觉告警跟",@"dhfjffjfdjgjfdhefiueh车间二季度电话费广发华福机房机告警告警国际公馆监管机构给好看好看好看好看好看客户赶快赶快给反馈反馈附加费基督教的基督教",@"dhfjffjfdjgjfdhefiueh车间二季度电话费广发华福机房机告警告警国际公馆监管机构给好看好看好看好看好看客户赶快赶快给反馈反馈附加费基督教的基督教"];
//    [self flowLayout].scrollDirection = UICollectionViewScrollDirectionVertical;
    [self flowLayout].minimumInteritemSpacing = 0;
    [self flowLayout].minimumLineSpacing = 10;
//    [self flowLayout].estimatedItemSize=CGSizeMake((self.view.frame.size.width-60)/3.0, 200.0);
     [self flowLayout].estimatedItemSize =  CGSizeMake(self.view.frame.size.width-60, 200.0);
    // Do any additional setup after loading the view.
//    self.automaticallyAdjustsScrollViewInsets = NO;
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

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _dataSource.count;
}

- (BOOL) shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds{
    return YES;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    FhTestCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    [cell drawCellContent:_dataSource[indexPath.row]];
    return cell;
}


- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(5, 5, 5, 5);
}


#pragma mark <UICollectionViewDelegate>

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/





@end
