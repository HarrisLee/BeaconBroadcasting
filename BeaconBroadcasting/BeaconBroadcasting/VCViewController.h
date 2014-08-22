//
//  VCViewController.h
//  BeaconBroadcasting
//
//  Created by qihaijun on 8/22/14.
//  Copyright (c) 2014 VictorChee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VCViewController : UIViewController
{
    __weak IBOutlet UILabel *statusLabel;
}
- (IBAction)broadcast:(UIButton *)sender;
@end
