//
//  datafrmsearchViewController.m
//  SearchBar_Demo
//
//  Created by ronakj on 4/19/16.
//  Copyright (c) 2016 com.ronak.zaptech. All rights reserved.
//

#import "datafrmsearchViewController.h"

@interface datafrmsearchViewController ()

@end

@implementation datafrmsearchViewController
@synthesize imgStr,nameStr,addStr;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataimgview.image = imgStr;
    self.datanamelbl.text = nameStr;
    self.dataaddlbl.text = addStr;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)backbutnaction:(id)sender {
    
    
    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:0] animated:YES] ;
}
@end
