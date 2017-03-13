//
//  SPKeyboardControls.m
//  SampleProject
//
//  Created by <#Project Developer#> on 30/11/2015.
//  Copyright © 2015 <#Project Developer#>. All rights reserved.
//

#import "SPKeyboardControls.h"

typedef enum : NSUInteger {
    SPKeyboardNotificationTypeWillShow,
    SPKeyboardNotificationTypeDidShow,
    SPKeyboardNotificationTypeWillHide,
    SPKeyboardNotificationTypeDidHide
} SPKeyboardNotificationType;

@interface SPKeyboardControls ()
{
     CGSize                   _kbSize;
}
@property (nonatomic, strong) UIToolbar *toolbar;
@property (nonatomic, strong) UISegmentedControl *segmentedControl;
@property (nonatomic, strong) UIBarButtonItem *doneButton;
@property (nonatomic, strong) UIBarButtonItem *segmentedControlItem;
@end

@implementation SPKeyboardControls

#pragma mark -
#pragma mark Lifecycle

- (id)init
{
    return [self initWithFields:nil];
}

- (id)initWithFrame:(CGRect)frame
{
    return [self initWithFields:nil];
}

- (id)initWithFields:(NSArray *)fields
{
    if (self = [super initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 44.0f)])
    {
        [self setToolbar:[[UIToolbar alloc] initWithFrame:self.frame]];
        [self.toolbar setBarStyle:UIBarStyleDefault];
        [self.toolbar setAutoresizingMask:(UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleWidth)];
        [self addSubview:self.toolbar];
        
        [self setSegmentedControl:[[UISegmentedControl alloc] initWithItems:@[ NSLocalizedStringFromTable(@"Previous", @"NOKeyboardControls", @"Previous button title."),
                                   NSLocalizedStringFromTable(@"Next", @"NOKeyboardControls", @"Next button title.") ]]];
        [self.segmentedControl addTarget:self action:@selector(segmentedControlValueChanged:) forControlEvents:UIControlEventValueChanged];
        [self.segmentedControl setMomentary:YES];
        [self.segmentedControl setEnabled:NO forSegmentAtIndex:SPKeyboardControlsDirectionPrevious];
        [self.segmentedControl setEnabled:NO forSegmentAtIndex:SPKeyboardControlsDirectionNext];
        [self setSegmentedControlItem:[[UIBarButtonItem alloc] initWithCustomView:self.segmentedControl]];
        
        [self setDoneButton:[[UIBarButtonItem alloc] initWithTitle:NSLocalizedStringFromTable(@"Done", @"NOKeyboardControls", @"Done button title.")
                                                             style:UIBarButtonItemStyleDone
                                                            target:self
                                                            action:@selector(doneButtonPressed:)]];
        
        [self setVisibleControls:(NOKeyboardControlPreviousNext | NOKeyboardControlDone)];
        
        [self setFields:fields];
        
        [self updateSegmentedControlEnabledStates];
//        static dispatch_once_t onceToken;
//        dispatch_once(&onceToken, ^{
//            [self registerForKeyboardNotifications];
//            [self unregisterForKeyboardNotifications];
//        });
    }
    
    return self;
}

- (void)dealloc
{
    [self setFields:nil];
    [self setSegmentedControlTintControl:nil];
    [self setPreviousTitle:nil];
    [self setBarTintColor:nil];
    [self setNextTitle:nil];
    [self setDoneTitle:nil];
    [self setDoneTintColor:nil];
    [self setActiveField:nil];
    [self setToolbar:nil];
    [self setSegmentedControl:nil];
    [self setSegmentedControlItem:nil];
    [self setDoneButton:nil];
}

#pragma mark -
#pragma mark Public Methods

- (void)setActiveField:(id)activeField
{
    if (activeField != _activeField)
    {
        if ([self.fields containsObject:activeField])
        {
            _activeField = activeField;
            
            if (![activeField isFirstResponder])
            {
                [activeField becomeFirstResponder];
            }
            
            [self updateSegmentedControlEnabledStates];
        }
    }
}

