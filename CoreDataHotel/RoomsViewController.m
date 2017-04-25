//
//  RoomsViewController.m
//  CoreDataHotel
//
//  Created by David Porter on 4/24/17.
//  Copyright © 2017 David Porter. All rights reserved.
//

#import "RoomsViewController.h"
#import "Room+CoreDataClass.h"
#import "Room+CoreDataProperties.h"

@interface RoomsViewController () <UITableViewDataSource>

@property(strong, nonatomic) NSArray *allHotelRooms;
@property(strong, nonatomic) UITableView *tableView;

@end

@implementation RoomsViewController

-(void)viewDidLoad {
    self.navigationController.topViewController.title = @"Rooms";
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:self.tableView];
}

-(void)loadView {
    [super loadView];
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, 300) style:UITableViewStylePlain];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.allHotelRooms.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    NSString *number = [[NSString alloc] initWithFormat:@"Room Number: %hd\n", [self.allHotelRooms[indexPath.row] number]];
    NSString *beds = [[NSString alloc]initWithFormat:@"Number of Beds: %hd\n", [self.allHotelRooms[indexPath.row] beds]];
    NSString *rate = [[NSString alloc] initWithFormat:@"Room rate: $%.02f\n", [self.allHotelRooms[indexPath.row] rate]];
    
    cell.textLabel.text = (@"%@", number);
    
    return cell;
}

//-(void)setAllHotelRooms:(NSArray *)rooms {
//    _allHotelRooms = rooms;
//}
//
//-(NSArray *)allHotelRooms {
//    return _allHotelRooms;
//}

@end
