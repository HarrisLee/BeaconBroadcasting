//
//  VCViewController.m
//  BeaconBroadcasting
//
//  Created by qihaijun on 8/22/14.
//  Copyright (c) 2014 VictorChee. All rights reserved.
//

#import "VCViewController.h"
@import CoreLocation;
@import CoreBluetooth;

@interface VCViewController () < CBPeripheralManagerDelegate>
{
    CLBeaconRegion *beaconRegion;
    NSDictionary *beaconData;
    CBPeripheralManager *peripheralManager;
}
@end

@implementation VCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSUUID *uuid = [[NSUUID alloc] initWithUUIDString:@"960F64B2-E92B-46B6-91F3-0E1156E0689A"];
    
    beaconRegion = [[CLBeaconRegion alloc] initWithProximityUUID:uuid
                                                           major:1
                                                           minor:1
                                                      identifier:@"com.victorchee.beacon"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)broadcast:(UIButton *)sender {
    beaconData = [beaconRegion peripheralDataWithMeasuredPower:nil];
    peripheralManager = [[CBPeripheralManager alloc] initWithDelegate:self
                                                                queue:nil
                                                              options:nil];
}

#pragma mark - CBPeripheralManagerDelegate
- (void)peripheralManagerDidUpdateState:(CBPeripheralManager *)peripheral
{
    if (peripheral.state == CBPeripheralManagerStatePoweredOn) {
        // Bluetooth is on
        statusLabel.text = @"Broadcasting...";
        
        // Start boardcasting
        [peripheralManager startAdvertising:beaconData];
    } else if (peripheralManager.state == CBPeripheralManagerStatePoweredOff) {
        // Bluetooth is off
        statusLabel.text = @"Stopped";
    }
}
@end
