//
//  UIViewPropertiesViewController.m
//  UIViewProperties
//
//  Created by David Fisher on 10/3/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "UIViewPropertiesViewController.h"
#import <AudioToolbox/AudioToolbox.h>

@implementation UIViewPropertiesViewController
@synthesize myView;
@synthesize centerLabel;
@synthesize boundsSizeLabel;
@synthesize frameLabel;
@synthesize angleLabel;
@synthesize scaleLabel;

- (void) _updateLabels
{
	self.centerLabel.text = [NSString stringWithFormat:@"(%.1f, %.1f)", self.myView.center.x, [[self myView] center].y];
	self.boundsSizeLabel.text = [NSString stringWithFormat:@"(%.1f, %.1f)", self.myView.bounds.size.width, [[self myView] bounds].size.height];
	self.frameLabel.text = [NSString stringWithFormat:@"(%.1f, %.1f) (%.1f, %.1f)", 
							self.myView.frame.origin.x, [[self myView] frame].origin.y,
							self.myView.frame.size.width, [[self myView] frame].size.height];
	self.angleLabel.text = [NSString stringWithFormat:@"%.1f degrees", angle];
	self.scaleLabel.text = [NSString stringWithFormat:@"%.3f", scale];
}


- (IBAction) pressedCenter
{
	NSLog(@"%s", __FUNCTION__);
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:3.0];
	[UIView setAnimationBeginsFromCurrentState:YES];
	CGPoint newCenter = self.myView.center;
	newCenter.x += 30;
	newCenter.y += 50;
	self.myView.center = newCenter;
	[UIView commitAnimations];
	[self _updateLabels];
}
- (IBAction) pressedBounds
{
	NSLog(@"%s", __FUNCTION__);
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:3.0];
	[UIView setAnimationBeginsFromCurrentState:YES];
	CGRect newBounds = self.myView.bounds;
	newBounds.size.width += 30;
	newBounds.size.height += 50;
	self.myView.bounds = newBounds;
	//[[self myView] setBounds:newBounds];
	[UIView commitAnimations];
	[self _updateLabels];
}
- (IBAction) pressedResetCenterAndBounds
{
	NSLog(@"%s", __FUNCTION__);
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:3.0];
	[UIView setAnimationBeginsFromCurrentState:YES];
	//self.myView.center = CGPointMake(200.0f, 300.0f);
	//self.myView.bounds = CGRectMake(0, 0, 100, 100);
	self.myView.center = initialCenter;
	self.myView.bounds = initialBounds;
	[UIView commitAnimations];
	[self _updateLabels];
}
- (IBAction) pressedRotate
{
	NSLog(@"%s", __FUNCTION__);
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:3.0];
	[UIView setAnimationBeginsFromCurrentState:YES];
	
	angle += 20;  // In degrees
	//self.myView.transform = CGAffineTransformMakeRotation(angle/180.0 * M_PI);
	self.myView.transform = CGAffineTransformRotate(self.myView.transform, 20.0f/180.0f * M_PI);
	[UIView commitAnimations];
	[self _updateLabels];
}
- (IBAction) pressedScale
{
	NSLog(@"%s", __FUNCTION__);
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:3.0];
	[UIView setAnimationBeginsFromCurrentState:YES];
	
	scale *= 1.1;  // 10% larger
	//self.myView.transform = CGAffineTransformMakeScale(scale, scale);
	self.myView.transform = CGAffineTransformScale(self.myView.transform, 1.1, 1.1);
	
	
	[UIView commitAnimations];
	[self _updateLabels];
}
- (IBAction) pressedTranslate
{
	NSLog(@"%s", __FUNCTION__);
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:3.0];
	[UIView setAnimationBeginsFromCurrentState:YES];
	
	self.myView.transform = CGAffineTransformTranslate(self.myView.transform, 50, 0);
	
	[UIView commitAnimations];
	[self _updateLabels];
}

