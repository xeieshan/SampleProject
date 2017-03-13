//
//  BaseViewController.m
//  SampleProject
//
//  Created by <#Project Developer#> on 16/07/2015.
//  Copyright (c) 2015 <#Project Developer#>. All rights reserved.

#import "BaseViewController.h"
#import "SPSlideAnimationTransition.h"
#import <MessageUI/MessageUI.h>
#import "ConstantMacros_All.h"

@interface BaseViewController ()<UIGestureRecognizerDelegate, UINavigationControllerDelegate, MFMessageComposeViewControllerDelegate>

@property UIScreenEdgePanGestureRecognizer *edgePanGestureRecognizer;
@property UIPercentDrivenInteractiveTransition *percentDrivenInteractiveTransition;

@end

@implementation BaseViewController

#pragma mark - UIViewController Life Cycle

- (id)initWithNibName:(NSString*)nibNameOrNil bundle:(NSBundle*)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];

    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.navigationController.navigationBar.translucent = NO;
    [self.navigationController.interactivePopGestureRecognizer setDelegate:nil];
//    self.edgePanGestureRecognizer = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(handleScreenEdgePanGesture:)];
//    self.edgePanGestureRecognizer.edges = UIRectEdgeLeft;
//    [self.view addGestureRecognizer:self.edgePanGestureRecognizer];
}

- (UIViewController*)backViewController
{
    NSInteger numberOfViewControllers = self.navigationController.viewControllers.count;

    if (numberOfViewControllers < 2)
        return nil;
    else
        return [self.navigationController.viewControllers objectAtIndex:numberOfViewControllers - 2];
}

