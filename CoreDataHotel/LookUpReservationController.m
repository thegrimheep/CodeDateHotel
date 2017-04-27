//
//  LookUpReservationController.m
//  CoreDataHotel
//
//  Created by David Porter on 4/27/17.
//  Copyright © 2017 David Porter. All rights reserved.
//

#import "AutoLayout.h"
#import "AppDelegate.h"
#import "Room+CoreDataClass.h"
#import "Room+CoreDataProperties.h"
#import "Hotel+CoreDataClass.h"
#import "Hotel+CoreDataProperties.h"
#import "Guest+CoreDataClass.h"
#import "Guest+CoreDataProperties.h"
#import "Reservation+CoreDataClass.h"
#import "Reservation+CoreDataProperties.h"
#import "LookUpReservationController.h"

@interface LookUpReservationController () <UITableViewDelegate, UITableViewDataSource>

@property(strong, nonatomic) UITableView *tableView;
@property(strong, nonatomic) NSFetchedResultsController *reservedRooms;

@end

@implementation LookUpReservationController

- (void)loadView {
    [super loadView];
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:self.tableView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

//-(NSFetchedResultsController *)reservedRooms {
//    
//    if (!_reservedRooms) {
//    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
//    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Reservation"];
//        
//    }
//}


@end