- (void) resetTransformAnimationDidStop:(NSString *)animationID 
							   finished:(NSNumber *)finished context:(void *)context
{
	NSLog(@"Reset Animation did finish.  Play sound");
	
	
	// Create a soundID
	// Create a path to your sound resource
	// Connect the sound resource to your pointer
	// Play the sound at the soundID pointer
	
	SystemSoundID soundID;
    NSString *path = [[NSBundle mainBundle] pathForResource:
					  @"32304__acclivity__ShipsBell" ofType:@"wav"];
    AudioServicesCreateSystemSoundID((CFURLRef)[NSURL fileURLWithPath:path], &soundID);
    AudioServicesPlaySystemSound (soundID);
	
}

- (IBAction) pressedResetTransform
{
	NSLog(@"%s", __FUNCTION__);
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:3.0];
	[UIView setAnimationBeginsFromCurrentState:YES];
	[UIView setAnimationDelegate:self];
	[UIView setAnimationDidStopSelector:
			@selector(resetTransformAnimationDidStop:finished:context:)];
	
	angle = 0;
	scale = 1.0;
	self.myView.transform = CGAffineTransformIdentity;
	
	[UIView commitAnimations];
	[self _updateLabels];
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	scale = 1.0;	
	
	[self.myView removeFromSuperview];
	
	UIImageView * newImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"r.jpg"]];
	[self.view addSubview:newImageView];
	
	self.myView = newImageView;
	[newImageView release];
	
	self.myView.center = CGPointMake(200, 300);
	self.myView.contentMode = UIViewContentModeScaleAspectFit;
	self.myView.backgroundColor = [UIColor blueColor];
	
//	UIViewContentModeScaleToFill,
//	UIViewContentModeScaleAspectFit,
//	UIViewContentModeScaleAspectFill,
//	UIViewContentModeRedraw,
//	UIViewContentModeCenter,
//	UIViewContentModeTop,
//	UIViewContentModeBottom,
//	UIViewContentModeLeft,
//	UIViewContentModeRight,
//	UIViewContentModeTopLeft,
//	UIViewContentModeTopRight,
//	UIViewContentModeBottomLeft,
//	UIViewContentModeBottomRight,
	
	initialCenter = self.myView.center;
	initialBounds = self.myView.bounds;
	[self _updateLabels];
}



// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
	self.myView  = nil;
	self.centerLabel  = nil;
	self.boundsSizeLabel  = nil;
	self.frameLabel  = nil;
	self.angleLabel  = nil;
	self.scaleLabel  = nil;
}


- (void)dealloc {
	[myView release];
	[centerLabel release];
	[boundsSizeLabel release];
	[frameLabel release];
	[angleLabel release];
	[scaleLabel release];
	
    [super dealloc];
}

#pragma mark -
#pragma mark Touches

- (void) _handleTouch:(UITouch *) aTouch
{
	CGFloat dividingLine = self.view.bounds.size.height / 2.0;
	CGPoint touchLocation = [aTouch locationInView:self.view];
	
	if (touchLocation.y > dividingLine) {
		// Snap to location
		if (touchLocation.x < self.view.bounds.size.width / 2.0) {
			self.myView.center = CGPointMake(self.view.bounds.size.width / 4.0, dividingLine);
			if (aTouch.phase == UITouchPhaseEnded) {
				[UIView beginAnimations:nil context:nil];
				self.myView.center = CGPointMake(self.view.bounds.size.width / 4.0, self.view.bounds.size.height-100);
				[UIView commitAnimations];
			}
		} else {
			self.myView.center = CGPointMake(self.view.bounds.size.width * 3.0 / 4.0, dividingLine);
			if (aTouch.phase == UITouchPhaseEnded) {
				[UIView beginAnimations:nil context:nil];
				self.myView.center = CGPointMake(self.view.bounds.size.width * 3.0 / 4.0,  self.view.bounds.size.height-100);
				[UIView commitAnimations];
			}
		}
	} else {
		self.myView.center = touchLocation;
	}
}
- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
	UITouch * anyTouch = [touches anyObject];
	[self _handleTouch:anyTouch];
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
	[self _handleTouch:[touches anyObject]];
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
	[self _handleTouch:[touches anyObject]];
}
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
	[self _handleTouch:[touches anyObject]];
}

@end
