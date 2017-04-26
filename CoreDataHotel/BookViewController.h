//
//  BookViewController.h
//  CoreDataHotel
//
//  Created by David Porter on 4/26/17.
//  Copyright © 2017 David Porter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Room+CoreDataClass.h"
#import "Room+CoreDataProperties.h"

@interface BookViewController : UIViewController

@property(strong, nonatomic) NSDate *startDate;
@property(strong, nonatomic) NSDate *endDate;
@property(strong, nonatomic) Room *selectedRoom;


@end
