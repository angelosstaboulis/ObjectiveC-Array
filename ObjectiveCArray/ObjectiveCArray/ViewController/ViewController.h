//
//  ViewController.h
//  ObjectiveCArray
//
//  Created by Angelos Staboulis on 30/7/21.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UILabel *lblHeader;
@property (strong, nonatomic) IBOutlet UIButton *btnSortArray;
- (IBAction)btnSortArray:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *btnRefresh;
- (IBAction)btnRefresh:(id)sender;
-(void) refreshData;
-(UITableViewCell *) setupCell:(UITableView *) tableView indexPath:(NSIndexPath*) indexPath cellName:(NSString*) cellName;
@end

