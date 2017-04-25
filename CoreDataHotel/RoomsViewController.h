//
//  RoomsViewController.h
//  CoreDataHotel
//
//  Created by David Porter on 4/24/17.
//  Copyright © 2017 David Porter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Hotel+CoreDataClass.h"
#import "Hotel+CoreDataProperties.h"

@interface RoomsViewController : UIViewController

@property(strong,nonatomic) Hotel *selectedHotel;

@end
