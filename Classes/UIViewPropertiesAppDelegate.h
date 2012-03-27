//
//  UIViewPropertiesAppDelegate.h
//  UIViewProperties
//
//  Created by David Fisher on 10/3/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class UIViewPropertiesViewController;

@interface UIViewPropertiesAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    UIViewPropertiesViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UIViewPropertiesViewController *viewController;

@end

