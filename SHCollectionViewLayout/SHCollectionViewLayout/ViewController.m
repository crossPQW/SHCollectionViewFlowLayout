//
//  ViewController.m
//  SHCollectionViewLayout
//
//  Created by 2202 on 15/4/10.
//  Copyright (c) 2015年 SH. All rights reserved.
//

#import "ViewController.h"
#import "SDCollectionViewFlowLayout.h"
@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, strong) SDCollectionViewFlowLayout *layout;
@end

static NSString *reuseId = @"collectionViewCellReuseId";
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setupCollectionView];
}

- (void)setupCollectionView
{
    self.layout = [[SDCollectionViewFlowLayout alloc] init];
    self.layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    self.layout.itemSize = CGSizeMake(self.view.frame.size.width, 44);

    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:self.layout];
    
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.pagingEnabled = NO;
    collectionView.delegate = self;
    collectionView.dataSource = self;
    collectionView.alwaysBounceVertical = YES;
    
    [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseId];
    [self.view addSubview:collectionView];

}

#pragma mark 瀑布流数据源
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 100;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseId forIndexPath:indexPath];
    cell.contentView.backgroundColor = [UIColor magentaColor];
    
    return cell;
}

@end
