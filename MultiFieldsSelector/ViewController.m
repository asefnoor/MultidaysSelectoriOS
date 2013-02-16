//
//  ViewController.m
//  MultiFieldsSelector
//
//  Created by Asif Noor on 2/16/13.
//  Copyright (c) 2013 Techipost. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize txtSelectedCountry;
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Techipost";
	// Do any additional setup after loading the view, typically from a nib.
    countries = [[NSArray alloc] initWithObjects:@"India",@"United States",@"Pakistan",@"United Kingdom",@"Germany",@"Canada",@"France",@"Brazil",@"Italy", nil];
    selectedCountries = [[NSMutableArray alloc] init];
    for (int i =0; i< [countries count]; i++) {
        
        [selectedCountries addObject:@"0"];
        
    }
    [self setCountriesNames:selectedCountries];
   
    
}
- (void) showCountriesDropDown {
    
   
    countriesDropDown = [[DropDownCheckMarking alloc] initWithFrame:self.txtSelectedCountry.frame options:countries selectedIndicies:selectedCountries];
    [countriesDropDown setMenuDelegate:self];
    [self.view addSubview:countriesDropDown];
}
- (void)valuesSelectedInDropDown:(NSMutableArray*)indicesSelected
{
    //it will return the indexes of selected countries
    [self setCountriesNames:indicesSelected];
    
}
- (void)setCountriesNames:(NSMutableArray *)indicesSelected
{
    //Here you want to actually update your text field which countries are selected
    int totalselections =0;
    for (int count = 0; count < [indicesSelected count]; count++)
    {
        if ( [[indicesSelected objectAtIndex:count] intValue] == 1 )
        {
            totalselections ++;
        }
    }

    if(totalselections >1)
    {
        self.txtSelectedCountry.text= @"Multiple Events – See Selection";
        
    }
    else if (totalselections == 0)
    {
        self.txtSelectedCountry.text =@"None Selected";
    }
    else
    {
        [self.txtSelectedCountry setText:[countries objectAtIndex:0]];
    }
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField;        // return NO to disallow editing.
{
            [self showCountriesDropDown];
    return NO;
}


- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    //if single tapped or double tapped, dropdown will go away and selected values will update the textfield
    [countriesDropDown moveTableUp];

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [txtSelectedCountry release];
    [super dealloc];
}
@end
