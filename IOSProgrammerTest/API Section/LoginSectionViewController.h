//
//  APISectionViewController.h
//  IOSProgrammerTest
//
//  Created by Justin LeClair on 12/15/14.
//  Copyright (c) 2014 AppPartner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginSectionViewController : UIViewController
{
    __weak IBOutlet UITextField *userNameTF;
    
    __weak IBOutlet UITextField *password;
}
- (IBAction)loginAction:(id)sender;

@end
