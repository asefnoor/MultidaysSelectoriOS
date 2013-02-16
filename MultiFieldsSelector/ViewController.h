//
//  ViewController.h
//  MultiFieldsSelector
//
//  Created by Asif Noor on 2/16/13.
//  Copyright (c) 2013 Techipost. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DropDownCheckMarking.h"
@interface ViewController : UIViewController <DropDownCheckMarkingDelegate,UITextFieldDelegate>{
    DropDownCheckMarking * countriesDropDown;
    NSArray * countries;
    NSMutableArray * selectedCountries;
}
@property (retain, nonatomic) IBOutlet UITextField *txtSelectedCountry;
@end
