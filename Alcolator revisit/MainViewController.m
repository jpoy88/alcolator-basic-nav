//
//  MainViewController.m
//  Alcolator revisit
//
//  Created by John Patrick Adapon on 10/15/14.
//  Copyright (c) 2014 John Adapon. All rights reserved.
//

#import "MainViewController.h"
#import "ViewController.h"
#import "WhiskeyViewController.h"

@interface MainViewController ()

@property (nonatomic, weak) UIButton *wine;
@property (nonatomic, weak) UIButton *whiskey;

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)loadView {
    [super loadView];
    
    self.title = NSLocalizedString(@"Select Alcolator", @"alcolator");
    
    
    
    UIButton *wineButton = [[UIButton alloc] init];
    UIButton *whiskeyButton = [[UIButton alloc] init];
    
    
    [self.view addSubview:wineButton];
    [self.view addSubview:whiskeyButton];
    
    self.wine = wineButton;
    self.whiskey = whiskeyButton;
    
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:101.0 / 255.0 green:117.0 / 255.0 blue:127.0 / 255.0 alpha:1];
    
    [self.wine addTarget:self action:@selector(winePressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.whiskey  addTarget:self action:@selector(whiskeyPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.wine setTitle:NSLocalizedString(@"Wine", @"Wine category") forState:UIControlStateNormal];
    [self.wine setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.wine setTitleColor:[UIColor yellowColor] forState:UIControlStateHighlighted];
    
    [self.whiskey setTitle:NSLocalizedString(@"Whiskey", @"Whiskey category") forState:UIControlStateNormal];
    [self.whiskey setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.whiskey setTitleColor:[UIColor yellowColor] forState:UIControlStateHighlighted];
    
    
    // Do any additional setup after loading the view.
}

-(void)viewWillLayoutSubviews {
    
    CGFloat viewWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat viewHeight = [UIScreen mainScreen].bounds.size.height;
    
    CGFloat itemWidth = viewWidth / 4;
    CGFloat itemHeight = 45;
    
    self.wine.frame = CGRectMake(viewWidth / 7, viewHeight / 2, itemWidth, itemHeight);
    self.whiskey.frame = CGRectMake(viewWidth / 1.9, viewHeight / 2, itemWidth, itemHeight);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Events

-(void) winePressed:(UIButton *) sender{
    ViewController *wineVC = [[ViewController alloc] init];
    [self.navigationController pushViewController:wineVC animated:YES];
}

-(void) whiskeyPressed:(UIButton *) sender{
    WhiskeyViewController *whiskeyVC = [[WhiskeyViewController alloc] init];
    [self.navigationController pushViewController:whiskeyVC animated:YES];
}



@end
