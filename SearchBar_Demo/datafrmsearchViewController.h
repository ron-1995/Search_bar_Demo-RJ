//
//  datafrmsearchViewController.h
//  SearchBar_Demo
//
//  Created by ronakj on 4/19/16.
//  Copyright (c) 2016 com.ronak.zaptech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface datafrmsearchViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *datanamelbl;
- (IBAction)backbutnaction:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *dataaddlbl;
@property (strong, nonatomic) IBOutlet UIImageView *dataimgview;
@property(strong,nonatomic)NSString *nameStr;
@property(strong,nonatomic)NSString *addStr;
@property(strong,nonatomic)UIImage *imgStr;
@end
