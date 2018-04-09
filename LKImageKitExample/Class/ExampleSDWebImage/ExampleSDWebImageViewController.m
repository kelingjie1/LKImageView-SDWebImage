//
//  ExampleSDWebImageViewController.m
//  LKImageViewExample
//
//  Created by lingtonke on 2018/4/9.
//  Copyright © 2018年 lingtonke. All rights reserved.
//

#import "ExampleSDWebImageViewController.h"
#import "ExampleUtil.h"
@implementation ExampleSDWebImageCell

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        self.imageView                   = [[UIImageView alloc] initWithFrame:self.bounds];
       [self.contentView addSubview:self.imageView];
    }
    return self;
}
@end

@interface ExampleSDWebImageViewController ()

@end

@implementation ExampleSDWebImageViewController

- (instancetype)init
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumLineSpacing          = 0;
    layout.minimumInteritemSpacing     = 0;
    return [super initWithCollectionViewLayout:layout];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.collectionView registerClass:[ExampleSDWebImageCell class] forCellWithReuseIdentifier:@"ExampleImageWallCell"];
    self.collectionView.backgroundColor = [UIColor whiteColor];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return ImageCount;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ExampleSDWebImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ExampleImageWallCell" forIndexPath:indexPath];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat size = collectionView.bounds.size.width / 4;
    return CGSizeMake(size, size);
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    ExampleSDWebImageCell *imageCell                  = (ExampleSDWebImageCell *) cell;
    [imageCell.imageView sd_setImageWithURL:[NSURL URLWithString:[ExampleUtil imageURLFromFileID:indexPath.item + 1 size:1024]]];
}

- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    ExampleSDWebImageCell *imageCell = (ExampleSDWebImageCell *) cell;
    [imageCell.imageView sd_cancelCurrentImageLoad];
    imageCell.imageView.image       = nil;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
}

@end
