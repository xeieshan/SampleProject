//
//  UIViewController+Helper.m
//  SampleProject
//
//  Created by <#Project Developer#> on 25/03/2015.
//  Copyright (c) 2015 <#Project Developer#>. All rights reserved.
//

#import <MobileCoreServices/UTCoreTypes.h>
#import "UIViewController+Helper.h"
#import "ConstantDevices.h"
#import <objc/runtime.h>

@implementation UIViewController (Helper)

@dynamic handler;
@dynamic imagePickerVC;
@dynamic mailVC;
@dynamic messageVC;


static void * const kHandlerAssociatedStorageKey = (void*)&kHandlerAssociatedStorageKey;
static void * const kImagePickerAssociatedStorageKey = (void*)&kImagePickerAssociatedStorageKey;
static void * const kMailAssociatedStorageKey = (void*)&kMailAssociatedStorageKey;
static void * const kMessageAssociatedStorageKey = (void*)&kMessageAssociatedStorageKey;


- (void)setHandler:(MediaSelectionHandler)handler{
    objc_setAssociatedObject(self, kHandlerAssociatedStorageKey, handler, OBJC_ASSOCIATION_COPY);
}

- (MediaSelectionHandler)handler
{
    return objc_getAssociatedObject(self, kHandlerAssociatedStorageKey);
}

- (UIImagePickerController *)imagePickerVC{
    UIImagePickerController *imagePicker = objc_getAssociatedObject(self, kImagePickerAssociatedStorageKey);
    if (imagePicker == nil) {
        // do a lot of stuff
        imagePicker = [[UIImagePickerController alloc] init];
        imagePicker.delegate = self;

        objc_setAssociatedObject(self, kImagePickerAssociatedStorageKey, imagePicker, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    return imagePicker;
}

- (MFMailComposeViewController *)mailVC{
    MFMailComposeViewController *mail = objc_getAssociatedObject(self, kMailAssociatedStorageKey);
    if (mail == nil) {
        // do a lot of stuff
        mail = [[MFMailComposeViewController alloc] init];
        mail.mailComposeDelegate = self;
        objc_setAssociatedObject(self, kMailAssociatedStorageKey, mail, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    return mail;
}

- (MFMessageComposeViewController *)messageVC{
    MFMessageComposeViewController *message = objc_getAssociatedObject(self, kMessageAssociatedStorageKey);
    if (message == nil) {
        // do a lot of stuff
        message = [[MFMessageComposeViewController alloc] init];
        message.messageComposeDelegate = self;
        objc_setAssociatedObject(self, kMessageAssociatedStorageKey, message, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    return message;
}



- (void)addChildViewControllerInContainer:(UIView *)containerView childViewController:(UIViewController *)controller
{
    [self removeAllChildViewControllers];
    
    [self addChildViewController:controller];
    controller.view.frame = containerView.bounds;
    [containerView insertSubview:controller.view atIndex:0];
    [controller didMoveToParentViewController:self];
}

- (void)addChildViewControllerInContainer:(UIView *)containerView childViewController:(UIViewController *)controller preserverViewController:(UIViewController *)dontDeleteVC
{
    [self removeAllChildViewControllersExcept:dontDeleteVC];
    
    [self addChildViewController:controller];
    controller.view.frame = containerView.bounds;
    [containerView insertSubview:controller.view atIndex:0];
    [controller didMoveToParentViewController:self];
}


- (void)removeAllChildViewControllers
{
    for (UIViewController *childController in self.childViewControllers)
    {
        [childController willMoveToParentViewController:nil];
        
        [childController.view removeFromSuperview];
        
        [childController removeFromParentViewController];
    }
}


- (void)removeAllChildViewControllersExcept:(UIViewController *)vc
{
    for (UIViewController *childController in self.childViewControllers)
    {
        if (childController != vc)
        {
            [childController willMoveToParentViewController:nil];
            
            [childController.view removeFromSuperview];
            
            [childController removeFromParentViewController];
        }
    }
}




#pragma mark - UIAlertController Methods

- (void)showAlertViewWithTitle:(NSString *)title message:(NSString *)message
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleCancel handler:nil]];
    
    [self presentViewController:alert animated:YES completion:^{}];
}


- (void)showAlertViewWithTitle:(NSString *)title message:(NSString *)message withDismissCompletion:(AlertViewDismissHandler)dismissHandler
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        dismissHandler();
    }]];
    
    [self presentViewController:alert animated:YES completion:^{}];
}


