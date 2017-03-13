//
//  UIViewController+StoreKit.h
//  SampleProject
//
//  Created by <#Project Developer#> on 11/02/2016.
//  Copyright © 2016 <#Project Developer#>. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <StoreKit/StoreKit.h>

@protocol StoreKitDelegates <NSObject>

@optional

- (void)handleTransactionWithIdentifier:(NSString *)identifier;

@end



@interface UIViewController (StoreKit)<SKProductsRequestDelegate, SKPaymentTransactionObserver>

@property (nonatomic, strong) NSMutableArray *productDetail;
@property (nonatomic, strong) id<StoreKitDelegates> delegate;

- (void)addTransactionObserver;
- (void)removeTransactionObserver;
- (void)requestProductInfoForProductsIdentifiers:(NSArray *)Identifiers;
- (void)makeTransactionForProduct:(NSString *)productId;
- (void)handleLocalPaymentForTransaction:(SKPaymentTransaction *)transaction;

@end
