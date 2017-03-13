//
//  ViewController.h
//  SampleProject
//
//  Created by <#Project Developer#> on 13/11/2015.
//  Copyright (c) 2015 <#Project Developer#>. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SPKeyboardControls.h"
@interface ViewController : UIViewController <SPKeyboardControlsDelegate>
{
    SPKeyboardControls *keyBoard;
    __weak IBOutlet UITextField *tf1;
    __weak IBOutlet UITextField *tf2;
    __weak IBOutlet UITextField *tf3;
}
@end
