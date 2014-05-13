//
//  KPViewController.m
//  CameraButtonClone
//
//  Created by Eric Mika on 3/27/14.
//  Copyright (c) 2014 Kitschpatrol. All rights reserved.
//

#import "KPViewController.h"
#import "KPCameraButton.h"

@interface KPViewController ()

@property (weak, nonatomic) IBOutlet KPCameraButton *cameraButton;
@property (weak, nonatomic) IBOutlet UISegmentedControl *cameraButtonModeControl;

@end

@implementation KPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)didChangeCameraButtonMode:(id)sender {
    switch (self.cameraButtonModeControl.selectedSegmentIndex) {
        case 0:
            self.cameraButton.cameraButtonMode = KPCameraButtonModePhoto;
            break;
        case 1:
            self.cameraButton.cameraButtonMode = KPCameraButtonModeVideoReady;
            break;
        case 2:
            self.cameraButton.cameraButtonMode = KPCameraButtonModeVideoRecording;
            break;
        default:
            // Unknown mode
            break;
    }
}

- (IBAction)didTouchCameraButton:(id)sender {
    switch (self.cameraButton.cameraButtonMode) {
        case KPCameraButtonModePhoto:
            NSLog(@"Take Photo!");
            // But really, do nothing
            break;
        case KPCameraButtonModeVideoReady:
            NSLog(@"Start Recording!");
            self.cameraButton.cameraButtonMode = KPCameraButtonModeVideoRecording;
            self.cameraButtonModeControl.selectedSegmentIndex = 2;
            break;
        case KPCameraButtonModeVideoRecording:
            NSLog(@"Stop Recording!");
            self.cameraButton.cameraButtonMode = KPCameraButtonModeVideoReady;
            self.cameraButtonModeControl.selectedSegmentIndex = 1;
            break;
        default:
            // Unknown mode
            break;
    }
}

@end
