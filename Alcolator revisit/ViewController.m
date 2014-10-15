//
//  ViewController.m
//  Alcolator revisit
//
//  Created by John Patrick Adapon on 10/14/14.
//  Copyright (c) 2014 John Adapon. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>

@property (weak, nonatomic) UIButton *calculateButton;
@property (weak, nonatomic) UITapGestureRecognizer *hideKeyboardTapGestureRecognizer;


@end

@implementation ViewController

#pragma mark - Setting Up the Views

- (void) loadView{
    
    self.view = [[UIView alloc] init];
    
    UITextField *textField = [[UITextField alloc] init];
    UISlider *slider = [[UISlider alloc] init];
    UILabel *label = [[UILabel alloc] init];
    UIButton *button = [[UIButton alloc] init];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] init];
    
    [self.view addSubview:textField];
    [self.view addSubview:slider];
    [self.view addSubview:label];
    [self.view addSubview:button];
    [self.view addGestureRecognizer:tap];
    
    self.beerPercentTextField = textField;
    self.beerCountSlider = slider;
    self.resultLabel = label;
    self.calculateButton = button;
    self.hideKeyboardTapGestureRecognizer = tap;
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.view.backgroundColor = [UIColor colorWithRed:142.0 / 255.0 green:210.0 / 255.0 blue:255.0 / 255.0 alpha:1];
    
    self.beerPercentTextField.delegate = self;
    
    self.beerPercentTextField.placeholder = NSLocalizedString(@"% Alcohol Content Per Beer", @"Beer percent placeholder text");
    self.beerPercentTextField.backgroundColor = [UIColor whiteColor];
    
    [self.beerCountSlider addTarget:self action:@selector(sliderValueDidChange:) forControlEvents:UIControlEventValueChanged];
    self.beerCountSlider.minimumValue = 1;
    self.beerCountSlider.maximumValue = 10;
    
    [self.calculateButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.calculateButton setTitle:NSLocalizedString(@"Calculate!", @"Calculate command") forState:UIControlStateNormal];

    
    
    [self.hideKeyboardTapGestureRecognizer addTarget:self action:@selector(tapGestureDidFire:)];
    
    UIFont *papyrus = [UIFont fontWithName:@"Papyrus" size:20.0];
    
    self.resultLabel.numberOfLines = 0;
    
    self.resultLabel.font = papyrus;
    
}


-(void) viewWillLayoutSubviews{
    
    [super viewWillLayoutSubviews];
    
    CGFloat viewWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat padding = 20;
    CGFloat itemWidth = viewWidth - (padding * 2);
    CGFloat itemHeight = 44;
    
    self.beerPercentTextField.frame = CGRectMake(padding, padding + padding, itemWidth, itemHeight);
    
    CGFloat bottomOfTextField = CGRectGetMaxY(self.beerPercentTextField.frame);
    self.beerCountSlider.frame = CGRectMake(padding, bottomOfTextField + padding, itemWidth, itemHeight);
    
    CGFloat bottomOfSlider = CGRectGetMaxY(self.beerCountSlider.frame);
    self.resultLabel.frame = CGRectMake(padding, bottomOfSlider, itemWidth, itemHeight * 2);
    
    CGFloat bottomOfLabel = CGRectGetMaxY(self.resultLabel.frame);
    self.calculateButton.frame = CGRectMake(padding, bottomOfLabel, itemWidth, itemHeight);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Actions and Implementations


- (NSString *)calculateBeerAndWine {
    int numberOfBeers = self.beerCountSlider.value;
    int ouncesInOneBeerGlass = 12;
    
    float alcoholPercentageOfBeer = [self.beerPercentTextField.text floatValue] / 100;
    float ouncesOfAlcoholPerBeer = ouncesInOneBeerGlass * alcoholPercentageOfBeer;
    float ouncesOfAlcoholTotal = ouncesOfAlcoholPerBeer * numberOfBeers;
    
    float ouncesInOneWineGlass = 5;
    float alcoholPercentageOfWine = 0.13;
    
    float ouncesOfAlcoholPerWineGlass = ouncesInOneWineGlass * alcoholPercentageOfWine;
    float numberOfWineGlassForEquivalentAlcoholAmount = ouncesOfAlcoholTotal / ouncesOfAlcoholPerWineGlass;
    
    
    NSString *beerText;
    
    if (numberOfBeers == 1){
        beerText = NSLocalizedString(@"beer", @"singular beer");
    } else {
        beerText = NSLocalizedString(@"beers", @"plural of beer");
    }
    
    
    NSString *wineText;
    
    if (numberOfWineGlassForEquivalentAlcoholAmount == 1) {
        wineText = NSLocalizedString(@"glass", @"singular wine");
    } else {
        wineText = NSLocalizedString(@"glasses", @"plural of wine");
    }
    
    

    return [NSString stringWithFormat:NSLocalizedString(@"%d %@ contains as much alcohol as %.1f %@ of wine.", nil), numberOfBeers, beerText, numberOfWineGlassForEquivalentAlcoholAmount, wineText];

}


- (void)textFieldDidChange:(UITextField *)sender {
    
    NSString *enteredText = sender.text;
    float enteredNumber = [enteredText floatValue];
    
    if (enteredNumber == 0) {
        sender.text = nil;
    }
    
}


- (void)sliderValueDidChange:(UISlider *)sender {
    NSLog(@"Slider value changed to %f", sender.value);
    [self.beerPercentTextField resignFirstResponder];
    
    

    
    self.resultLabel.text = [self calculateBeerAndWine];
}

- (void)buttonPressed:(UIButton *)sender {
    [self.beerPercentTextField resignFirstResponder];
    
            self.resultLabel.text = [self calculateBeerAndWine];
    
}

- (void)tapGestureDidFire:(UITapGestureRecognizer *)sender {
    [self.beerPercentTextField resignFirstResponder];
}


@end