- (void)setFields:(NSArray *)fields
{
    if (fields != _fields)
    {
        for (UIView *field in fields)
        {
            if ([field isKindOfClass:[UITextField class]])
            {
                [(UITextField *)field setInputAccessoryView:self];
            }
            else if ([field isKindOfClass:[UITextView class]])
            {
                [(UITextView *)field setInputAccessoryView:self];
            }
        }
        
        _fields = fields;
    }
}

- (void)setBarStyle:(UIBarStyle)barStyle
{
    if (barStyle != _barStyle)
    {
        [self.toolbar setBarStyle:barStyle];
        
        _barStyle = barStyle;
    }
}

- (void)setBarTintColor:(UIColor *)barTintColor
{
    if (barTintColor != _barTintColor)
    {
        [self.toolbar setTintColor:barTintColor];
        
        _barTintColor = barTintColor;
    }
}

- (void)setSegmentedControlTintControl:(UIColor *)segmentedControlTintControl
{
    if (segmentedControlTintControl != _segmentedControlTintControl)
    {
        [self.segmentedControl setTintColor:segmentedControlTintControl];
        
        _segmentedControlTintControl = segmentedControlTintControl;
    }
}

- (void)setPreviousTitle:(NSString *)previousTitle
{
    if (![previousTitle isEqualToString:_previousTitle])
    {
        [self.segmentedControl setTitle:previousTitle forSegmentAtIndex:SPKeyboardControlsDirectionPrevious];
        
        _previousTitle = previousTitle;
    }
}

- (void)setNextTitle:(NSString *)nextTitle
{
    if (![nextTitle isEqualToString:_nextTitle])
    {
        [self.segmentedControl setTitle:nextTitle forSegmentAtIndex:SPKeyboardControlsDirectionNext];
        
        _nextTitle = nextTitle;
    }
}

- (void)setDoneTitle:(NSString *)doneTitle
{
    if (![doneTitle isEqualToString:_doneTitle])
    {
        [self.doneButton setTitle:doneTitle];
        
        _doneTitle = doneTitle;
    }
}

- (void)setDoneTintColor:(UIColor *)doneTintColor
{
    if (doneTintColor != _doneTintColor)
    {
        [self.doneButton setTintColor:doneTintColor];
        
        _doneTintColor = doneTintColor;
    }
}

- (void)setVisibleControls:(NOKeyboardControl)visibleControls
{
    if (visibleControls != _visibleControls)
    {
        _visibleControls = visibleControls;
        
        [self.toolbar setItems:[self toolbarItems]];
    }
}

#pragma mark -
#pragma mark Private Methods

- (void)segmentedControlValueChanged:(id)sender
{
    switch (self.segmentedControl.selectedSegmentIndex)
    {
        case SPKeyboardControlsDirectionPrevious:
            [self selectPreviousField];
            break;
        case SPKeyboardControlsDirectionNext:
            [self selectNextField];
            break;
        default:
            break;
    }
}

- (void)doneButtonPressed:(id)sender
{
    if ([self.delegate respondsToSelector:@selector(keyboardControlsDonePressed:)])
    {
        [self.delegate keyboardControlsDonePressed:self];
    }
}

- (void)updateSegmentedControlEnabledStates
{
    NSInteger index = [self.fields indexOfObject:self.activeField];
    if (index != NSNotFound)
    {
        [self.segmentedControl setEnabled:(index > 0) forSegmentAtIndex:SPKeyboardControlsDirectionPrevious];
        [self.segmentedControl setEnabled:(index < [self.fields count] - 1) forSegmentAtIndex:SPKeyboardControlsDirectionNext];
    }
}

- (void)selectPreviousField
{
    NSInteger index = [self.fields indexOfObject:self.activeField];
    if (index > 0)
    {
        index -= 1;
        UIView *field = [self.fields objectAtIndex:index];
        [self setActiveField:field];
        
        if ([self.delegate respondsToSelector:@selector(keyboardControls:selectedField:inDirection:)])
        {
            [self.delegate keyboardControls:self selectedField:field inDirection:SPKeyboardControlsDirectionPrevious];
        }
    }
}

