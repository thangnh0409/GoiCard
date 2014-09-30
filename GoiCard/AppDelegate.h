//
//  AppDelegate.h
//  GoiCard
//
//  Created by thangnh on 9/27/14.
//  Copyright (c) 2014 thangnh. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainMenuViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) MainMenuViewController *viewController;

@property (strong, nonatomic) UINavigationController *navigation;

@end
