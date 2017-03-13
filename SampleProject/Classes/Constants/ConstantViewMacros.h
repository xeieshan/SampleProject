//
//  ConstantViewMacros.h
//  SampleProject
//
//  Created by <#Project Developer#> on 15/07/2015.
//  Copyright (c) 2015 <#Project Developer#>. All rights reserved.
//

// Update current frame
#define UPDATE_FRAME_X(newX)						do{CGRect __tmpFrame = self.frame; __tmpFrame.origin.x = (newX); self.frame = __tmpFrame;}while(0)
#define UPDATE_FRAME_Y(newY)						do{CGRect __tmpFrame = self.frame; __tmpFrame.origin.y = (newY); self.frame = __tmpFrame;}while(0)
#define UPDATE_FRAME_WIDTH(newWidth)				do{CGRect __tmpFrame = self.frame; __tmpFrame.size.width = (newWidth); self.frame = __tmpFrame;}while(0)
#define UPDATE_FRAME_HEIGHT(newHeight)				do{CGRect __tmpFrame = self.frame; __tmpFrame.size.height = (newHeight); self.frame = __tmpFrame;}while(0)
#define UPDATE_FRAME_SIZE(newSize)                  do{CGRect __tmpFrame = self.frame; __tmpFrame.size = (newSize); self.frame = __tmpFrame;}while(0)
#define UPDATE_FRAME_ORIGIN(newOrigin)				do{CGRect __tmpFrame = self.frame; __tmpFrame.origin = (newOrigin); self.frame = __tmpFrame;}while(0)

// Update a view frame
#define UPDATE_VIEW_FRAME_X(aView, newX)			do{CGRect __tmpFrame = aView.frame; __tmpFrame.origin.x = (newX); aView.frame = __tmpFrame;}while(0)
#define UPDATE_VIEW_FRAME_Y(aView, newY)			do{CGRect __tmpFrame = aView.frame; __tmpFrame.origin.y = (newY); aView.frame = __tmpFrame;}while(0)
#define UPDATE_VIEW_FRAME_WIDTH(aView, newWidth)	do{CGRect __tmpFrame = aView.frame; __tmpFrame.size.width = (newWidth); aView.frame = __tmpFrame;}while(0)
#define UPDATE_VIEW_FRAME_HEIGHT(aView, newHeight)	do{CGRect __tmpFrame = aView.frame; __tmpFrame.size.height = (newHeight); aView.frame = __tmpFrame;}while(0)
#define UPDATE_VIEW_FRAME_SIZE(aView,newSize)       do{CGRect __tmpFrame = aView.frame; __tmpFrame.size = (newSize); aView.frame = __tmpFrame;}while(0)
#define UPDATE_VIEW_FRAME_ORIGIN(aView,newOrigin)   do{CGRect __tmpFrame = aView.frame; __tmpFrame.origin = (newOrigin); aView.frame = __tmpFrame;}while(0)

// Update current center
#define UPDATE_CENTER_X(newX)						do{CGPoint __tmpCenter = self.center; __tmpCenter.x = (newX); self.center = __tmpCenter;}while(0)
#define UPDATE_CENTER_Y(newY)						do{CGPoint __tmpCenter = self.center; __tmpCenter.y = (newY); self.center = __tmpCenter;}while(0)

// Update a view center
#define UPDATE_VIEW_CENTER_X(aView, newX)			do{CGPoint __tmpCenter = aView.center; __tmpCenter.x = (newX); aView.center = __tmpCenter;}while(0)
#define UPDATE_VIEW_CENTER_Y(aView, newY)			do{CGPoint __tmpCenter = aView.center; __tmpCenter.y = (newY); aView.center = __tmpCenter;}while(0)

// Autoresizing mask
#define UIViewAutoresizingTopAlign                  (UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleWidth)
#define UIViewAutoresizingBottomAlign               (UIViewAutoresizingFlexibleTopMargin    | UIViewAutoresizingFlexibleWidth)
#define UIViewAutoresizingCentered                  (UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin)
#define UIViewAutoresizingFill                      (UIViewAutoresizingFlexibleHeight       | UIViewAutoresizingFlexibleWidth)

// Default components size
#define STATUS_BAR_DEFAULT_HEIGHT                   20
#define NAVIGATION_BAR_DEFAULT_HEIGHT               44
#define TOOLBAR_DEFAULT_HEIGHT                      44
#define TABBAR_DEFAULT_HEIGHT                       49
