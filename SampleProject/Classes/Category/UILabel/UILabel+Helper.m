//
//  UILabel+Helper.m
//  SampleProject
//
//  Created by <#Project Developer#> on 1/12/16.
//  Copyright (c) 2015 <#Project Developer#>. All rights reserved.
//

#import "UILabel+Helper.h"

@implementation UILabel (Helper)
- (void)setSubstituteFontName:(NSString *)name UI_APPEARANCE_SELECTOR {
    UIFontDescriptor *fontDescriptor = self.font.fontDescriptor;
    UIFontDescriptorSymbolicTraits fontDescriptorSymbolicTraits = fontDescriptor.symbolicTraits;
    BOOL isBold = (fontDescriptorSymbolicTraits & UIFontDescriptorTraitBold) != 0;
    BOOL isItalics = (fontDescriptorSymbolicTraits & UIFontDescriptorTraitItalic) != 0;
    if (isBold) {
        self.font = [UIFont fontWithName:UIFONTAPPBOLD size:self.font.pointSize];
    }else if (isItalics) {
        self.font = [UIFont fontWithName:UIFONTAPPITALIC size:self.font.pointSize];
    }else{
        self.font = [UIFont fontWithName:name size:self.font.pointSize];
    }
}
@end
