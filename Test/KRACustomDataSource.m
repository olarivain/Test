//
//  KRACustomDataSource.m
//  Test
//
//  Created by Kra on 12/24/12.
//  Copyright (c) 2012 Kra. All rights reserved.
//

#import "KRACustomDataSource.h"

#import "KRATableCell.h"

@interface KRACustomDataSource ()
@property (weak, nonatomic) IBOutlet UITableView *table;

@end

@implementation KRACustomDataSource

- (void) awakeFromNib {
    self.table.rowHeight = 80.0f;
    
    [self.table registerNib: [UINib nibWithNibName: @"KRATableCell" bundle: nil]
     forCellReuseIdentifier: @"kraCell"];
    
    [self.table registerNib: [UINib nibWithNibName: @"KRATableCellWithMap" bundle: nil]
     forCellReuseIdentifier: @"kraCellWithMap"];
}

#pragma mark - Table Data Source
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 20;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(section == 1) {
        return 1;
    }
    return  10;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *cellId = indexPath.section == 1 && indexPath.row == 0 ? @"kraCellWithMap" : @"kraCell";
    KRATableCell *theCell = [tableView dequeueReusableCellWithIdentifier: cellId];
    [theCell updateWithIndexPath: indexPath];

    if(indexPath.section == 1) {
        
        [theCell updateMaskLayerWithWidth: 300 andCorners: UIRectCornerAllCorners];
    }
    return theCell;
}

@end
