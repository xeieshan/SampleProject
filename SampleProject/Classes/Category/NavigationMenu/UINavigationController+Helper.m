//
//  UINavigationController+CustomCategory.m
//   SampleProject
//
//  Created by <#Project Developer#> on 16/07/2015.
//  Copyright (c) 2015 <#Project Developer#>. All rights reserved.
//

#import "UINavigationController+Helper.h"
#import <objc/runtime.h>

static char tlNavigationControllerDroppedMenu;

@implementation UINavigationController (Helper)

- ( void ) showDropMenu:(UIView *)menu
			 animated:(BOOL)animated
{
	[self hideDroppedMenuAnimated:NO];
    
	__block CGRect frame;
    CGRect frame1 = self.topViewController.view.frame;
    
    frame1.origin.y = 10;
	UIView *droppedMenu = [[UIView alloc] initWithFrame:frame1];
    droppedMenu.tag = 999999;
	objc_setAssociatedObject( self, &tlNavigationControllerDroppedMenu, droppedMenu, OBJC_ASSOCIATION_RETAIN_NONATOMIC );
    //UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(removeDroppedMenu)];
    
    UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureHandler:)];
    tapGR.delegate=self;
    tapGR.numberOfTapsRequired=1;
    [droppedMenu addGestureRecognizer:tapGR];
	droppedMenu.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.5];
    
	[droppedMenu addSubview:menu];
    [menu setExclusiveTouch:YES];
	[self.topViewController.view addSubview:droppedMenu];
    
	frame = menu.frame;
    
	void (^animations) ( void ) = ^
	{
		droppedMenu.alpha = 1.0;
		frame.origin.y = 0;
		menu.frame = frame;
	};
    
	if ( animated )
	{
		droppedMenu.alpha = 0.0;
        
		frame.origin.y = -frame.size.height;
		menu.frame = frame;
		[UIView animateWithDuration:0.3 delay:0.0 options:0 animations:animations completion:^(BOOL finished) {
            
        }];
	}
	else
	{
		animations();
	}
}
-(void)removeDroppedMenu
{
    
}
- ( void ) hideDroppedMenuAnimated:(BOOL)animated
{
	UIView *droppedMenu = objc_getAssociatedObject( self, &tlNavigationControllerDroppedMenu );
	UIView *content = droppedMenu.subviews[0];
    
	void (^animations) ( void ) = ^
	{
		CGRect frame = content.frame;
		droppedMenu.alpha = 0.0;
		frame.origin.y = -frame.size.height;
		content.frame = frame;
	};
    
	void (^completion) ( BOOL ) = ^( BOOL completed )
	{
		for (UIView *droppedMenu in self.topViewController.view.subviews)
        {
            if (droppedMenu.tag == 999999)
            {
                [UIView animateWithDuration:0.2
                                 animations:^{droppedMenu.alpha = 0.0;}
                                 completion:^(BOOL finished){  [droppedMenu removeFromSuperview];;
                                     [[droppedMenu subviews] makeObjectsPerformSelector:@selector(removeFromSuperview)];
                                     [droppedMenu removeFromSuperview];
                                     objc_setAssociatedObject( self, &tlNavigationControllerDroppedMenu, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC );
                                     
                                 }];
                
            }
        }
	};
    
    
    
	if ( animated )
	{
		[UIView animateWithDuration:0.3 delay:0.0 options:0 animations:animations completion:completion];
	}
	else
	{
		animations();
		completion( YES );
	}
    
}


- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    if (touch.view != [self.topViewController.view viewWithTag:999999])
    {
        // accept only touchs on superview, not accept touchs on subviews
        return NO;
    }
    
    return YES;
}
-(void) tapGestureHandler:(UITapGestureRecognizer *)sender
{
    CGPoint point = [sender locationInView:sender.view];
    UIView *viewTouched = [sender.view hitTest:point withEvent:nil];
    if (viewTouched.tag ==999999)
    {
        [self hideDroppedMenuAnimated:YES];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"clickedMainMenu" object:nil];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"clickedHomeMenu" object:nil];
    }
    else
    {
       
    }
}

- (void)dropShadowWithOffset:(CGSize)offset
                      radius:(CGFloat)radius
                       color:(UIColor *)color
                     opacity:(CGFloat)opacity {
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, self.navigationBar.bounds);
    self.navigationBar.layer.shadowPath = path;
    CGPathCloseSubpath(path);
    CGPathRelease(path);
    
    self.navigationBar.layer.shadowColor = color.CGColor;
    self.navigationBar.layer.shadowOffset = offset;
    self.navigationBar.layer.shadowRadius = radius;
    self.navigationBar.layer.shadowOpacity = opacity;
    
    self.navigationBar.clipsToBounds = NO;
    
}


- (void)pushViewController:(UIViewController *)viewController withTransition:(UIViewAnimationTransition)inTransition
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration: 0.5];
    
    [UIView setAnimationTransition:inTransition forView:self.view cache:YES];
    [self pushViewController:viewController animated:NO];
    
    [UIView commitAnimations];
}

- (void)popViewControllerWithTransition:(UIViewAnimationTransition)inTransition
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration: 0.5];
    
    [UIView setAnimationTransition:inTransition forView:self.view cache:YES];
    [self popViewControllerAnimated:NO];
    
    [UIView commitAnimations];
}



@end
