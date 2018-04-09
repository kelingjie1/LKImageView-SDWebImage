//
//  ExampleSDWebImageViewController.h
//  LKImageViewExample
//
//  Created by lingtonke on 2018/4/9.
//  Copyright © 2018年 lingtonke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SDWebImage/SDWebImage.h>

@interface ExampleSDWebImageCell : UICollectionViewCell

@property (nonatomic) UIImageView *imageView;
@property (nonatomic) UIView *progressBar;

@end

@interface ExampleSDWebImageViewController : UICollectionViewController<UICollectionViewDelegateFlowLayout>

@end
