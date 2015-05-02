#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>


//@interface RootViewController : UITableViewController <NSFetchedResultsControllerDelegate>
//{
//	NSFetchedResultsController *fetchedResultsController;
//}
//
//- (IBAction)settings:(id)sender;


@interface RootViewController : UITableViewController <NSFetchedResultsControllerDelegate>

{
    
    NSFetchedResultsController *fetchedResultsController;
    
    UITextField *messageField;
    
}

- (IBAction)settings:(id)sender;
- (IBAction)message:(id)sender;


@end
