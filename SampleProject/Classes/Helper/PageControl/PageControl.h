//
//  PageControl.h
//  SampleProject
//
//  Created by <#Project Developer#> on 15/07/2015.
//  Copyright (c) 2015 <#Project Developer#>. All rights reserved.

#import <UIKit/UIKit.h>

@interface PageControl : UIPageControl

@property (nonatomic, strong, readonly) NSString *currentPageImageName;
@property (nonatomic, strong, readonly) NSString *inactivePageImageName;
@property (nonatomic, assign) NSInteger currentActivePage;

- (PageControl *)initWithCurrentPageImage:(NSString *)currentPageImage inactivePageImage:(NSString *)inactivePageImage;

@end
