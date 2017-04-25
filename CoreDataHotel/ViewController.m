//
//  ViewController.m
//  CoreDataHotel
//
//  Created by David Porter on 4/24/17.
//  Copyright © 2017 David Porter. All rights reserved.
//

#import "ViewController.h"
#import "AutoLayout.h"
#import "HotelsViewController.h"
#import "DatePickerViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(void)loadView {
    [super loadView];
    self.view.backgroundColor = [UIColor grayColor];
    
    [self setupLayout];
}

-(void)setupLayout {
    
    CGFloat topLayoutHeight = CGRectGetHeight(self.navigationController.navigationBar.frame) +20;
    CGFloat buttonHeight = (self.view.bounds.size.height - topLayoutHeight) / 3;
    
    UIButton *browseButton = [self createButtonWithTitle:@"Browse"];
    UIButton *bookButton = [self createButtonWithTitle:@"Book"];
    UIButton *lookupButton = [self createButtonWithTitle:@"Look Up"];
    
    browseButton.backgroundColor = [UIColor redColor];
    bookButton.backgroundColor = [UIColor colorWithRed:0.75 green:0.25 blue:1.0 alpha:1.0];
    lookupButton.backgroundColor = [UIColor colorWithRed:1.5 green:3.25 blue:1.0 alpha:1.0];
    
    [AutoLayout leadingConstaintFrom:browseButton toView:self.view];
    [AutoLayout trailingConstaintFrom:browseButton toView:self.view];
    [AutoLayout height:buttonHeight forView:browseButton];
    [AutoLayout topOffset:topLayoutHeight fromView:browseButton toView:self.view];
    
    
    [AutoLayout leadingConstaintFrom:bookButton toView:self.view];
    [AutoLayout trailingConstaintFrom:bookButton toView:self.view];
    [AutoLayout height:buttonHeight forView:bookButton];
    [AutoLayout topOffset:topLayoutHeight + buttonHeight fromView:bookButton toView:self.view];
    
    
    [AutoLayout leadingConstaintFrom:lookupButton toView:self.view];
    [AutoLayout trailingConstaintFrom:lookupButton toView:self.view];
    [AutoLayout height:buttonHeight forView:lookupButton];
    [AutoLayout topOffset:topLayoutHeight + 2* buttonHeight fromView:lookupButton toView:self.view];
    
//    NSLayoutConstraint *browseButtonTop = [AutoLayout genericConstraintFrom:browseButton toView:self.view withAttribute:NSLayoutAttributeTop];
//    browseButtonTop.constant = navBarHeight;
//    
//    NSLayoutConstraint *bookButtonMid = [AutoLayout genericConstraintFrom:bookButton toView:self.view withAttribute:NSLayoutAttributeCenterX];
//    bookButtonMid.constant = navBarHeight;
//    
//    
//    NSLayoutConstraint *browseHeight = [AutoLayout equalHeightConstraintFromView:browseButton toView:self.view withMultiplier:.333];
//    [browseButton addTarget:self action:@selector(browseButtonSelected) forControlEvents:UIControlEventTouchUpInside];
//    
//    NSLayoutConstraint *bookButtonTop = [AutoLayout equalHeightConstraintFromView:bookButton toView:browseButton withMultiplier:.33];
//    [bookButton addTarget:self action:@selector(bookButtonSelected) forControlEvents:UIControlEventTouchUpInside];
}

-(void)browseButtonSelected {
    HotelsViewController *hotelViewController = [[HotelsViewController alloc] init];
    [self.navigationController pushViewController:hotelViewController animated:YES];
    NSLog(@"Work on this for lab");
}

-(void)bookButtonSelected {
    DatePickerViewController *datePickerController = [[DatePickerViewController alloc]init];
    [self.navigationController pushViewController:datePickerController animated:YES];
}

-(void)lookUpButtonPressed{
    NSLog(@"look Up Button ");
}

-(UIButton *)createButtonWithTitle:(NSString *)title {
    UIButton *button = [[UIButton alloc]init];
    [button setTitle:title forState:normal];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self.view addSubview:button];
    return button;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
