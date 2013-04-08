//
//  ViewController.m
//  VolumeCalibration
//
//  Created by alden on 4/7/13.
//  Copyright (c) 2013 Alden Keefe Sampson. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
  [super viewDidLoad];

  NSURL *soundURL;
  soundURL = [[NSBundle mainBundle] URLForResource:@"8000Hz"  withExtension:@"mp3"];
  AVAudioPlayer *pl8000  = [[AVAudioPlayer alloc] initWithContentsOfURL:soundURL error:nil];
  pl8000.numberOfLoops  = -1;
  soundURL = [[NSBundle mainBundle] URLForResource:@"10000Hz" withExtension:@"mp3"];
  AVAudioPlayer *pl10000 = [[AVAudioPlayer alloc] initWithContentsOfURL:soundURL error:nil];
  pl10000.numberOfLoops = -1;
  soundURL = [[NSBundle mainBundle] URLForResource:@"11200Hz" withExtension:@"mp3"];
  AVAudioPlayer *pl11200 = [[AVAudioPlayer alloc] initWithContentsOfURL:soundURL error:nil];
  pl11200.numberOfLoops = -1;
  soundURL = [[NSBundle mainBundle] URLForResource:@"16000Hz" withExtension:@"mp3"];
  AVAudioPlayer *pl16000 = [[AVAudioPlayer alloc] initWithContentsOfURL:soundURL error:nil];
  pl16000.numberOfLoops = -1;
  self.players = @[pl8000, pl10000, pl11200, pl16000];
  self.currentPlayer = pl8000;
  self.currentPlayer.volume = 0.5;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)playingSwitchValueChanged:(id)sender {
  if (self.playingSwitch.on) {
    [self.currentPlayer play];
  } else {
    [self.currentPlayer pause];
  }
}

- (IBAction)toneSelectorValueChanged:(id)sender {
  NSInteger selectedIndex = self.toneSelector.selectedSegmentIndex;
  [self.currentPlayer pause];
  if (selectedIndex >= 0) {
    AVAudioPlayer *newPlayer = self.players[selectedIndex];
    self.currentPlayer = newPlayer;
    newPlayer.volume = self.volumeSlider.value;
    if (self.playingSwitch.on)
      [newPlayer play];
  }
}

- (IBAction)volumeChanged:(id)sender {
  double volume = self.volumeSlider.value;
  NSString *volStr = [NSString stringWithFormat:@"%.4f", volume];
  self.currentPlayer.volume = volume;
  self.volumeDisplay.text = volStr;
}
@end
