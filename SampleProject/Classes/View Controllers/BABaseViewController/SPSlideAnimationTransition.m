//
//  SPSlideAnimationTransition.m
//  SampleProject
//
//  Created by <#Project Developer#> on 16/07/2015.
//  Copyright (c) 2015 <#Project Developer#>. All rights reserved.
//

#import "SPSlideAnimationTransition.h"

@implementation SPSlideAnimationTransition

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIView *containerView = [transitionContext containerView],
    *fromView = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey].view,
    *toView   = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey].view;
    
    CGFloat width = containerView.frame.size.width;
    CGFloat toViewX = (containerView.frame.size.width/3) - toView.frame.size.width;
    
    CGRect offsetToView = toView.frame; offsetToView.origin.x = toViewX;
    CGRect offsetFromView = toView.frame; offsetFromView.origin.x = width;
    
    toView.frame = offsetToView;
    
    [containerView insertSubview:toView belowSubview:fromView];
    
    fromView.layer.masksToBounds = NO;
    fromView.layer.shadowOffset = CGSizeMake(-1, 0);
    fromView.layer.shadowRadius = 3.5;
    fromView.layer.shadowOpacity = 0.4;
    fromView.layer.shadowPath = [UIBezierPath bezierPathWithRect:fromView.bounds].CGPath;
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        
        toView.frame = fromView.frame;
        
        fromView.frame = offsetFromView;
        
    } completion:^(BOOL finished)
     {
         [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
     }];
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return 0.25;
}

@end
