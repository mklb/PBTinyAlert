//
//  PBViewController.m
//  PBTinyAlert
//
//  Created by mklb on 10/08/2014.
//  Copyright (c) 2014 mklb. All rights reserved.
//

#import "PBViewController.h"

// import pod
#import <PBTinyAlert/PBTinyAlert.h>

@interface PBViewController ()

@end

@implementation PBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // show first alert
    dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, 2 * NSEC_PER_SEC);
    dispatch_after(time, dispatch_get_main_queue(), ^(void){
        
        PBTinyAlert *myAlert = [PBTinyAlert withTitle:@"Try again"
                                              Message:@"Super swift message"
                                      BackgroundColor:[UIColor colorWithRed:1 green:0.82 blue:0.22 alpha:1]
                                            TextColor:nil
                                               Effect:PBBounceEffect];
        [myAlert showAndHideIn:3.f];
        
    });
    
    
    
    // show second alert
    dispatch_time_t timeTwo = dispatch_time(DISPATCH_TIME_NOW, 6 * NSEC_PER_SEC);
    dispatch_after(timeTwo, dispatch_get_main_queue(), ^(void){
        
        PBTinyAlert *mySecondAlert = [PBTinyAlert withTitle:@"Try again"
                                                    Message:@"Super swift message"
                                            BackgroundColor:nil
                                                  TextColor:nil
                                                     Effect:PBFillEffect];
        [mySecondAlert showAndHideIn:3.f];
        
    });
    
    // show third alert
    dispatch_time_t timeThree = dispatch_time(DISPATCH_TIME_NOW, 10 * NSEC_PER_SEC);
    dispatch_after(timeThree, dispatch_get_main_queue(), ^(void){
        
        PBTinyAlert *mySecondAlert = [PBTinyAlert withTitle:@"Try again"
                                                    Message:nil
                                            BackgroundColor:[UIColor colorWithRed:1 green:0.82 blue:0.22 alpha:1]
                                                  TextColor:nil
                                                     Effect:PBBounceEffect];
        [mySecondAlert showAndHideIn:3.f];
        
    });
    
    // show fourth alert
    dispatch_time_t timeFour = dispatch_time(DISPATCH_TIME_NOW, 15 * NSEC_PER_SEC);
    dispatch_after(timeFour, dispatch_get_main_queue(), ^(void){
        
        PBTinyAlert *mySecondAlert = [PBTinyAlert withTitle:@"Try again"
                                                    Message:nil
                                            BackgroundColor:nil
                                                  TextColor:nil
                                                     Effect:PBFillEffect];
        [mySecondAlert showAndHideIn:3.f];
        
    });
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
