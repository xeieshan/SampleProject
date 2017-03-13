//
//  UIViewController+StoreKit.m
//  SampleProject
//
//  Created by <#Project Developer#> on 11/02/2016.
//  Copyright © 2016 <#Project Developer#>. All rights reserved.
//

#import "UIViewController+StoreKit.h"

@implementation UIViewController (StoreKit)

@dynamic productDetail;
@dynamic delegate;

- (void)addTransactionObserver{
    self.productDetail = [[NSMutableArray alloc] init];
    [[SKPaymentQueue defaultQueue] removeTransactionObserver:self];
}

- (void)removeTransactionObserver{
    [[SKPaymentQueue defaultQueue] removeTransactionObserver:self];
}

- (void)requestProductInfoForProductsIdentifiers:(NSArray *)Identifiers{
    if ([SKPaymentQueue canMakePayments]) {
        NSSet * productIdentifiers = [NSSet setWithArray:Identifiers];
        SKProductsRequest *productRequest = [[SKProductsRequest alloc] initWithProductIdentifiers:productIdentifiers];
        
        productRequest.delegate = self;
        [productRequest start];
    }
    else {
        NSLog(@"Cannot perform In App Purchases.");
    }
}

- (void)makeTransactionForProduct:(NSString *)productId{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"productIdentifier == %@", productId];
    NSArray *array = [self.productDetail filteredArrayUsingPredicate:predicate];
    
    if (array.count > 0) {
        SKPayment *payment = [SKPayment paymentWithProduct:array.firstObject];
        [[SKPaymentQueue defaultQueue] addPayment:payment];
    }
}

- (void)handleLocalPaymentForTransaction:(SKPaymentTransaction *)transaction{
    if (transaction.transactionState == SKPaymentTransactionStatePurchased) {
        NSString *identifier = transaction.payment.productIdentifier;
        if (self.delegate && [self.delegate respondsToSelector:@selector(handleTransactionWithIdentifier:)]) {
            [self.delegate handleTransactionWithIdentifier:identifier];
        }
    }
}

#pragma mark- SKProductDelegate -

- (void)productsRequest:(SKProductsRequest *)request didReceiveResponse:(SKProductsResponse *)response{
    if (response.products.count != 0) {
        for (SKProduct *product in response.products) {
            [self.productDetail addObject:product];
        }
    }
    else {
        NSLog(@"There are no products.");
    }
    
    if (response.invalidProductIdentifiers.count != 0) {
        NSLog(@"%@", response.invalidProductIdentifiers.description);
    }
    
}

- (void)paymentQueue:(SKPaymentQueue *)queue updatedTransactions:(NSArray<SKPaymentTransaction *> *)transactions
{
    for (SKPaymentTransaction *transaction in transactions) {
        switch (transaction.transactionState) {
            case SKPaymentTransactionStatePurchased:
            {
                NSLog(@"Transaction completed successfully.");
                [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
                [self handleLocalPaymentForTransaction:transaction];
            }                
                
            case SKPaymentTransactionStateFailed:
            {
                NSLog(@"Transaction Failed");
                [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
            }
                
            default:
                NSLog(@"%ld", (long)transaction.transactionState);
        }
    }
}


@end
