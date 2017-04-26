//
//  AutoLayout.m
//  CoreDataHotel
//
//  Created by David Porter on 4/24/17.
//  Copyright © 2017 David Porter. All rights reserved.
//

#import "AutoLayout.h"

@implementation AutoLayout

+(NSArray *)fullScreenConstraintsWithVFLForView:(UIView *)view {
    NSMutableArray *constraints = [[NSMutableArray alloc]init];
    
    NSDictionary *viewDictionary = @{@"view": view};
    
    NSArray *horizonatalConstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[view]|"
                                                                             options:0
                                                                             metrics:nil
                                                                               views:viewDictionary];
    
    NSArray *verticalConstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[view]|"
                                                                          options:0
                                                                          metrics:nil
                                                                            views:viewDictionary];
    
    [constraints addObjectsFromArray:horizonatalConstraint];
    [constraints addObjectsFromArray:verticalConstraint];
    
    [NSLayoutConstraint activateConstraints:constraints];
    
    return constraints.copy;
}

+(NSLayoutConstraint *)genericConstraintFrom:(UIView *)view
                                      toView:(UIView *)superView
                               withAttribute:(NSLayoutAttribute)attribute
                               andMultiplier:(CGFloat)multiplier {
    
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:view
                                                                  attribute:attribute
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:superView
                                                                  attribute:attribute
                                                                 multiplier:multiplier
                                                                   constant:0.0];
    
    constraint.active = YES;
    return constraint;
    
}

+(NSLayoutConstraint *)genericConstraintFrom:(UIView *)view
                                      toView:(UIView *)superView
                               withAttribute:(NSLayoutAttribute)attribute {
    return [AutoLayout genericConstraintFrom:view toView:superView withAttribute:attribute andMultiplier:1.0];
}

+(NSLayoutConstraint *)equalHeightConstraintFromView:(UIView *)view
                                              toView:(UIView *)otherView
                                      withMultiplier:(CGFloat)multiplier {
    NSLayoutConstraint *heightConstraint = [AutoLayout genericConstraintFrom:view toView:otherView withAttribute:NSLayoutAttributeHeight andMultiplier:multiplier];
    
    return heightConstraint;
}

+(NSLayoutConstraint *)leadingConstraintFrom:(UIView *)view
                                     toView:(UIView *)otherView {
    return [AutoLayout genericConstraintFrom:view toView:otherView withAttribute:NSLayoutAttributeLeading];
}

+(NSLayoutConstraint *)trailingConstraintFrom:(UIView *)view
                                      toView:(UIView *)otherView {
    return [AutoLayout genericConstraintFrom:view toView:otherView withAttribute:NSLayoutAttributeTrailing];
}

+(NSLayoutConstraint *)height:(CGFloat)height
                      forView:(UIView *)view{
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:view
                                                                  attribute:NSLayoutAttributeHeight
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:nil
                                                                  attribute:NSLayoutAttributeNotAnAttribute
                                                                 multiplier:1.0
                                                                   constant:height];
    
    constraint.active = YES;
    return constraint;
}

+(NSLayoutConstraint *)topOffset:(CGFloat)offset
                        fromView:(UIView *)view
                          toView:(UIView *)otherView{
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:view
                                                                  attribute:NSLayoutAttributeTop
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:otherView
                                                                  attribute:NSLayoutAttributeTop
                                                                 multiplier:1.0
                                                                   constant:offset];
    
    constraint.active = YES;
    return constraint;
}

+(NSArray *)constraintsWithVFLForViewDictionary:(NSDictionary *)viewDictionary
                           forMetricsDictionary:(NSDictionary *)metricsDictionary
                                    withOptions:(NSLayoutFormatOptions)options
                               withVisualFormat:(NSString *)visualFormat{
    NSArray *constraints = [[NSArray alloc]init];
    
    constraints = [NSLayoutConstraint constraintsWithVisualFormat:visualFormat
                                                          options:options
                                                          metrics:metricsDictionary
                                                            views:viewDictionary];
    [NSLayoutConstraint activateConstraints:constraints];
    return constraints.copy;
}

@end
