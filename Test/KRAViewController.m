//
//  KRAViewController.m
//  Test
//
//  Created by Kra on 12/24/12.
//  Copyright (c) 2012 Kra. All rights reserved.
//

#import "KRAViewController.h"

#import "KRATableCell.h"
#import "KRACustomDataSource.h"

@interface KRAViewController ()

@property (weak, nonatomic) IBOutlet UITableView *table;
@property (strong, nonatomic) IBOutlet KRACustomDataSource *tableDataSource;

@end

@implementation KRAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    

}

- (void) viewDidAppear:(BOOL)animated {
    [super viewWillAppear: animated];
    
//    [self.table drawBoxInSection: 1];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - initialization methods



@end
