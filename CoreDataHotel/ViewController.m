//
//  ViewController.m
//  CoreDataHotel
//
//  Created by David Porter on 4/24/17.
//  Copyright © 2017 David Porter. All rights reserved.
//

#import "ViewController.h"
#import "AutoLayout.h"

@interface ViewController ()

@end

@implementation ViewController

-(void)loadView {
    [super loadView];
    self.view.backgroundColor = [UIColor grayColor];
    
    [self setupLayout];
}

-(void)setupLayout {
    
    float navBarHeight = CGRectGetHeight(self.navigationController.navigationBar.frame);
    
    UIButton *browseButton = [self createButtonWithTitle:@"Browse"];
    UIButton *bookButton = [self createButtonWithTitle:@"Book"];
    UIButton *lookupButton = [self createButtonWithTitle:@"Look Up"];
    
    browseButton.backgroundColor = [UIColor colorWithRed:1.0 green:1.0 blue:0.75 alpha:1.0];
    
    [AutoLayout leadingConstaintFrom:browseButton toView:self.view];
    [AutoLayout trailingConstaintFrom:browseButton toView:self.view];
    
    NSLayoutConstraint *browseHeight = [AutoLayout equalHeightConstraintFromView:browseButton toView:self.view withMultiplier:.333];
    [browseButton addTarget:self action:@selector(browseButtonSelected) forControlEvents:UIControlEventTouchUpInside];
}

-(void)browseButtonSelected {
    NSLog(@"Work on this for lab");
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
