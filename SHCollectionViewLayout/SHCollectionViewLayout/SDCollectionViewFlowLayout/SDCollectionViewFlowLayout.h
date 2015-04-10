//
//  SDCollectionViewFlowLayout.h
//  33rdStreet
//
//  Created by 2202 on 15/4/10.
//  Copyright (c) 2015年 33street. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SDCollectionViewFlowLayout : UICollectionViewFlowLayout


/**
 *  当collectionView需要reloadData时一定要调用此方法
 */
- (void)reset;
@end
