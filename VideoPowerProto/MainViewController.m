//
//  MainViewController.m
//  video-low-power
//
//  Created by Brad Werth on 6/10/21.
//

#import "MainViewController.h"
#import "VideoHolder.h"
#import "VideoModel.h"

@interface MainViewController ()

@property (strong) IBOutlet VideoModel* videoModel;

@property (strong) IBOutlet NSPopUpButton* layerClassPopUp;
@property (strong) IBOutlet NSPopUpButton* bufferingPopUp;
@property (strong) IBOutlet NSButton* pixelBufferOpenGLCompatibilityButton;
@property (strong) IBOutlet NSButton* pixelBufferIOSurfaceCoreAnimationCompatibilityButton;

@property (strong) IBOutlet VideoHolder* videoHolder;

@end

@implementation MainViewController

- (void)viewDidLoad {
  [super viewDidLoad];

  // Listen to all the properties that might change in our model.
  [self.videoModel addObserver:self forKeyPath:@"layerClass" options:0 context:nil];
  [self.videoModel addObserver:self forKeyPath:@"buffering" options:0 context:nil];
  [self.videoModel addObserver:self forKeyPath:@"pixelBuffer" options:0 context:nil];
}

- (IBAction)selectLayerClass:(NSPopUpButton*)sender {
  self.videoModel.layerClass = sender.selectedTag;
}

- (IBAction)selectBuffering:(NSPopUpButton*)sender {
  self.videoModel.buffering = sender.selectedTag;
}

- (IBAction)clickPixelBufferButton:(NSButton*)sender {
  bool isOn = (sender.state == NSControlStateValueOn);
  PixelBuffer oldValue = [self videoModel].pixelBuffer;
  self.videoModel.pixelBuffer = (isOn ? (oldValue |= sender.tag) : (oldValue &= ~sender.tag));
}

-(void)observeValueForKeyPath:(NSString*)keyPath ofObject:(id)object change:(NSDictionary*)change context:(void*)context {
  // All changes to the model require a resetting videoHolder.
  [self.videoHolder resetWithModel:self.videoModel];
}


@end
