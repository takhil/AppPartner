//
//  TableSectionTableViewCell.m
//  IOSProgrammerTest
//
//  Created by Justin LeClair on 12/15/14.
//  Copyright (c) 2014 AppPartner. All rights reserved.
//

#import "ChatCell.h"

@interface ChatCell ()
@property (nonatomic, strong) IBOutlet UILabel *usernameLabel;
//@property (nonatomic, strong) IBOutlet UILabel *messageLabel;
@property (nonatomic, strong) IBOutlet UIImageView *chtUsrIV;
@property (nonatomic, strong) IBOutlet UITextView *messageTextView;
@end

@implementation ChatCell

- (void)awakeFromNib
{
    // Initialization code
}

- (void)loadWithData:(ChatData *)chatData
{
    self.usernameLabel.text = chatData.username;
    //self.messageLabel.text = chatData.message;
    self.messageTextView.text = chatData.message;
    
    dispatch_queue_t q = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
    dispatch_async(q, ^{
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:chatData.avatar_url]];
        UIImage *img = [[UIImage alloc] initWithData:data];
        dispatch_async(dispatch_get_main_queue(), ^{
           
            self.chtUsrIV.image = img;
        });
    });
    
    self.chtUsrIV.layer.cornerRadius = self.chtUsrIV.frame.size.width / 2;
    self.chtUsrIV.clipsToBounds = YES;

  //  self.chtUsrIV.image = [UIImage imageNamed:chatData.avatar_url];
}
@end
