//
//  KRATableCell.h
//  Test
//
//  Created by Kra on 12/24/12.
//  Copyright (c) 2012 Kra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KRATableCell : UITableViewCell

- (void) updateWithIndexPath: (NSIndexPath *) indexPath;
- (void) updateMaskLayerWithWidth: (CGFloat) width andCorners: (UIRectCorner) corners;

@end
