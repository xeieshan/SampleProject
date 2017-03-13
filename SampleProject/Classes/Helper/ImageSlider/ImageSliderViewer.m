//
//  ImageSliderViewer.m
//  SampleProject
//
//  Created by <#Project Developer#> on 15/07/2015.
//  Copyright (c) 2015 <#Project Developer#>. All rights reserved.

#import "ImageSliderViewer.h"
#import "PageControl.h"

@interface ImageSliderViewer()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) PageControl *pageController;
@property (nonatomic, strong) UITapGestureRecognizer *tapGesture;
@property (nonatomic, assign) NSInteger pageNumber;

@end


@implementation ImageSliderViewer


#pragma mark - Initializer

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        [self initialize];
    }
    
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self)
    {
        [self initialize];
    }
    
    return self;
}

- (void)initialize
{
    self.pageNumber = 0;
    
    self.scrollView = [UIScrollView new];
    self.scrollView.delegate = self;
    [self.scrollView setPagingEnabled:YES];
    self.scrollView.backgroundColor = [UIColor clearColor];
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;

    
    self.pageController = [[PageControl alloc] initWithCurrentPageImage:@"currentPageDot" inactivePageImage:@"pageDot"];
    self.pageController.currentPage = self.pageNumber;

    [self addSubview:self.scrollView];
    [self addSubview:self.pageController];
    
    self.tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClicked:)];
    self.tapGesture.numberOfTapsRequired = 1;
    self.tapGesture.numberOfTouchesRequired = 1;
    
    [self addGestureRecognizer:self.tapGesture];
}


#pragma mark - UITapGestureRecognizer

- (void)tapClicked:(UITapGestureRecognizer *)recognizer
{
    if ([self.delegate respondsToSelector:@selector(userTappedOnImageSlider:)])
    {
        [self.delegate userTappedOnImageSlider:self];
    }
}


#pragma mark - NSLayoutConstraint

- (void)addConstraintsToSubViews
{
    self.scrollView.translatesAutoresizingMaskIntoConstraints = NO;
    self.pageController.translatesAutoresizingMaskIntoConstraints = NO;

    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.scrollView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTop multiplier:1.0 constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.scrollView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.scrollView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.scrollView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.pageController attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.pageController attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeBottom multiplier:1.0 constant:8]];
    
    [self layoutIfNeeded];
}

- (void)addImagesToSlider
{
    CGSize cellSize = self.frame.size;
    
    UIImageView *lastImage = nil;
    
    for (int i = 0; i < self.imageNames.count; i++)
    {
        UIImageView *img = [UIImageView new];
        
        img.contentMode = UIViewContentModeScaleToFill;
        img.translatesAutoresizingMaskIntoConstraints = NO;
        
        img.image = self.imageNames[i];
        
        [self.scrollView addSubview:img];
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:img attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeTop multiplier:1.0 constant:0]];

        [self addConstraint:[NSLayoutConstraint constraintWithItem:img attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:cellSize.height]];
        
        if (i == 0)
        {
            [self addConstraint:[NSLayoutConstraint constraintWithItem:img attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeLeading multiplier:1.0 constant:cellSize.width*i]];
        }
        else if (i == self.imageNames.count - 1)
        {
            [self addConstraint:[NSLayoutConstraint constraintWithItem:img attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.scrollView attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0]];
            
            [self addConstraint:[NSLayoutConstraint constraintWithItem:img attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:lastImage attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0]];
        }
        else
        {
            [self addConstraint:[NSLayoutConstraint constraintWithItem:img attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:lastImage attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0]];
        }
        
        [self addConstraint:[NSLayoutConstraint constraintWithItem:img attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:cellSize.width]];
        
        lastImage = img;
    }
    
    [self layoutIfNeeded];
}


#pragma mark - Setters

- (void)setImageNames:(NSArray *)imageNames
{
    _imageNames = imageNames;
    
    [self addConstraintsToSubViews];
    
    [self addImagesToSlider];
    
    self.pageController.numberOfPages = self.imageNames.count;
}

- (void)setImageURLs:(NSArray *)imageURLs
{
    // Will use later. For demo we will use only "setImageNames:"
}

- (void)setShowPageNumbers:(BOOL)showPageNumbers
{
    [self.pageController setHidden:!showPageNumbers];
}

- (void)setDisableTapGesture:(BOOL)disableTapGesture
{
    [self.tapGesture setEnabled:!disableTapGesture];
}


#pragma mark - Helper Methods

- (void)setInitialImageIndex:(NSInteger)index
{
    self.pageController.currentActivePage = index;
    
    [self.scrollView setContentOffset:CGPointMake(index*self.frame.size.width, 0) animated:NO];
}

- (NSInteger)currentImageIndex
{
    return self.pageController.currentPage;
}


#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if (scrollView == self.scrollView)
    {
        CGFloat pageWidth = self.frame.size.width;
        
        NSInteger offsetLooping = 1;
        
        int page = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + offsetLooping;
        
        self.pageController.currentActivePage = page % self.imageNames.count;
    }
}


@end
