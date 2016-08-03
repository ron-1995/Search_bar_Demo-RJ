//
//  ViewController.m
//  SearchBar_Demo
//
//  Created by ronakj on 4/13/16.
//  Copyright (c) 2016 com.ronak.zaptech. All rights reserved.
//

#import "ViewController.h"
#import "myTableViewCell.h"
#import "datafrmsearchViewController.h"



@interface ViewController ()<UITableViewDataSource , UITableViewDelegate>{
    
    NSMutableArray *contentList;
    NSMutableArray *filteredContentList;
    NSMutableDictionary *filteredContentListdict;
    BOOL isSearching;
}


@end

@implementation ViewController

@synthesize mytableview;
@synthesize myseachbar;
@synthesize mydisplaycontroller;

 NSMutableArray *NameArray,*imgArray ,*addArray ,*people;
NSArray *array;
- (void)viewDidLoad {
    [super viewDidLoad];
[[self navigationController] setNavigationBarHidden:YES animated:YES];
   array = [NSArray arrayWithObjects:
                      [NSDictionary dictionaryWithObjectsAndKeys:
                       @"Krutagn Patel",@"name",
                       @"Shishakti Apt society",@"address",
                       @"T46-1.jpg",@"image",
                       nil],
                      [NSDictionary dictionaryWithObjectsAndKeys:
                       @"Ronak Janani",@"name",
                       @"Vandematram city society",@"address",
                       @"12312.jpg",@"image",
                       nil],
                      [NSDictionary dictionaryWithObjectsAndKeys:
                       @"Datt Patel",@"name",
                       @"cp Nagar society",@"address",
                       @"pexels-photo.jpg",@"image",
                       nil],
             [NSDictionary dictionaryWithObjectsAndKeys:
              @"Dharmesh shah",@"name",
              @"CP nagar society",@"address",
              @"T46-1.jpg",@"image",
              nil],
             [NSDictionary dictionaryWithObjectsAndKeys:
              @"Ronak Acharya",@"name",
              @"paras nagar society",@"address",
              @"12312.jpg",@"image",
              nil],
             [NSDictionary dictionaryWithObjectsAndKeys:
              @"bhavik sir",@"name",
              @"cg road society",@"address",
              @"pexels-photo.jpg",@"image",
              nil],
             [NSDictionary dictionaryWithObjectsAndKeys:
                     @"Vibha Vachhani",@"name",
                     @"junagadh vrl society",@"address",
                     @"T46-1.jpg",@"image",
                     nil],
             [NSDictionary dictionaryWithObjectsAndKeys:
              @"Shivani Pandey",@"name",
              @"paras nagar society",@"address",
              @"12312.jpg",@"image",
              nil],
             [NSDictionary dictionaryWithObjectsAndKeys:
              @"Arati kyada",@"name",
              @"Bapunagar mandir society",@"address",
              @"pexels-photo.jpg",@"image",
              nil],
                      nil];
  
    filteredContentList = [[NSMutableArray alloc] init];
    
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    if (isSearching) {
        return [filteredContentList count];
    }
    else {
 return [array count];
    }
    

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"cell";
    
    myTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[myTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cell];
    }
//    
//     Configure the cell...
    if (isSearching) {
        cell.mynamelbl.text = [[filteredContentList objectAtIndex:indexPath.row]valueForKey:@"name"];
           cell.myaddresslbl.text = [[filteredContentList objectAtIndex:indexPath.row]valueForKey:@"address"];
        

    }
    else {
        
         cell.mynamelbl.text = [[array objectAtIndex:indexPath.row]valueForKey:@"name"];
         cell.myaddresslbl.text = [[array objectAtIndex:indexPath.row]valueForKey:@"address"];
         cell.myimgview.image = [UIImage imageNamed:[[array objectAtIndex:indexPath.row]valueForKey:@"image"]];
        

    }
    return cell;
    
}

- (void)searchTableList
{
    NSString *searchString = myseachbar.text;
    [filteredContentList removeAllObjects];
    for (NSDictionary *key in array)
    {
        NSRange range = [key[@"name"] rangeOfString:@" "];
         NSRange range1= [key[@"address"] rangeOfString:@" "];
//        NSRange range2= [key[@"address"] rangeOfString:@" "];
        
        // NSArray *arr=[array objectForKey:key];
        // arr=[arr filteredArrayUsingPredicate:namePredicate];
        
        if ([key[@"name"]compare:searchString options:(NSCaseInsensitiveSearch|NSDiacriticInsensitiveSearch) range:NSMakeRange(0, [searchString length])]
            &&
            [key[@"name"]compare:searchString options:(NSCaseInsensitiveSearch|NSDiacriticInsensitiveSearch) range:NSMakeRange(range.location+1, [searchString length])]
            &&
            [key[@"address"]compare:searchString options:(NSCaseInsensitiveSearch|NSDiacriticInsensitiveSearch) range:NSMakeRange(0, [searchString length])]
            &&
            [key[@"address"]compare:searchString options:(NSCaseInsensitiveSearch|NSDiacriticInsensitiveSearch) range:NSMakeRange(range1.location+1, [searchString length])]
           )
        {
            
        }
       
        else
        {
                [filteredContentList addObject:key];
            
            
        }
        
    }
    [self.mytableview reloadData];
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar1 {
    
    if ([searchBar1.text length] != 0)
        isSearching = YES;
    else
        isSearching = NO;
}
//
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    NSLog(@"Text change - %d",isSearching);
    
    //Remove all objects first.
    [filteredContentList removeAllObjects];
    
    if([searchText length] != 0) {
        isSearching = YES;
        [self searchTableList];
    }
    else {
        isSearching = NO;
    }
    [self.mytableview reloadData];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    NSLog(@"Cancel clicked");
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSLog(@"Search Clicked");
    [self searchTableList];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 71;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath

{
    datafrmsearchViewController  *objViewViewController2 =(datafrmsearchViewController *) [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"datafrmsearchViewController1"];
    
    myTableViewCell *currentcell = (myTableViewCell *)[self.mytableview cellForRowAtIndexPath:indexPath];
    
    objViewViewController2.nameStr =  currentcell.mynamelbl.text;
    objViewViewController2.addStr = currentcell.myaddresslbl.text;
    objViewViewController2.imgStr = currentcell.myimgview.image;
    
    
    [[self navigationController ] pushViewController:objViewViewController2 animated:YES];
}
@end
