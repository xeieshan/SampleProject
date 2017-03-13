//
//  UITextField+Additions.m
//   SampleProject
//
//  Created by <#Project Developer#> on 16/07/2015.
//  Copyright (c) 2015 <#Project Developer#>. All rights reserved.
//

#import "UITextField+Additions.h"

@implementation UITextField (Additions)

- (void)setupTextIndentation:(CGFloat)indentation {
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, indentation, self.bounds.size.height)];
    leftView.backgroundColor = [UIColor clearColor];
    leftView.userInteractionEnabled = NO;
    self.leftView = leftView;
    self.leftViewMode = UITextFieldViewModeAlways;
}

+ (void)setupTextIndentation:(CGFloat)indentation forViews:(NSArray *)views {
    for (UITextField *textField in views) {
        [textField setupTextIndentation:indentation];
    }
}

- (void)setupSearchView {
    
    CGFloat width = self.bounds.size.height;
    
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, width)];
    leftView.backgroundColor = [UIColor clearColor];
    leftView.userInteractionEnabled = NO;
    
    UIImageView *searchView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ic_location_grey_48x48"]];
    searchView.center = leftView.center;
    [leftView addSubview:searchView];
    self.leftView = leftView;
    self.leftViewMode = UITextFieldViewModeAlways;
}

- (void)setupLeftViewWithImage:(UIImage *)image {
    CGFloat width = self.bounds.size.height;
    
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, width)];
    leftView.backgroundColor = [UIColor clearColor];
    leftView.userInteractionEnabled = NO;
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, width*0.6, width*0.6)];
    imageView.backgroundColor = [UIColor clearColor];
    imageView.userInteractionEnabled = NO;
    imageView.image = image;
    imageView.center = leftView.center;
    [leftView addSubview:imageView];
    self.leftView = leftView;
    self.leftViewMode = UITextFieldViewModeAlways;
}

- (void)setPlaceHolderTextColor:(UIColor *)color{
    if ([self.placeholder respondsToSelector:@selector(drawInRect:withAttributes:)])
    { // iOS7 and later
        NSDictionary *attributes = @{NSForegroundColorAttributeName: color, NSFontAttributeName:self.font};
        CGRect boundingRect = [self.placeholder boundingRectWithSize:self.frame.size options:0 attributes:attributes context:nil];
        [self.placeholder drawAtPoint:CGPointMake(0, (self.frame.size.height/2)-boundingRect.size.height/2) withAttributes:attributes]; }
    else { // iOS 6
        [color setFill];
        [self.placeholder drawInRect:self.frame withFont:self.font lineBreakMode:NSLineBreakByTruncatingTail alignment:self.textAlignment];
    }
}

@end
