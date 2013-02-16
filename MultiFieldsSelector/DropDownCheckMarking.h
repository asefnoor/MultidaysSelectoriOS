//
//  customDropDown.h
//  DropDownMenu
//
//  Created by Asif Noor on 2/16/13.
//  Copyright (c) 2013 Techipost. All rights reserved.

//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@protocol DropDownCheckMarkingDelegate <NSObject>

@required
- (void)valuesSelectedInDropDown:(NSMutableArray*)indicesSelected;
@end

@interface DropDownCheckMarking : UIView<UITableViewDelegate,UITableViewDataSource>
{
   
    UIButton * dropBtn;
    UITableView *tblDropDown;
    CGFloat height;
 id<DropDownCheckMarkingDelegate> menuDelegate;
    NSMutableArray * selectedIndices;
}
@property (retain, nonatomic)     NSMutableArray * selectedIndices;
@property (assign) id<DropDownCheckMarkingDelegate> menuDelegate;
@property (retain, nonatomic) NSArray* itemsArray;
- (id)initWithFrame:(CGRect)frame options:(NSArray*)items  selectedIndicies:(NSMutableArray*)indiciesSelected;
- (void)dropDownPressed:(id)sender;
-(void)moveTableUp;
-(void)updateData:(NSArray*)items;
@end
