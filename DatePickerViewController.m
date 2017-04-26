//
//  DatePickerViewController.m
//  CoreDataHotel
//
//  Created by David Porter on 4/25/17.
//  Copyright © 2017 David Porter. All rights reserved.
//

#import "DatePickerViewController.h"
#import "AvailabilityViewController.h"
#import "BookViewController.h"

@interface DatePickerViewController ()

@property(strong, nonatomic) UIDatePicker *endDate;
@property(strong, nonatomic) UIDatePicker *startDate;

@end

@implementation DatePickerViewController

-(void)loadView {
    [super loadView];
    [self setupDatePickers];
    [self setupDoneButton];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
}

-(void)setupDatePickers {
    
    self.endDate = [[UIDatePicker alloc]init];
    self.endDate.datePickerMode = UIDatePickerModeDate;
    self.endDate.frame = CGRectMake(0, 84.0, self.view.frame.size.width, 200.0);
    
    
    [self.view addSubview:self.endDate];
}



-(void)setupDoneButton {
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneButtonPressed)];
    
    [self.navigationItem setRightBarButtonItem:doneButton];
    
}

-(void)doneButtonPressed {
    NSDate *startDate = self.startDate.date;
    NSDate *endDate = self.endDate.date;
    
    
    if ([[NSDate date] timeIntervalSinceReferenceDate] > [endDate timeIntervalSinceReferenceDate]) {
        //you can customize this in any way
        self.endDate.date = [NSDate date];
        return;
    }
    AvailabilityViewController *availabilityController = [[AvailabilityViewController alloc]init];
    availabilityController.endDate = endDate;
    availabilityController.startDate = [NSDate date];
    [self.navigationController pushViewController:availabilityController animated:YES];
    
    if ([[NSDate date] timeIntervalSinceReferenceDate] > [startDate timeIntervalSinceReferenceDate]) {
        self.startDate.date = [NSDate date];
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


@end
