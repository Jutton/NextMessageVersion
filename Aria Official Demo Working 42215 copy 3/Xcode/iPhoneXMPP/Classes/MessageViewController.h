//
//  MessageViewController.h
//  iPhoneXMPP
//
//  Created by Justin Murphy on 4/22/15.
//  Copyright (c) 2015 XMPPFramework. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MessageViewController : UIViewController
{
    UITextField *messageField;
    UITextView *messageView;
    UITextView *responseView;
}
@property (nonatomic,strong) IBOutlet UITextField *messageField;
@property (nonatomic,strong) IBOutlet UITextView *messageView;
@property (nonatomic,strong) IBOutlet UITextView *responseView;
@property (nonatomic,strong) IBOutlet UILabel *nameLabel;


- (IBAction)back:(id)sender;
- (IBAction)hideKeyboard:(id)sender;
- (IBAction)sendMessage:(id)sender;

@end
