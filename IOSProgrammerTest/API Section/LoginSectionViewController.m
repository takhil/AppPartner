//
//  APISectionViewController.m
//  IOSProgrammerTest
//
//  Created by Justin LeClair on 12/15/14.
//  Copyright (c) 2014 AppPartner. All rights reserved.
//

#import "LoginSectionViewController.h"
#import "MainMenuViewController.h"

@interface LoginSectionViewController ()

@end

@implementation LoginSectionViewController

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
    
   // MainMenuViewController *mainMenuViewController = [[MainMenuViewController alloc] init];
   // [self.navigationController pushViewController:mainMenuViewController animated:YES];
}

- (IBAction)loginAction:(id)sender
{
    
    
    NSURL *url = [NSURL URLWithString:@"http://dev.apppartner.com/AppPartnerProgrammerTest/scripts/login.php"];
    
    NSString *requestData = [NSString stringWithFormat:@"username=%@&password=%@",userNameTF.text,password.text];

    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    

    [request setHTTPMethod:@"POST"];

    
    [request setValue:[NSString stringWithFormat:@"%ld", (long)[requestData length]] forHTTPHeaderField:@"Content-Length"];
    
    
    
    NSError *error;
    
    NSURLResponse *response;
    
    
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    NSDictionary *jsonDict;
    
    
    
    if(error != Nil && responseData == Nil)
        
    {
        NSLog(@"error %@",error.description);
       
        
        
        
    }
    
    else
        
    {
        
        jsonDict = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableContainers error:Nil];
        
        
        NSLog(@"the jDict is %@",jsonDict);
        
        
        UIAlertController *alertController = [UIAlertController
                                              alertControllerWithTitle:@""
                                              message: [NSString stringWithFormat:@"%@ %@",[jsonDict valueForKey:@"message"],[jsonDict valueForKey:@"code"]]
                                              preferredStyle:UIAlertControllerStyleAlert];
        
        
        
        UIAlertAction *okAction = [UIAlertAction
                                   actionWithTitle:@"OK"
                                   style:UIAlertActionStyleDefault
                                   handler:^(UIAlertAction *action)
                                   {
                                       [self.navigationController popViewControllerAnimated:YES];
                                   }];
        
        [alertController addAction:okAction];
        
        
        [self presentViewController:alertController animated:YES completion:Nil];
        
        
    }
    
    
}
@end