- (void)showConfirmationAlertViewWithTitle:(NSString *)title message:(NSString *)message withDismissCompletion:(AlertViewConfirmedButtonClickedHandler)dismissHandler
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"YES" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        dismissHandler();
    }]];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"NO" style:UIAlertActionStyleCancel handler:nil]];
    
    
    [self presentViewController:alert animated:YES completion:^{}];
}


- (void)showCurrentPasswordConfirmationAlertViewWithTitle:(NSString *)title message:(NSString *)message withDismissCompletion:(AlertViewCurrentPasswordConfirmedHandler)dismissHandler
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    
    [alert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        dismissHandler(@"");
    }]];

    
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"Update Password" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        UITextField *txtCurrentPassword = alert.textFields.lastObject;
        dismissHandler(txtCurrentPassword.text);
    }];
    

    [alert addAction:confirmAction];
    
    
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField)
     {
         textField.placeholder = @"Current Password";
         textField.secureTextEntry = YES;
         
         [textField addTarget:self action:@selector(alertTextFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
     }];
    
    
    [self presentViewController:alert animated:YES completion:^{}];
}

- (void)showPINConfirmationAlertViewWithDismissCompletion:(AlertViewCurrentPasswordConfirmedHandler)dismissHandler
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"SampleProject PIN" message:@"Please enter your App PIN" preferredStyle:UIAlertControllerStyleAlert];
    
    
    [alert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {}]];
    
    
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"Confirm" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        UITextField *txtCurrentPassword = alert.textFields.lastObject;
        dismissHandler(txtCurrentPassword.text);
    }];
    
    confirmAction.enabled = NO;
    [alert addAction:confirmAction];
    
    
    
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField)
     {
         textField.placeholder = @"App PIN";
         textField.secureTextEntry = YES;
         
         [textField addTarget:self action:@selector(alertTextFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
     }];
    
    
    [self presentViewController:alert animated:YES completion:^{}];
}


- (void)showActionSheetForImageInputWithTitle:(NSString *)title sender:(UIView *)sender withCompletionHandler:(AlertViewButtonClickedAtIndexHandler)completionHandler
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:title preferredStyle:UIAlertControllerStyleActionSheet];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"Camera" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        completionHandler(UIImagePickerControllerSourceTypeCamera);
    }]];
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"Photo Library" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        completionHandler(UIImagePickerControllerSourceTypePhotoLibrary);
    }]];
    
    
    [alertController addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil]];
    
    alertController.popoverPresentationController.sourceView = sender;
    alertController.popoverPresentationController.sourceRect = sender.bounds;
    alertController.popoverPresentationController.permittedArrowDirections = UIPopoverArrowDirectionAny;
    
    [self presentViewController:alertController animated:YES completion:nil];
}


- (void)showActionSheetWithPickerView:(UIPickerView *)pickerView titleMessage:(NSString *)title completionHandler:(AlertViewDismissHandler)completionHandler
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:title preferredStyle:UIAlertControllerStyleActionSheet];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"Done" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        completionHandler();
    }]];
    
    
    [alert addAction:[UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil]];
    
    
    [alert.view addSubview:pickerView];
    
    
    [self presentViewController:alert animated:YES completion:^{}];
}


- (void)alertTextFieldDidChange:(UITextField *)sender
{
    UIAlertController *alertController = (UIAlertController *)self.presentedViewController;
    
    if (alertController)
    {
        UITextField *login = alertController.textFields.firstObject;
        UIAlertAction *okAction = alertController.actions.lastObject;
        okAction.enabled = login.text.length > 2;
    }
}


