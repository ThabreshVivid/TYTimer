//
//  ViewController.m
//  TYTimer
//
//  Created by Thabresh on 8/23/16.
//  Copyright © 2016 VividInfotech. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)viewWillAppear:(BOOL)animated
{
    NSDateFormatter *fromat = [[NSDateFormatter alloc]init];
    [fromat setDateFormat:@"dd-MM-yyyy hh:mm:ss a"];
    self.current.text = [fromat stringFromDate:[NSDate date]];
    self.future.text = [fromat stringFromDate:[[NSUserDefaults standardUserDefaults]valueForKey:@"chooseddate"]];
    [self performSelector:@selector(UpdateCurrentTime) withObject:nil afterDelay:0.1];
    if ([self dateComparision:[NSDate date] andDate2:[[NSUserDefaults standardUserDefaults]valueForKey:@"chooseddate"]]) {
    }
}
-(void) updateCountdown
{
    NSInteger ti = ((NSInteger)[[[NSUserDefaults standardUserDefaults]valueForKey:@"chooseddate"] timeIntervalSinceNow]);
    NSInteger seconds = ti % 60;
    NSInteger minutes = (ti / 60) % 60;
    NSInteger hours = (ti / 3600) % 24;
    NSInteger days = (ti / 86400);
    self.differ.text = [NSString stringWithFormat:@"%02li days %02li hrs %02li min %02li sec", (long)days, (long)hours, (long)minutes, (long)seconds];
    self.navigationItem.prompt = self.differ.text;
}
-(void)UpdateCurrentTime
{
    NSDateFormatter *fromat = [[NSDateFormatter alloc]init];
    [fromat setDateFormat:@"dd-MM-yyyy hh:mm:ss a"];
    self.current.text = [fromat stringFromDate:[NSDate date]];
    [self performSelector:@selector(UpdateCurrentTime) withObject:nil afterDelay:0.1];
    if ([self dateComparision:[NSDate date] andDate2:[[NSUserDefaults standardUserDefaults]valueForKey:@"chooseddate"]]) {
       [self performSelector:@selector(updateCountdown) withObject:nil afterDelay:0.1];
    }
}
-(BOOL)dateComparision:(NSDate*)date1 andDate2:(NSDate*)date2{
    BOOL isTokonValid;
    if ([date1 compare:date2] == NSOrderedAscending) {
        isTokonValid = YES;
    } else {
        isTokonValid = NO;
    }
    if (!isTokonValid) {
        [timer invalidate];
        self.differ.text = nil;
        self.future.text = nil;
        self.navigationItem.prompt = nil;
        [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"chooseddate"];
    }
    return isTokonValid;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
