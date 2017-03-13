//
//  SPKeyboardControls.h
//  SampleProject
//
//  Created by <#Project Developer#> on 30/11/2015.
//  Copyright © 2015 <#Project Developer#>. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  Available controls.
 */
typedef enum
{
    NOKeyboardControlPreviousNext = 1 << 0,
    NOKeyboardControlDone = 1 << 1
} NOKeyboardControl;

/**
 *  Directions in which the fields can be selected.
 *  These are relative to the active field.
 */
typedef enum
{
    SPKeyboardControlsDirectionPrevious = 0,
    SPKeyboardControlsDirectionNext
} SPKeyboardControlsDirection;

@protocol SPKeyboardControlsDelegate;

@interface SPKeyboardControls : UIView

/**
 *  Delegate to send callbacks to.
 */
@property (nonatomic, weak) id <SPKeyboardControlsDelegate> delegate;

/**
 *  Visible controls. Use a bitmask to show multiple controls.
 */
@property (nonatomic, assign) NOKeyboardControl visibleControls;

/**
 *  Fields which the controls should handle.
 *  The order of the fields is important as this determines which text field
 *  is the previous and which is the next.
 *  All fields will automatically have the input accessory view set to
 *  the instance of the controls.
 */
@property (nonatomic, strong) NSArray *fields;

/**
 *  The active text field.
 *  This should be set when the user begins editing a text field or a text view
 *  and it is automatically set when selecting the previous or the next field.
 */
@property (nonatomic, strong) UIView *activeField;

/**
 *  Style of the toolbar.
 */
@property (nonatomic, assign) UIBarStyle barStyle;

/**
 *  Tint color of the toolbar.
 */
@property (nonatomic, strong) UIColor *barTintColor;

/**
 *  Tint color of the segmented control.
 */
@property (nonatomic, strong) UIColor *segmentedControlTintControl;

/**
 *  Title of the previous button. If this is not set, a default localized title will be used.
 */
@property (nonatomic, strong) NSString *previousTitle;

/**
 *  Title of the next button. If this is not set, a default localized title will be used.
 */
@property (nonatomic, strong) NSString *nextTitle;

/**
 *  Title of the done button. If this is not set, a default localized title will be used.
 */
@property (nonatomic, strong) NSString *doneTitle;

/**
 *  Tint color of the done button.
 */
@property (nonatomic, strong) UIColor *doneTintColor;

/**
 *  Initialize keyboard controls.
 *  @param fields Fields which the controls should handle.
 *  @return Initialized keyboard controls.
 */
- (id)initWithFields:(NSArray *)fields;

@end

@protocol SPKeyboardControlsDelegate <NSObject>
@optional
/**
 *  Called when a field was selected by going to the previous or the next field.
 *  The implementation of this method should scroll to the view.
 *  @param keyboardControls The instance of keyboard controls.
 *  @param field The selected field.
 *  @param direction Direction in which the field was selected.
 */
- (void)keyboardControls:(SPKeyboardControls *)keyboardControls selectedField:(UIView *)field inDirection:(SPKeyboardControlsDirection)direction;

/**
 *  Called when the done button was pressed.
 *  @param keyboardControls The instance of keyboard controls.
 */
- (void)keyboardControlsDonePressed:(SPKeyboardControls *)keyboardControls;
@end
