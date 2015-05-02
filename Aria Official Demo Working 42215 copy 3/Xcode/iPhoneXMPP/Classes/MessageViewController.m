//
//  MessageViewController.m
//  iPhoneXMPP
//
//  Created by Justin Murphy on 4/22/15.
//  Copyright (c) 2015 XMPPFramework. All rights reserved.
//

#import "MessageViewController.h"
#import "iPhoneXMPPAppDelegate.h"
#import "NextMessageViewController.h"

#import "XMPPFramework.h"
#import "DDLog.h"

@interface MessageViewController ()

@end

@implementation MessageViewController

- (iPhoneXMPPAppDelegate *)appDelegate
{
    return (iPhoneXMPPAppDelegate *)[[UIApplication sharedApplication] delegate];
}
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark Init/dealloc methods
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

- (void)awakeFromNib {
    self.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark View lifecycle
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    iPhoneXMPPAppDelegate *delegate = [self appDelegate];
    
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 400, 44)];
    nameLabel.backgroundColor = [UIColor clearColor];
    nameLabel.textColor = [UIColor darkTextColor];
    nameLabel.font = [UIFont boldSystemFontOfSize:18.0];
    nameLabel.numberOfLines = 1;
    nameLabel.adjustsFontSizeToFitWidth = YES;
    nameLabel.textAlignment = NSTextAlignmentCenter;
    
    [delegate connect];

    nameLabel.text = delegate.currentUser.displayName;

    
    [nameLabel sizeToFit];
    
    self.navigationItem.titleView = nameLabel;
    
    [[self appDelegate] connect];
    
    _responseView.text = @"";
    _messageView.text = @"";

}


////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#pragma mark Actions
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

- (IBAction)back:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}
- (IBAction)NextMessage:(id)sender {
//    iPhoneXMPPAppDelegate *delegate = [self appDelegate];
//    delegate.currentUser = [[self fetchedResultsController] objectAtIndexPath:indexPath];
    
       [self.navigationController presentViewController:[[self appDelegate] nextMessageViewController] animated:YES completion:NULL];
    
    NSLog(@"My special value is");
}

- (IBAction)hideKeyboard:(id)sender {
    [sender resignFirstResponder];
    [self back:sender];
}

- (IBAction)sendMessage:(id)sender {
    iPhoneXMPPAppDelegate *delegate = [self appDelegate];
    _messageView.text = _messageField.text;
    
    [delegate sendMessage:_messageField.text];
}

@end
