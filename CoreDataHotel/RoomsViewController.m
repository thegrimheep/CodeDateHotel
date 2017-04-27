//
//  RoomsViewController.m
//  CoreDataHotel
//
//  Created by David Porter on 4/24/17.
//  Copyright © 2017 David Porter. All rights reserved.
//

#import "RoomsViewController.h"
#import "HotelsViewController.h"
#import "Room+CoreDataClass.h"
#import "Room+CoreDataProperties.h"
#import "Hotel+CoreDataClass.h"
#import "Hotel+CoreDataProperties.h"
#import "AppDelegate.h"

@interface RoomsViewController () <UITableViewDataSource, UITableViewDelegate>

@property(strong, nonatomic) NSArray *allHotelRooms;
@property(strong, nonatomic) UITableView *tableView;

@end

@implementation RoomsViewController

-(void)viewDidLoad {
    self.navigationController.topViewController.title = @"Rooms";
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:self.tableView];
    self.allHotelRooms = [[self.selectedHotel rooms] allObjects];
}

-(void)loadView {
    [super loadView];
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    Room *room = [self.allHotelRooms objectAtIndex:indexPath.row];
    cell.textLabel.text = [[NSNumber numberWithUnsignedInteger:room.number]stringValue];
    
    NSString *number = [[NSString alloc] initWithFormat:@"Room Number: %hd\n", [self.allHotelRooms[indexPath.row] number]];
    NSString *beds = [[NSString alloc]initWithFormat:@"Number of Beds: %hd\n", [self.allHotelRooms[indexPath.row] beds]];
    NSString *rate = [[NSString alloc] initWithFormat:@"Room rate: $%.02f\n", [self.allHotelRooms[indexPath.row] rate]];
    
//    Room *room = self.allHotelRooms[indexPath.row];
//    cell.textLabel.text = [NSString stringWithFormat:@"%@", room.number];
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.allHotelRooms.count;
}


@end
