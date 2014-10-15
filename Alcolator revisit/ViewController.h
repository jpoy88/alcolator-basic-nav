//
//  ViewController.h
//  Alcolator revisit
//
//  Created by John Patrick Adapon on 10/14/14.
//  Copyright (c) 2014 John Adapon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) UITextField *beerPercentTextField;
@property (weak, nonatomic) UISlider *beerCountSlider;
@property (weak, nonatomic) UILabel *resultLabel;

- (void)buttonPressed:(UIButton *)sender;
@end
