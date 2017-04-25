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

@interface HotelsViewController () <UITableViewDelegate, UITableViewDataSource>

@property(strong, nonatomic) NSArray *allHotels;

@property(strong, nonatomic) UITableView *tableView;

@end

@implementation HotelsViewController


-(void)loadView {
    [super loadView];
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, 300) style:UITableViewStylePlain];
    //add tableViewas subview and apply contraints
    //finish this table view to show hotels
    //get the button to push to Rooms View Controller
}

-(void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.topViewController.title = @"Hotels";
    self.tableView.dataSource = self;
    
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

@end
