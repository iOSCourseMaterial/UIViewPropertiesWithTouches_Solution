//
//  UIViewPropertiesViewController.h
//  UIViewProperties
//
//  Created by David Fisher on 10/3/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewPropertiesViewController : UIViewController {
	UIView * myView;
	UILabel * centerLabel;
	UILabel * boundsSizeLabel;
	UILabel * frameLabel;
	UILabel * angleLabel;
	UILabel * scaleLabel;

	CGPoint initialCenter;
	CGRect initialBounds;
	
	CGFloat angle;
	CGFloat scale;
	
}
@property (nonatomic, retain) IBOutlet UIView * myView;
@property (nonatomic, retain) IBOutlet UILabel * centerLabel;
@property (nonatomic, retain) IBOutlet UILabel * boundsSizeLabel;
@property (nonatomic, retain) IBOutlet UILabel * frameLabel;
@property (nonatomic, retain) IBOutlet UILabel * angleLabel;
@property (nonatomic, retain) IBOutlet UILabel * scaleLabel;

- (IBAction) pressedCenter;
- (IBAction) pressedBounds;
- (IBAction) pressedResetCenterAndBounds;

- (IBAction) pressedRotate;
- (IBAction) pressedScale;
- (IBAction) pressedTranslate;
- (IBAction) pressedResetTransform;

@end

