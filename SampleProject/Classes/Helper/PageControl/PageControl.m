//
//  PageControl.m
//  SampleProject
//
//  Created by <#Project Developer#> on 15/07/2015.
//  Copyright (c) 2015 <#Project Developer#>. All rights reserved.

#import "PageControl.h"

#define kDotSpacing 9.0f
#define kDotSize 7.0f

@implementation PageControl


- (PageControl *)initWithCurrentPageImage:(NSString *)currentPageImage inactivePageImage:(NSString *)inactivePageImage
{
    self = [super init];
    
    if (self)
    {
        _currentPageImageName = currentPageImage;
        _inactivePageImageName = inactivePageImage;
        
        self.currentPageIndicatorTintColor = ColorClear;
        self.pageIndicatorTintColor = ColorClear;
        self.backgroundColor = ColorClear;
    }
    
    return self;
}


- (void)drawRect:(__unused CGRect)rect
{
    if (self.numberOfPages > 1)
    {
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGSize size = [self sizeForNumberOfPages:self.numberOfPages];

        CGContextTranslateCTM(context, (self.frame.size.width - size.width) / 2, self.frame.size.height / 2);

        
        for (int i = 0; i < self.numberOfPages; i++)
        {
            UIImage *dotImage = nil;
            
            if (i == self.currentPage)
            {
                dotImage = [UIImage imageNamed:self.currentPageImageName];
            }
            else
            {
                dotImage = [UIImage imageNamed:self.inactivePageImageName];
            }
            
            CGContextSaveGState(context);
            CGFloat offset = (kDotSize + kDotSpacing) * i + kDotSize / 2;
            CGContextTranslateCTM(context, offset, 0);
            
            if (dotImage)
            {
                [dotImage drawInRect:CGRectMake(-dotImage.size.width / 2, -dotImage.size.height / 2, dotImage.size.width, dotImage.size.height)];
            }
        
            CGContextRestoreGState(context);
        }
    }
}

- (void)setCurrentActivePage:(NSInteger)currentPage
{
    self.currentPage = currentPage;
    
    [self setNeedsDisplay];
}


- (void) updateDots
{
    NSLog(@"SubView: %@", self.subviews);
    for (int i = 0; i < [self.subviews count]; i++)
    {
        UIImageView *dot = [self imageViewForSubview:[self.subviews objectAtIndex:i]];

        if (i == self.currentPage) dot.image = [UIImage imageNamed:self.currentPageImageName];
        else dot.image = [UIImage imageNamed:self.inactivePageImageName];
    }
}

- (UIImageView *) imageViewForSubview: (UIView *) view
{
    UIImageView * dot = nil;
    
    if ([view isKindOfClass: [UIView class]])
    {
        for (UIView* subview in view.subviews)
        {
            if ([subview isKindOfClass:[UIImageView class]])
            {
                dot = (UIImageView *)subview;
                break;
            }
        }
        if (dot == nil)
        {
            dot = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, view.frame.size.width, view.frame.size.height)];
            [view addSubview:dot];
        }
    }
    else
    {
        dot = (UIImageView *) view;
    }
    
    return dot;
}


@end
