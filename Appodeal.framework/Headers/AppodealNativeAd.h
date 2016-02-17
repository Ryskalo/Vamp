//
//  AppodealNativeAd.h
//  Appodeal
//
//  Created by Ivan Doroshenko on 8/24/15.
//  Copyright (c) 2015 Appodeal, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import <Appodeal/AppodealImage.h>

@class AppodealNativeAd;

@protocol AppodealNativeAdDelegate <NSObject>

@optional

- (void)nativeAdDidLoad:(AppodealNativeAd *)nativeAd;
- (void)nativeAd:(AppodealNativeAd *)nativeAd didFailedToLoadWithError:(NSError *)error;


@end

@interface AppodealNativeAd : NSObject

@property (weak, nonatomic) id<AppodealNativeAdDelegate> delegate;

@property (copy, nonatomic, readonly) NSString *title;
@property (copy, nonatomic, readonly) NSString *subtitle;
@property (copy, nonatomic, readonly) NSString *descriptionText;
@property (copy, nonatomic, readonly) NSString *callToActionText;
@property (copy, nonatomic, readonly) NSNumber *starRating;

@property (strong, nonatomic, readonly) AppodealImage *image;
@property (strong, nonatomic, readonly) AppodealImage *icon;

@property (assign, nonatomic, readonly, getter=isReady) BOOL ready;

- (void)attachToView:(UIView *)view viewController:(UIViewController *)viewController;
- (void)detachFromView;

- (void)loadAd;

@end
