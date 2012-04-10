//
//  RHAppDelegate.h
//  UIViewProperties
//
//  Created by Jimmy Theis on 4/9/12.
//  Copyright (c) 2012 Rose-Hulman Institute of Technology. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RHViewController;

@interface RHAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) RHViewController *viewController;

@end
