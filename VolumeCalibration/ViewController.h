//
//  ViewController.h
//  VolumeCalibration
//
//  Created by alden on 4/7/13.
//  Copyright (c) 2013 Alden Keefe Sampson. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVAudioPlayer.h>
#import <MediaPlayer/MediaPlayer.h>

// toneFiles = @[@"8000Hz", @"9000Hz", @"10000Hz", @"11200Hz", @"12500Hz", @"14000Hz", @"16000Hz"];
@interface ViewController : UIViewController

@property NSArray *players;
@property AVAudioPlayer *currentPlayer;

@property (weak, nonatomic) IBOutlet UISwitch *playingSwitch;
@property (weak, nonatomic) IBOutlet UISegmentedControl *toneSelector;
@property (weak, nonatomic) IBOutlet UITextField *volumeDisplay;
@property (weak, nonatomic) IBOutlet UISlider *volumeSlider;

- (IBAction)playingSwitchValueChanged:(id)sender;
- (IBAction)toneSelectorValueChanged:(id)sender;
- (IBAction)volumeChanged:(id)sender;
@end