- (void)setupNavigationBarTitle:(NSString*)title showRightButton:(BOOL)showRightButton leftButtonType:(UINavigationBarLeftButtonType)leftButtonType rightButtonType:(UINavigationBarRightButtonType)rightButtonType
{
    [self hideNavigationBar:NO];
    
    _leftbtnType = leftButtonType;
    _rightbtnType = rightButtonType;
    
    if (showRightButton) {
        _rightButton = [[UIButton alloc] init];
        
        UIImage* optionsImage = (rightButtonType == UINavigationBarRightButtonTypeTick)?UIImageFromName(@"sample"):nil;;//Get Images from UIConfiguration

        _rightButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
        [_rightButton addTarget:self action:@selector(rightNavigationButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [_rightButton setImage:optionsImage forState:UIControlStateNormal];
        
        
        _rightButton.contentMode = UIViewContentModeScaleAspectFit;
        _rightbtnItem = [[UIBarButtonItem alloc] initWithCustomView:_rightButton];
        UIBarButtonItem* negativeSpacer = [[UIBarButtonItem alloc]
            initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                 target:nil
                                 action:nil];
        negativeSpacer.width = IS_IOS_6 ? -6 : -16;
        [self.navigationItem setRightBarButtonItems:[NSArray arrayWithObjects:negativeSpacer,_rightbtnItem, nil] animated:NO];
    }
    else
    {
        _rightButton.hidden = YES;
    }
    
    _leftButton = [[UIButton alloc] init];
    UIImage* menuImage =  (leftButtonType == UINavigationBarLeftButtonTypeMenu)?UIImageFromName(@"sample"):(leftButtonType == UINavigationBarLeftButtonTypeBack)?UIImageFromName(@"sample"):nil; //Get Images from UIConfiguration
    
    [_leftButton setFrame:CGRectMake(0, 0, 44, 44)];
    [_leftButton addTarget:self action:@selector(leftNavigationButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [_leftButton setImage:menuImage forState:UIControlStateNormal];
    _leftbtnItem = [[UIBarButtonItem alloc] initWithCustomView:_leftButton];
    
    UIBarButtonItem* negativeSpacer = [[UIBarButtonItem alloc]
        initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                             target:nil
                             action:nil];
    negativeSpacer.width = IS_IOS_6 ? -6 : -16;
    [self.navigationItem setLeftBarButtonItems:[NSArray arrayWithObjects:negativeSpacer,_leftbtnItem, nil] animated:NO];

    if (title != nil)
    {
        self.navigationItem.title = title;
    }
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    self.baseDelegate = nil;
}

- (void)changeButtonColor:(UIColor *)color
{
    [_leftButton setBackgroundColor:color];
}

// 
#pragma mark -
#pragma mark Navigation Buttons Action
#pragma mark -



- (void)rightNavigationButtonClicked:(id)sender
{
    NSLog(@"Right Navigation Button Clicked");
    
    if (self.baseDelegate && [self.baseDelegate respondsToSelector:@selector(rightNavigationBarButtonClicked)])
    {
        [self.baseDelegate rightNavigationBarButtonClicked];
    }
}



- (void)leftNavigationButtonClicked:(id)sender
{
    NSLog(@"Left Navigation Button Clicked");
    
    if (self.navigationController.viewControllers.count > 1)
    {
        if (self.baseDelegate && [self.baseDelegate respondsToSelector:@selector(leftNavigationBarButtonClicked)])
        {
            [self.baseDelegate leftNavigationBarButtonClicked];
        }
        
        [self.navigationController popViewControllerAnimated:YES];
    }
    else [self btnMenuClicked];
}


- (void)btnMenuClicked
{
    //Add Menu View controller Here.
    
//    if ([self.parentViewController.parentViewController isKindOfClass:[MenuViewController class]])
//    {
//        [self.view endEditing:YES];
//        
//        [(MenuViewController *)self.parentViewController.parentViewController animateMenuSlider:YES];
//    }

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


#pragma mark - Methods Implementation

- (void)hideStatusBar:(BOOL)hide
{
    [[UIApplication sharedApplication] setStatusBarHidden:hide withAnimation:UIStatusBarAnimationNone];
}

- (void)hideNavigationBar:(BOOL)hide
{
    self.navigationController.navigationBarHidden = hide;
}

- (void)goBackToIndex:(int)backIndex
{
    [self goBackToIndex:backIndex animated:YES];
}

- (void)goBackToIndex:(int)backIndex animated:(BOOL)animate
{
    if ((self.navigationController.viewControllers.count - backIndex) > 0) {
        BaseViewController* controller = (BaseViewController*)[self.navigationController.viewControllers objectAtIndex:(self.navigationController.viewControllers.count - 1 - backIndex)];

        [self.navigationController popToViewController:controller animated:animate];
    }
}

- (void)makeUINavigationBarTransparent
{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
}

- (void)setupNavigationBarWithTitleImage:(NSString *)imageName showBackButtonIfNeeded:(BOOL)show
{
    [self hideNavigationBar:NO];
    
    UIImageView *barImageView = [[UIImageView alloc] initWithImage:UIImageFromName(imageName)];
    
    [self.navigationItem setTitleView:barImageView];
    
    [self showBackButtonIfNeeded:show];
}
- (void)showBackButtonIfNeeded:(BOOL)show
{
    if (show)
    {
        UIImage *backBarImage = (self.navigationController.viewControllers.count > 1? NavBarBackImage:NavBarMenuImage);
        
        self.leftButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, backBarImage.size.width, backBarImage.size.height)];
        
        [self.leftButton addTarget:self action:@selector(leftNavigationButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.leftButton setImage:backBarImage forState:UIControlStateNormal];
        
        UIBarButtonItem *backbtnItem = [[UIBarButtonItem alloc] initWithCustomView:self.leftButton];
        
        [[self navigationItem] setLeftBarButtonItem:backbtnItem];
    }
}


- (void)logoutToLoginViewController
{
    [self.navigationController popToRootViewControllerAnimated:YES];
    
//    [UtilityFunctions setValueInUserDefaults:@(NO) forKey:@"user"];
}

- (void)enableEdgePanGestureRecognizerToPopViewController:(BOOL)enable
{
    if (enable)
    {
        self.edgePanGestureRecognizer = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(screenEdgePanGestureRecognized:)];
        [self.edgePanGestureRecognizer setEdges:UIRectEdgeLeft];
        self.edgePanGestureRecognizer.delegate = self;
        
        [self.view addGestureRecognizer:self.edgePanGestureRecognizer];
    }
}

#pragma mark - UIScreenEdgePanGestureRecognizer Method

- (void)screenEdgePanGestureRecognized:(UIScreenEdgePanGestureRecognizer *)sender
{
    if (sender.state == UIGestureRecognizerStateBegan)
    {
        NSLog(@"screenEdgePanGestureRecognized");
        if (self.navigationController.viewControllers.count > 1)
        {
            [self.navigationController popViewControllerAnimated:YES];
        }
    }
}

#pragma mark - 

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}




#pragma mark - UIViewControllerAnimatedTransitioning Methods

- (void)handleScreenEdgePanGesture:(UIScreenEdgePanGestureRecognizer *)sender
{
    CGFloat width = self.view.frame.size.width,
    percent = MAX([sender translationInView:self.view].x, 0) / width;
    
    switch (sender.state) {
        case UIGestureRecognizerStateBegan:

            self.navigationController.delegate = self;
            [self.navigationController popViewControllerAnimated:YES];
            break;
        case UIGestureRecognizerStateChanged:
            
            [self.percentDrivenInteractiveTransition updateInteractiveTransition:percent];
            break;
        case UIGestureRecognizerStateEnded:
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateFailed:

            if (percent > 0.5 || fabs([sender velocityInView:self.view].x) > 1000)
                [self.percentDrivenInteractiveTransition finishInteractiveTransition];
            else
                [self.percentDrivenInteractiveTransition cancelInteractiveTransition];
            break;
        default:
            break;
    }
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    return [SPSlideAnimationTransition new];
}

- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController
{
    self.navigationController.delegate = nil;
    
    if (self.edgePanGestureRecognizer.state == UIGestureRecognizerStateBegan) {
        self.percentDrivenInteractiveTransition = [UIPercentDrivenInteractiveTransition new];
        self.percentDrivenInteractiveTransition.completionCurve = UIViewAnimationOptionCurveEaseOut;
    } else {
        self.percentDrivenInteractiveTransition = nil;
    }
    
    return self.percentDrivenInteractiveTransition;
}

#pragma mark -
#pragma mark MFMAILCOMPOSER Delegates
#pragma mark -
- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    
    if (result == MFMailComposeResultSent)
    {
        NSLog(@"MFMailComposeResultSent");
    }
    else if (result == MFMailComposeResultSaved)
    {
        NSLog(@"MFMailComposeResultSaved");
    }
    else if (result == MFMailComposeResultFailed)
    {
        NSLog(@"MFMailComposeResultFailed");
    }
    else if (result == MFMailComposeResultCancelled)
    {
        NSLog(@"MFMailComposeResultCancelled");
    }
    
    [controller dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark -
#pragma mark MFMAILCOMPOSER Delegates
#pragma mark -
- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result{
    
    [controller dismissViewControllerAnimated:YES
                                   completion:^{
                                       
                                   }];
    
    if (result == MessageComposeResultSent)
    {
        NSLog(@"MessageComposeResultSent");
    }
    else if (result == MessageComposeResultFailed)
    {
        NSLog(@"MessageComposeResultFailed");
    }
    else if (result == MessageComposeResultCancelled)
    {
        NSLog(@"MessageComposeResultCancelled");
    }
}

@end