- (void)selectNextField
{
    NSInteger index = [self.fields indexOfObject:self.activeField];
    if (index < [self.fields count] - 1)
    {
        index += 1;
        UIView *field = [self.fields objectAtIndex:index];
        [self setActiveField:field];
        
        if ([self.delegate respondsToSelector:@selector(keyboardControls:selectedField:inDirection:)])
        {
            [self.delegate keyboardControls:self selectedField:field inDirection:SPKeyboardControlsDirectionNext];
        }
    }
}

- (NSArray *)toolbarItems
{
    NSMutableArray *items = [NSMutableArray arrayWithCapacity:3];
    if (self.visibleControls & NOKeyboardControlPreviousNext)
    {
        [items addObject:self.segmentedControlItem];
    }
    
    if (self.visibleControls & NOKeyboardControlDone)
    {
        [items addObject:[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil]];
        [items addObject:self.doneButton];
    }
    
    return items;
}

//
//- (void) registerForKeyboardNotifications
//{
//    [self registerWillShowNotification];
//    [self registerWillHideNotification];
//    [self registerDidShowNotification];
//    [self registerDidHideNotification];
//}
//- (void)registerWillShowNotification
//{
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
//}
//- (void)registerWillHideNotification
//{
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
//}
//- (void)registerDidShowNotification
//{
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidShow:) name:UIKeyboardDidShowNotification object:nil];
//}
//- (void)registerDidHideNotification
//{
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidHide:) name:UIKeyboardDidHideNotification object:nil];
//}
//- (void) unregisterForKeyboardNotifications
//{
//    [self unregisterWillShowNotification];
//    [self unregisterWillHideNotification];
//    [self unregisterDidShowNotification];
//    [self unregisterDidHideNotification];
//}
//- (void)unregisterWillShowNotification
//{
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
//}
//- (void)unregisterWillHideNotification
//{
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
//}
//- (void)unregisterDidShowNotification
//{
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidShowNotification object:nil];
//}
//- (void)unregisterDidHideNotification
//{
//    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardDidHideNotification object:nil];
//}
//#pragma mark - notification callbacks
//
//- (void)keyboardWillShow:(NSNotification *)notification
//{
//    [self performAnimationFor:SPKeyboardNotificationTypeWillShow andNotification:notification];
//}
//- (void)keyboardWillHide:(NSNotification *)notification
//{
//    [self performAnimationFor:SPKeyboardNotificationTypeWillHide andNotification:notification];
//}
//- (void)keyboardDidShow:(NSNotification *)notification
//{
//    [self performAnimationFor:SPKeyboardNotificationTypeDidShow andNotification:notification];
//}
//- (void)keyboardDidHide:(NSNotification *)notification
//{
//    [self performAnimationFor:SPKeyboardNotificationTypeDidHide andNotification:notification];
//}
//
//- (void)performAnimationFor:(SPKeyboardNotificationType)keyboardNotificationType andNotification:(NSNotification*)notification {
//    NSDictionary *info = [notification userInfo];
//    
//    NSTimeInterval animationDuration = [[info objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
//    NSInteger curve                  = [[info objectForKey:UIKeyboardAnimationCurveUserInfoKey] intValue] << 16;
//    
//    CGSize oldKBSize = _kbSize;
//    CGRect keyboardFrame             = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
//    _kbSize = keyboardFrame.size;
//    
//    [UIView animateWithDuration:animationDuration
//                          delay:0.0
//                        options:curve
//                     animations:^{
//                         
//                         switch (keyboardNotificationType) {
//                             case SPKeyboardNotificationTypeWillShow:
//                             {
//                                 
//                             }
//                                 break;
//                             case SPKeyboardNotificationTypeDidShow:
//                             {
//                                 
//                             }
//                                 break;
//                             case SPKeyboardNotificationTypeWillHide:
//                             {
//                                 
//                             }
//                                 break;
//                             case SPKeyboardNotificationTypeDidHide:
//                             {
//                                 
//                             }
//                                 break;
//                             default:
//                                 break;
//                         }
//                     }
//                     completion:nil];
//}

@end
