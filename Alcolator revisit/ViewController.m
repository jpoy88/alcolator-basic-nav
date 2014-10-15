//
//  ViewController.m
//  Alcolator revisit
//
//  Created by John Patrick Adapon on 10/14/14.
//  Copyright (c) 2014 John Adapon. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *beerPercentTextField;
@property (weak, nonatomic) IBOutlet UISlider *beerCountSlider;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;
@property (weak, nonatomic) IBOutlet UILabel *anotherLabel;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


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


- (IBAction)textFieldDidChange:(UITextField *)sender {
    
    NSString *enteredText = sender.text;
    float enteredNumber = [enteredText floatValue];\
    
    if (enteredNumber == 0) {
        sender.text = nil;
    }
    
}


- (IBAction)sliderValueDidChange:(UISlider *)sender {
    NSLog(@"Slider value changed to %f", sender.value);
    [self.beerPercentTextField resignFirstResponder];
    
    int numberOfBeer = self.beerCountSlider.value;
    NSString *resultText = [NSString stringWithFormat:NSLocalizedString(@"Number of Beer: %d", nil), numberOfBeer];
    
    self.anotherLabel.text = resultText;
    
    self.resultLabel.text = [self calculateBeerAndWine];
}

- (IBAction)buttonPressed:(UIButton *)sender {
    [self.beerPercentTextField resignFirstResponder];
    
            self.resultLabel.text = [self calculateBeerAndWine];
    
}

- (IBAction)tapGestureDidFire:(UITapGestureRecognizer *)sender {
    [self.beerPercentTextField resignFirstResponder];
}


@end
