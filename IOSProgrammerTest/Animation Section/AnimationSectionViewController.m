//
//  AnimationSectionViewController.m
//  IOSProgrammerTest
//
//  Created by Justin LeClair on 12/15/14.
//  Copyright (c) 2014 AppPartner. All rights reserved.
//

#import "AnimationSectionViewController.h"
#import "MainMenuViewController.h"
#import <QuartzCore/QuartzCore.h>


@interface AnimationSectionViewController ()
{
     IBOutlet UIImageView *logoIV;
}


@end

@implementation AnimationSectionViewController
#define DEGREES_IN_RADIANS(x) (M_PI * x / 180.0);

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backAction:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
   // MainMenuViewController *mainMenuViewController = [[Mai;nMenuViewController alloc] init];
   // [self.navigationController pushViewController:mainMenuViewController animated:YES];
}
- (IBAction)spineLogo:(id)sender
{
    
//    if(!isSpin)
//    {
//        isSpin = true;
//    }
//    else{
//        isSpin = FALSE;
//    }
    
    
        CABasicAnimation* rotationAnimation;
        rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    rotationAnimation.toValue = @(2.0 * M_PI);
        rotationAnimation.duration = 1;
        rotationAnimation.cumulative = YES;
        rotationAnimation.repeatCount = 2;
        [rotationAnimation setRepeatCount:HUGE_VALF];

        [logoIV.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
        
        
    
    
    
    
}


- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint touchLocation = [touch locationInView:touch.view];
   logoIV.center = touchLocation;
    
    if ([touch.view isEqual: self.view] || touch.view == nil) {
        return;
    }
    
}

- (void)touchesMoved:(NSSet*)touches withEvent:(UIEvent*)event {
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint touchLocation = [touch locationInView:touch.view];
    
    if ([touch.view isEqual: self.view]) {
        
        logoIV.center = touchLocation;
        
        return;
    }
}

@end
