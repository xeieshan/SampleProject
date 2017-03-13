//
//  ViewController.m
//  SampleProject
//
//  Created by <#Project Developer#> on 13/11/2015.
//  Copyright (c) 2015 <#Project Developer#>. All rights reserved.
//

#import "ViewController.h"
#import "ConstantLogMacros.h"

@implementation ViewController
#pragma mark -
#pragma mark UIViewController Lifecycle
#pragma mark -

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Initializations
    [self initializations];
    //SetupView
    [self setUpView];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (void)setUpView
{
    keyBoard = [[SPKeyboardControls alloc] initWithFields:@[tf1,tf2,tf3]];
    [keyBoard setDelegate:self];
    [keyBoard setVisibleControls:NOKeyboardControlPreviousNext|NOKeyboardControlDone];
    
}
- (void)initializations
{
    id obj = self.view;
    
    SPDBAnyVar(obj);
    
    CGPoint point = CGPointMake(12.34, 56.78);
    SPDBAnyVar(point);
    
    CGSize size = CGSizeMake(87.6, 5.43);
    SPDBAnyVar(size);
    
    CGRect rect = CGRectMake(2.3, 4.5, 5.6, 7.8);
    SPDBAnyVar(rect);
    
    NSRange range = NSMakeRange(3, 56);
    SPDBAnyVar(range);
    
    CGAffineTransform affineTransform = CGAffineTransformMake(1, 2, 3, 4, 5, 6);
    SPDBAnyVar(affineTransform);
    
    UIEdgeInsets edgeInsets = UIEdgeInsetsMake(3, 4, 5, 6);
    SPDBAnyVar(edgeInsets);
    
    SEL sel = @selector(viewDidLoad);
    SPDBAnyVar(sel);
    
    Class class = [UIBarButtonItem class];
    SPDBAnyVar(class);
    
    NSInteger i = 231;
    SPDBAnyVar(i);
    
    CGFloat f = M_E;
    SPDBAnyVar(f);
    
    BOOL b = YES;
    SPDBAnyVar(b);
    
    char c = 'S';
    SPDBAnyVar(c);
    
    CGColorSpaceRef colorSPaceRef = CGColorSpaceCreateDeviceRGB();
    SPDBAnyVar(colorSPaceRef);
    
    //  ......
    
    SPPrintAnything(You can use macro SPPrintAnything() print any without quotation as you want!);
    
    SPPrintf(@"Print format string you customed: %@", SPBox(affineTransform));
    
    NSLog(@"Even use normal NSLog function to print: %@", SPBox(edgeInsets));
    
    SPPrintf(@"The type of obj is %@", SPTypeStringOfVar(obj));
    SPPrintf(@"The type of point is %@", SPTypeStringOfVar(point));
    SPPrintf(@"The type of size is %@", SPTypeStringOfVar(size));
    SPPrintf(@"The type of rect is %@", SPTypeStringOfVar(rect));
    SPPrintf(@"The type of range is %@", SPTypeStringOfVar(range));
    SPPrintf(@"The type of affineTransform is %@", SPTypeStringOfVar(affineTransform));
    SPPrintf(@"The type of edgeInsets is %@", SPTypeStringOfVar(edgeInsets));
    SPPrintf(@"The type of class is %@", SPTypeStringOfVar(class));
    SPPrintf(@"The type of i is %@", SPTypeStringOfVar(i));
    SPPrintf(@"The type of f is %@", SPTypeStringOfVar(f));
    SPPrintf(@"The type of b is %@", SPTypeStringOfVar(b));
    SPPrintf(@"The type of c is %@", SPTypeStringOfVar(c));
    SPPrintf(@"The type of colorSPaceRef is %@", SPTypeStringOfVar(colorSPaceRef));
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark -  -

- (void)keyboardControls:(SPKeyboardControls *)keyboardControls selectedField:(UIView *)field inDirection:(SPKeyboardControlsDirection)directio
{
    
}
- (void)keyboardControlsDonePressed:(SPKeyboardControls *)keyboardControls{
    [self.view endEditing:YES];
}
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    [keyBoard setActiveField:textField];
}

@end
