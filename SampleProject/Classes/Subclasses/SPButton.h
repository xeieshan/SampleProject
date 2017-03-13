//
//  SPButton.h
//  SampleProject
//
//  Created by <#Project Developer#> on 12/11/2015.
//  Copyright (c) 2015 <#Project Developer#>. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, SPIconPosition) {
    SPIconPositionTop       = 0,
    SPIconPositionLeft,
    SPIconPositionBottom,
    SPIconPositionRight
};

IB_DESIGNABLE
@interface SPButton : UIButton
@property (nonatomic, assign) IBInspectable CGFloat iconMargin;
@property (nonatomic, assign) IBInspectable NSInteger iconPosition;
@property (nonatomic, assign) IBInspectable CGSize iconSize;    // default is image size;
@end