- (void)showImagePickerWithType:(UIImagePickerControllerSourceType)type sender:(UIView *)sender withCompletionBlock:(MediaSelectionHandler)block{
    [self setHandler:block];
    
    self.imagePickerVC.mediaTypes = @[(NSString *)kUTTypeImage];
    switch (type) {
        case UIImagePickerControllerSourceTypeCamera:
        {
            if(![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
            {
                UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Alert!"
                                                                  message:@"Sorry! Your selected option is not supported by this device."
                                                                 delegate:self
                                                        cancelButtonTitle:@"OK"
                                                        otherButtonTitles:nil];
                
                [message show];
                return;
            }
        }
            break;
            
        default:
            break;
    }
//    self.imagePickerVC.cameraCaptureMode = UIImagePickerControllerCameraCaptureModePhoto;
    self.imagePickerVC.sourceType = type;
    self.imagePickerVC.allowsEditing = YES;
    
    self.imagePickerVC.modalPresentationStyle = UIModalPresentationPopover;
    
    self.imagePickerVC.popoverPresentationController.sourceView = self.view;
    self.imagePickerVC.popoverPresentationController.sourceRect = sender.frame;
    
    [self presentViewController:self.imagePickerVC animated:YES completion:^{
    }];
}

- (void)showVideoPickerWithType:(UIImagePickerControllerSourceType)type sender:(UIView *)sender withCompletionBlock:(MediaSelectionHandler)block{
    [self setHandler:block];
    switch (type) {
        case UIImagePickerControllerSourceTypeCamera:
            if(![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
            {
                UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Alert!"
                                                                  message:@"Sorry! Your selected option is not supported by this device."
                                                                 delegate:self
                                                        cancelButtonTitle:@"OK"
                                                        otherButtonTitles:nil];
                
                [message show];
                return;
            }
            break;
            
        default:
            break;
    }
    
    self.imagePickerVC.mediaTypes = @[(NSString *)kUTTypeMovie,(NSString *)kUTTypeVideo];
    self.imagePickerVC.sourceType = type;
    if (type == UIImagePickerControllerSourceTypeCamera) {
        self.imagePickerVC.cameraCaptureMode = UIImagePickerControllerCameraCaptureModeVideo;
    }
    
    self.imagePickerVC.modalPresentationStyle = UIModalPresentationPopover;
    
    self.imagePickerVC.popoverPresentationController.sourceView = self.view;
    self.imagePickerVC.popoverPresentationController.sourceRect = sender.frame;

    
    [self presentViewController:self.imagePickerVC animated:YES completion:^{}];
}

- (void)pickMediaWithType:(VCType)vcType sender:(UIView*)sender withCompletion:(MediaSelectionHandler)block{
    [self setHandler:block];
    
    UIActionSheet* actionSheet = nil;
    switch (vcType) {
        case VCTypeImagePicker:
        {
            if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"8.0")) {
                
                [self showActionSheetForImageInputWithTitle:@"Choose the media for your picture" sender:sender withCompletionHandler:^(UIImagePickerControllerSourceType selectedOption) {
                    
                    [self showImagePickerWithType:selectedOption sender:sender  withCompletionBlock:self.handler];
                }];
            }
            else{
                
                actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Take Live Photo", @"Pick Photo From Library", nil];
                [actionSheet setTag:1];
            }
            
        }
            break;
            
        case VCTypeVideoPicker:
        {
            if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"8.0")) {
                
                [self showActionSheetForImageInputWithTitle:@"Choose the media for your video" sender:sender withCompletionHandler:^(UIImagePickerControllerSourceType selectedOption) {
                    
                    [self showVideoPickerWithType:selectedOption sender:sender withCompletionBlock:self.handler];
                }];
            }
            else{
                actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Take Live Video", @"Pick Video From Library", nil];
                [actionSheet setTag:2];
            }
        }
            break;
            
        default:
            break;
    }
    [actionSheet showInView:self.view];
}

- (void)sendEmailTo:(NSArray *)to forSubject:(NSString *)subject body:(NSString *)body ccRecipients:(NSArray *)cc bccRecipients:(NSArray *)bcc{    
    [self.mailVC setSubject:subject];
    [self.mailVC setMessageBody:subject isHTML:NO];
    [self.mailVC setToRecipients:to];
    [self.mailVC setCcRecipients:cc];
    [self.mailVC setBccRecipients:bcc];
    
    [self presentViewController:self.mailVC animated:YES completion:NULL];
}

- (void)sendMessageTo:(NSArray *)recipents body:(NSString *)body{
    
    [self.messageVC setRecipients:recipents];
    [self.messageVC setBody:body];
    
    // Present message view controller on screen
    [self presentViewController:self.messageVC animated:YES completion:nil];
}

