//
//  ViewController.h
//  TYTimer
//
//  Created by Thabresh on 8/23/16.
//  Copyright © 2016 VividInfotech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    NSTimer *timer;
}
@property (weak, nonatomic) IBOutlet UILabel *current;
@property (weak, nonatomic) IBOutlet UILabel *future;
@property (weak, nonatomic) IBOutlet UILabel *differ;


@end

