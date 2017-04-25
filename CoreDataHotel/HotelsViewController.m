//
//  HotelsViewController.m
//  CoreDataHotel
//
//  Created by David Porter on 4/24/17.
//  Copyright © 2017 David Porter. All rights reserved.
//

#import "HotelsViewController.h"
#import "AppDelegate.h"
#import "Hotel+CoreDataClass.h"
#import "Hotel+CoreDataProperties.h"
#import "RoomsViewController.h"

@interface HotelsViewController () <UITableViewDelegate, UITableViewDataSource>

@property(strong, nonatomic) NSArray *allHotels;

@property(strong, nonatomic) UITableView *tableView;
@property(strong, nonatomic) Hotel *selectedHotel;

@end

@implementation HotelsViewController {
    NSArray *_allHotels;
}


-(void)loadView {
    [super loadView];
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
        [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self.view addSubview:self.tableView];
    //add tableViewas subview and apply contraints
    //finish this table view to show hotels
    //get the button to push to Rooms View Controller
}

-(void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.topViewController.title = @"Hotels";
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
}

-(NSArray *)allHotels {
    if (!_allHotels) {
        AppDelegate *appdelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
        
        NSManagedObjectContext *context = appdelegate.persistentContainer.viewContext;
        
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Hotel"];
        
        NSError *fetchError;
        NSArray *hotels = [context executeFetchRequest:request error:&fetchError];
        
        if (fetchError) {
            NSLog(@"There was an error fetching hotels from Core Data!");
        }
        _allHotels = hotels;
    }
    return _allHotels;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    RoomsViewController *roomsViewController = [[RoomsViewController alloc]init];
//    roomsViewController.selectedHotel *self.allHotels[indexPath.row];
    [self.navigationController pushViewController:roomsViewController animated:YES];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    Hotel *hotel = self.allHotels[indexPath.row];
    cell.textLabel.text = hotel.name;
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.allHotels count];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"Rooms"]) {
        [self.tableView reloadData];
    }
}
@end