#pragma mark - UIImagePickerViewControllerDelegate -

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    [picker dismissViewControllerAnimated:YES completion:^{
        NSString *type = [info objectForKey:UIImagePickerControllerMediaType];
        //NSLog(@"type=%@",type);
        NSURL *mediaURL = nil;
        NSData *imageData = nil;
        if ([type isEqualToString:(NSString *)kUTTypeVideo] ||
            [type isEqualToString:(NSString *)kUTTypeMovie])
        {// movie != video
            mediaURL = [info objectForKey:UIImagePickerControllerMediaURL];
            imageData = [NSData dataWithContentsOfURL:mediaURL];
            
            self.handler(mediaURL, imageData, VCTypeVideoPicker, YES);
        }
        else{
            UIImage *selectedImage = (UIImage *)[info objectForKey:UIImagePickerControllerEditedImage];
            
            if (!selectedImage) {
                selectedImage = (UIImage *)[info objectForKey:UIImagePickerControllerOriginalImage];
            }
            UIImage *compressedImage = selectedImage;//[UIImage compressImage:selectedImage compressRatio:0.9f];
            imageData = UIImageJPEGRepresentation(compressedImage, 1.0);
            mediaURL = [info objectForKey:UIImagePickerControllerMediaURL];
            self.handler(mediaURL , imageData, VCTypeImagePicker, YES);
        }
    }];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:^{
        self.handler(nil, nil, VCTypeNone, NO);
    }];
}

#pragma mark - MFMailViewControllerDelegate -

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{
    NSString *string = @"";
    switch (result) {
        case MFMailComposeResultSent:
            string = @"Email sent successfully.";
            break;
        case MFMailComposeResultSaved:
            string = @"Email saved successfully.";
            break;
        case MFMailComposeResultCancelled:
            break;
        case MFMailComposeResultFailed:
            string = @"Mail failed:  An error occurred when trying to compose this email.";
            break;
        default:
            string = @"An error occurred when trying to compose this email.";
            break;
    }
    
    if (string.length > 0) {
        UIAlertView *warningAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Failed to send SMS!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [warningAlert show];
    }
    [self dismissViewControllerAnimated:YES completion:NULL];
}

#pragma mark - MFMessageViewControllerDelegate -

- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result{
    NSString *string = @"";
    switch (result) {
        case MessageComposeResultCancelled:
            
            break;
            
        case MessageComposeResultFailed:
        {
            string = @"Failed to send SMS!";
            break;
        }
            
        case MessageComposeResultSent:
            string = @"Message sent successfully";
            break;
            
        default:
            break;
    }
    
    if (string.length > 0) {
        UIAlertView *warningAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Failed to send SMS!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [warningAlert show];
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UIActionSheetDelegate -

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
//    if (actionSheet.tag == 1) {
//        if (buttonIndex != actionSheet.cancelButtonIndex) {
//            NSString* title = [actionSheet buttonTitleAtIndex:buttonIndex];
//            
//            if ([title isEqualToString:@"Take Live Photo"]) {
//                
//                
//                [self showImagePickerWithType:UIImagePickerControllerSourceTypeCamera withCompletionBlock:self.handler];
//            }
//            else if ([title isEqualToString:@"Pick Photo From Library"]) {
//                [self showImagePickerWithType:UIImagePickerControllerSourceTypePhotoLibrary withCompletionBlock:self.handler];
//                ;
//            }
//        }
//    }
//    else if (actionSheet.tag == 2) {
//        if (buttonIndex != actionSheet.cancelButtonIndex) {
//            NSString* title = [actionSheet buttonTitleAtIndex:buttonIndex];
//            
//            if ([title isEqualToString:@"Take Live Video"]) {
//                [self showVideoPickerWithType:UIImagePickerControllerSourceTypeCamera withCompletionBlock:self.handler];
//            }
//            else if ([title isEqualToString:@"Pick Video From Library"]) {
//                [self showVideoPickerWithType:UIImagePickerControllerSourceTypePhotoLibrary withCompletionBlock:self.handler];
//                ;
//            }
//        }
//    }
}

- (void)showAlertLocationDisabled
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:NSLocalizedString( @"Location Service Disabled", @"" ) message:NSLocalizedString( @"To re-enable, please go to Settings and turn on Location Service for this app.", @"" ) preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"Cancel", @"" ) style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *settingsAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"Settings", @"" ) style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:
                                                    UIApplicationOpenSettingsURLString]];
    }];
    
    [alertController addAction:cancelAction];
    [alertController addAction:settingsAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
}

@end
