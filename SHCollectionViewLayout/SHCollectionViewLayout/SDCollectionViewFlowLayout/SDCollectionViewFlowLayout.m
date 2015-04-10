//
//  SDCollectionViewFlowLayout.m
//  33rdStreet
//
//  Created by 2202 on 15/4/10.
//  Copyright (c) 2015年 33street. All rights reserved.
//

#import "SDCollectionViewFlowLayout.h"

@interface SDCollectionViewFlowLayout()

@property (nonatomic, strong) UIDynamicAnimator *animator;
@end

@implementation SDCollectionViewFlowLayout

- (void)prepareLayout
{
    [super prepareLayout];
    
    if (!_animator) {
        _animator = [[UIDynamicAnimator alloc] initWithCollectionViewLayout:self];
        CGSize contentSize = [self collectionViewContentSize];
        NSArray *items = [super layoutAttributesForElementsInRect:CGRectMake(0, 0, contentSize.width, contentSize.height)];
        
        for (UICollectionViewLayoutAttributes *item in items) {
            UIAttachmentBehavior *spring = [[UIAttachmentBehavior alloc] initWithItem:item attachedToAnchor:item.center];
            spring.length = 1;
            spring.damping = 0.5;
            spring.frequency = 1;
            
            [_animator addBehavior:spring];
        }
    }
    
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    return [_animator itemsInRect:rect];
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return [_animator layoutAttributesForCellAtIndexPath:indexPath];
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    UIScrollView *scrollView = self.collectionView;
    CGFloat scrollDelta = newBounds.origin.y - scrollView.bounds.origin.y;
    
    CGPoint touchLocation = [scrollView.panGestureRecognizer locationInView:scrollView];
    for (UIAttachmentBehavior *spring in _animator.behaviors) {
        CGPoint anchorPoint = spring.anchorPoint;
        
        CGFloat distanceFromTouch = fabsf(touchLocation.y - anchorPoint.y);
        CGFloat scrollResistance = distanceFromTouch / 500;
        
        UICollectionViewLayoutAttributes *item = [spring.items firstObject];
        CGPoint center = item.center;
        
        center.y += (scrollDelta > 0) ? MIN(scrollDelta, scrollDelta *scrollResistance)
                                      : MAX(scrollDelta, scrollDelta *scrollResistance);
        item.center = center;
        [_animator updateItemUsingCurrentState:item];
    }
    
    return NO;
}

- (void)reset
{
    _animator = nil;
}
@end
