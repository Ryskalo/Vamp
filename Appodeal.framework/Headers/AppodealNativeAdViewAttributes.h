//
//  AppodealNativeAdViewAttributes.h
//  Appodeal
//
//  Created by Учитель on 14.09.15.
//  Copyright (c) 2015 Appodeal, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface AppodealNativeAdViewAttributes : NSObject

@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat heigth;
@property (nonatomic) CGFloat iconWidth;
@property (nonatomic) CGFloat iconHeigtht;
@property (nonatomic) UIFont *titleFont;
@property (nonatomic) UIColor *titleFontColor;
@property (nonatomic) UIFont *descriptionFont;
@property (nonatomic) UIColor *descriptionFontColor;
@property (nonatomic) UIColor *subtitleColor;
@property (nonatomic) UIFont *subtitleFont;
@property (nonatomic) UIColor *buttonColor;
@property (nonatomic) UIFont *buttonTitleFont;
@property (nonatomic) BOOL roundedIcon;
@property (nonatomic) BOOL sponsored;
@property (nonatomic) UIColor *starRatingColor;

@end
