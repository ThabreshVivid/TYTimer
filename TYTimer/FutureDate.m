//
//  FutureDate.m
//  TYTimer
//
//  Created by Thabresh on 8/23/16.
//  Copyright © 2016 VividInfotech. All rights reserved.
//

#import "FutureDate.h"

@implementation FutureDate
-(void)viewDidLoad
{
    NSDate* newDate = [[NSDate date] dateByAddingTimeInterval:60.0*5];
    [self.datePick setMinimumDate:newDate];   
}
- (IBAction)clickToAdd:(id)sender {
    [[NSUserDefaults standardUserDefaults]setObject:self.datePick.date forKey:@"chooseddate"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    [self.navigationController popViewControllerAnimated:YES];
}
@end
