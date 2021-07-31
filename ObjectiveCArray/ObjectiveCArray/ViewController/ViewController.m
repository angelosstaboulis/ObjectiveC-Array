//
//  ViewController.m
//  ObjectiveCArray
//
//  Created by Angelos Staboulis on 30/7/21.
//
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
NSMutableArray *array;
NSArray *arraySort;
NSArray *arraySorted;
-(void) initializeValues{
    array = [[NSMutableArray alloc] init];
    srand(time(NULL));
    _tableView.delegate = self;
    _tableView.dataSource = self;
}
-(void) refreshData{
    if (array.count > 0) {
        [array removeAllObjects];
    }
    for(int item=0;item<5;item++){
        int number = (arc4random() % 1000)+1;
        NSString *stringNumber = [NSString stringWithFormat:@"%d",number];
        [array addObject:stringNumber];
    }
    NSSortDescriptor *descriptor = [[NSSortDescriptor alloc] initWithKey:@"intValue" ascending:TRUE];
    arraySort = [[NSArray alloc] initWithObjects:descriptor, nil];
    [array sortUsingDescriptors:arraySort];
}
- (UITableViewCell *) setupCell:(UITableView *) tableView indexPath:(NSIndexPath*) indexPath cellName:(NSString*) cellName{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    if (indexPath.row < array.count) {
        id row = [array objectAtIndex:indexPath.row];
        NSString *value = [NSString stringWithFormat:@"%@",row];
        [cell.textLabel setText:value];
    }
    return cell;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeValues];
    [self refreshData];
    
    // Do any additional setup after loading the view.
}
- (IBAction)btnManage:(id)sender {
    [self refreshData];
    [_tableView reloadData];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return array.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [self setupCell:tableView indexPath:indexPath cellName:@"cell"];
}

@end
