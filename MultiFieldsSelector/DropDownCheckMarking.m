//
//  customDropDown.m
//  DropDownMenu
//
//  Created by Asif Noor on 2/16/13.
//  Copyright (c) 2013 Techipost. All rights reserved.
//

#import "DropDownCheckMarking.h"

@implementation DropDownCheckMarking

@synthesize itemsArray;
@synthesize menuDelegate;
@synthesize selectedIndices;

#define KselectedItemTag 1
#define KUnselectedItemTag 0
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame options:(NSArray*)items selectedIndicies:(NSMutableArray *)indiciesSelected
{
    self = [super initWithFrame:frame];
    if (self) {
        height= frame.size.height;
       [self setBackgroundColor:[UIColor clearColor]];
        
         dropBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [dropBtn setFrame:CGRectZero];
        [dropBtn addTarget:self action:@selector(dropDownPressed:) forControlEvents:UIControlEventTouchUpInside];
        
        
        [self addSubview:dropBtn];
        tblDropDown=[[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        [tblDropDown setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        [tblDropDown setDelegate:self];
        [tblDropDown setDataSource:self];
        [tblDropDown setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"dropDownBG.png"]]];
        [tblDropDown setFrame:CGRectMake(0, frame.size.height+20, frame.size.width,0)]; 
        
        [self addSubview:tblDropDown];
        self.itemsArray = [[NSArray alloc]initWithArray:items];
        selectedIndices = [[NSMutableArray alloc]initWithArray:indiciesSelected];
    
        // Initialization code
    }
    return self;
}

-(void)updateData:(NSArray *)items
{
    self.itemsArray = items;
    [tblDropDown reloadData];
}
- (void)layoutSubviews
{
    [super layoutSubviews];
 
    [dropBtn setFrame:CGRectMake(0,0, 309,height)];    
    //[tblDropDown setFrame:CGRectMake(0, 20, 100,1)];
     
}
- (void)dropDownPressed:(id)sender
{
    
    if (tblDropDown.frame.size.height>0) {
        
        [UIView beginAnimations:nil context:self];
        [UIView setAnimationDuration:0.25];
        [self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y,self.frame.size.width,height)];
        [tblDropDown setFrame:CGRectMake(0, height+2,self.frame.size.width,0)];                                    
        [UIView commitAnimations];
      
            } 
    else {
        [UIView beginAnimations:nil context:self];
        [UIView setAnimationDuration:0.25];
        [self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y,self.frame.size.width,height+180)];
        
        NSLog(@"%f",self.frame.size.height);
        [tblDropDown setFrame:CGRectMake(0, height+2,self.frame.size.width, 180)];
        NSLog(@"%f",tblDropDown.frame.size.height);
        [UIView commitAnimations];
   
        }
    
    for (int i = 0; i<[itemsArray count]; i++)
    {
        
    }
}

-(void)moveTableUp
{
    [UIView beginAnimations:nil context:self];
    [UIView setAnimationDuration:0.25];
    [self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y,self.frame.size.width,height)];
    [tblDropDown setFrame:CGRectMake(0, height+2,self.frame.size.width,0)];                                    
    [UIView commitAnimations];
    
    [self.menuDelegate valuesSelectedInDropDown:selectedIndices];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return  height;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    
    UITableViewCell *cellAtindexPath = [tableView cellForRowAtIndexPath:indexPath];
    
    if ([cellAtindexPath tag] == KUnselectedItemTag)
    {
        [(UIImageView *)cellAtindexPath.accessoryView setImage:[UIImage imageNamed:@"tick.png"]];
        [cellAtindexPath setTag:KselectedItemTag];
        [self.selectedIndices replaceObjectAtIndex:indexPath.row withObject:@"1"];
    }
    else
    {
            [(UIImageView *)cellAtindexPath.accessoryView setImage:nil];
            [cellAtindexPath setTag:KUnselectedItemTag];
            [self.selectedIndices replaceObjectAtIndex:indexPath.row withObject:@"0"];
    }
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.itemsArray count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"TableCell";
    cellIdentifier = [cellIdentifier stringByAppendingString:[NSString stringWithFormat: @"%i",indexPath.row]];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    UIImageView *acc = nil;
    if(cell==nil)
    {
        
        NSLog(@"my indexpath %d",indexPath.row);
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
        [cell.textLabel setTextColor:[UIColor whiteColor]];
        
        [cell.textLabel setText:[itemsArray objectAtIndex:[indexPath row]]];
        acc = [[UIImageView alloc] initWithFrame:CGRectMake(240, 14, 21, 21)];
        [cell setTag:((NSNumber*)[selectedIndices objectAtIndex:indexPath.row]).intValue];
        if (cell.tag == 1)
        {
            [acc  setImage:[UIImage imageNamed:@"tick.png"]];
            
        }
        
        cell.accessoryView = acc;
        [acc autorelease];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    
    return cell;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
