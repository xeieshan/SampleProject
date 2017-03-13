//
//  ImageSliderViewer.h
//  SampleProject
//
//  Created by <#Project Developer#> on 15/07/2015.
//  Copyright (c) 2015 <#Project Developer#>. All rights reserved.

#import <UIKit/UIKit.h>

@class ImageSliderViewer;

#pragma mark - ImageSliderViewerDelegate -

@protocol ImageSliderViewerDelegate <NSObject>

@optional
- (void)userTappedOnImageSlider:(ImageSliderViewer *)slider;

@end

@interface ImageSliderViewer : UIView

@property (nonatomic, strong) NSArray *imageURLs;
@property (nonatomic, strong) NSArray *imageNames;
@property (nonatomic, strong) NSIndexPath *indexPath;
@property (nonatomic, assign) BOOL showPageNumbers;
@property (nonatomic, assign) BOOL disableTapGesture;
@property (nonatomic, assign) id<ImageSliderViewerDelegate> delegate;


#pragma mark - Helper Methods -

- (void)setInitialImageIndex:(NSInteger)index;
- (NSInteger)currentImageIndex;

@end
