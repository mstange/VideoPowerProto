//
//  MainViewController.h
//  video-low-power
//
//  Created by Brad Werth on 6/10/21.
//

#import <Cocoa/Cocoa.h>

NS_ASSUME_NONNULL_BEGIN

@interface MainViewController : NSViewController
- (IBAction)selectLayerClass:(id)sender;
- (IBAction)selectBuffering:(id)sender;
- (IBAction)clickPixelBufferButton:(id)sender;
- (IBAction)clickFullscreenButton:(id)sender;

- (BOOL)wantsMoreFrames;
- (BOOL)handleDecodedFrame:(CMSampleBufferRef)buffer;
- (void)requestFrames;

- (void)windowWillEnterFullScreen:(NSNotification *)notification;
- (void)windowWillExitFullScreen:(NSNotification *)notification;
- (void)windowDidExitFullScreen:(NSNotification *)notification;
@end

NS_ASSUME_NONNULL_END
