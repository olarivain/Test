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
        return 3;
    }
    return  10;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *cellId = indexPath.section == 1 && indexPath.row == 0 ? @"kraCellWithMap" : @"kraCell";
    KRATableCell *theCell = [tableView dequeueReusableCellWithIdentifier: cellId];
    [theCell updateWithIndexPath: indexPath];

    UIRectCorner corners = 0;
    if(indexPath.row == 0) {
        corners |= UIRectCornerTopLeft | UIRectCornerTopRight;
    }
    if(indexPath.row == ([tableView numberOfRowsInSection: indexPath.section] - 1)) {
        corners |= UIRectCornerBottomLeft | UIRectCornerBottomRight;
    }

    [theCell updateCorners: corners];
    return theCell;
}

- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    // no spacing after last section
    if(section == [tableView numberOfSections] - 1) {
        return 0;
    }
    
    // otherwise, fixed size
    return 40;
}

- (UIView *) tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    // the footer is simply a transparent view
    // initialize with a 0 size frame and let the table do the sizing
    UIView *header = [[UIView alloc] initWithFrame: CGRectZero];
    header.userInteractionEnabled = NO;
    header.backgroundColor = [UIColor clearColor];
    
    return header;
}

@end
