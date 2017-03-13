//
//  BaseViewController.h
//  SampleProject
//
//  Created by <#Project Developer#> on 16/07/2015.
//  Copyright (c) 2015 <#Project Developer#>. All rights reserved.
//
#import <Foundation/Foundation.h>
#import  <UIKit/UIKit.h>


typedef enum {
    UINavigationBarRightButtonTypeNone,
    UINavigationBarRightButtonTypeSearch,
    UINavigationBarRightButtonTypeTick,
} UINavigationBarRightButtonType;

typedef enum {
    UINavigationBarLeftButtonTypeNone,
    UINavigationBarLeftButtonTypeBack,
    UINavigationBarLeftButtonTypeMenu,
} UINavigationBarLeftButtonType;

@protocol BaseViewControllerDelegate <NSObject>

@optional
- (void)rightNavigationBarButtonClicked;
- (void)leftNavigationBarButtonClicked;
@end

@interface BaseViewController : UIViewController

@property (nonatomic, assign) id <BaseViewControllerDelegate> baseDelegate;

@property (nonatomic, strong) UIButton *leftButton;
@property (nonatomic, strong) UIButton *rightButton;
@property (nonatomic, strong) UIBarButtonItem* rightbtnItem;
@property (nonatomic, strong) UIBarButtonItem* leftbtnItem;
@property (nonatomic, assign) UINavigationBarLeftButtonType leftbtnType;
@property (nonatomic, assign) UINavigationBarRightButtonType rightbtnType;


- (UIViewController*)backViewController;

- (void)setupNavigationBarTitle:(NSString*)title showRightButton:(BOOL)showRightButton leftButtonType:(UINavigationBarLeftButtonType)leftButtonType rightButtonType:(UINavigationBarRightButtonType)rightButtonType;

- (void)setupNavigationBarWithTitleImage:(NSString *)imageURL showBackButtonIfNeeded:(BOOL)show;

- (void)changeButtonColor:(UIColor *)color;

- (void)hideStatusBar:(BOOL)hide;

- (void)hideNavigationBar:(BOOL)hide;

- (void)goBackToIndex:(int)backIndex;

- (void)goBackToIndex:(int)backIndex animated:(BOOL)animate;

- (void)makeUINavigationBarTransparent;

- (void)logoutToLoginViewController;


- (void)enableEdgePanGestureRecognizerToPopViewController:(BOOL)enable;

@end











