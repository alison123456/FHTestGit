//
//  GudieCollectionViewController.m
//  FhtestUIStackView
//
//  Created by 方卉 on 2018/4/28.
//  Copyright © 2018年 znv. All rights reserved.
//

#import "GudieCollectionViewController.h"
#import "GuideCollectionViewCell.h"
@interface GudieCollectionViewController()
@property (nonatomic,strong)NSArray *imageArray;
@property (nonatomic,strong)IBOutlet UIPageControl *pageControl;
@end

@implementation GudieCollectionViewController

//-(UICollectionViewFlowLayout*)flowLayout{
//    return (UICollectionViewFlowLayout*)self.collectionViewLayout;
//}
static NSString * const reuseIdentifier = @"GuideCollectionViewCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    // Register cell classes
//    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
//    layout.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
//    layout.minimumLineSpacing = 0;
//    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
////    [self initWithCollectionViewLayout:layout];
//    self.view.frame = CGRectMake(0,0,[UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
//    self.collectionView.pagingEnabled = YES;
//    self.collectionView.contentInset = UIEdgeInsetsMake(0,0,0,[UIScreen mainScreen].bounds.size.width);
//    self.collectionView.showsHorizontalScrollIndicator = NO;
//    self.collectionView.bounces = NO;
//    self.collectionView.backgroundColor = [UIColor whiteColor];
    UINib *cellNib=[UINib nibWithNibName:@"GuideCollectionViewCell" bundle:nil];
    [self.collectionView registerNib:cellNib forCellWithReuseIdentifier:reuseIdentifier];
    // Do any additional setup after loading the view.
    _imageArray = @[@"introd01.png",@"introd02.png",@"introd03.png"];
    UIPageControl* pageControltmp = [[UIPageControl alloc] init];
    pageControltmp.pageIndicatorTintColor = [UIColor greenColor];
    pageControltmp.currentPageIndicatorTintColor = [UIColor redColor];
    pageControltmp.numberOfPages = 3;
    pageControltmp.currentPage = 0;
    [pageControltmp setFrame:CGRectMake(20.f, 0, 40, 50)];
    [self.view addSubview:pageControltmp];
    _pageControl = pageControltmp;
}

-(instancetype)init{
    if(self = [super init]){
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        layout.minimumLineSpacing = 0;
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        self = [self initWithCollectionViewLayout:layout];
        self.view.frame = CGRectMake(0,0,[UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
        self.collectionView.pagingEnabled = YES;
        self.collectionView.contentInset = UIEdgeInsetsMake(0,0,0,[UIScreen mainScreen].bounds.size.width);
        self.collectionView.showsHorizontalScrollIndicator = NO;
        self.collectionView.bounces = NO;
        self.collectionView.backgroundColor = [UIColor whiteColor];
    }
    return self;
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


- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSInteger tmpIndex = scrollView.contentOffset.x/self.view.frame.size.width;
    _pageControl.currentPage = tmpIndex;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (self.collectionView.contentOffset.x == self.collectionView.contentSize.width) {
        NSLog(@"测距");
        [self.view removeFromSuperview];
    }
}

@end
