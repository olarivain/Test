//
//  KRATableCell.m
//  Test
//
//  Created by Kra on 12/24/12.
//  Copyright (c) 2012 Kra. All rights reserved.
//
#import <MapKit/MapKit.h>
#import <QuartzCore/QuartzCore.h>
#import "KRATableCell.h"

@interface KRATableCell ()

@property (weak, nonatomic) IBOutlet UILabel *theLabel;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UIView *mapViewContainer;

@end

@implementation KRATableCell

- (void) prepareForReuse {
    // clear the mask
    self.layer.mask = nil;
}

- (void) updateMaskLayerWithWidth: (CGFloat) width andCorners: (UIRectCorner) corners {
    if(corners == 0 && corners != UIRectCornerAllCorners) {
        return;
    }
    
    CGRect maskRect;
    maskRect.size = self.frame.size;
    maskRect.origin = CGPointZero;
    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect: maskRect
                                                   byRoundingCorners: corners
                                                         cornerRadii: CGSizeMake(5.0f, 5.0f)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.contentView.layer.frame;
    maskLayer.path = maskPath.CGPath;
    
    self.layer.mask = maskLayer;
}

- (void) updateWithIndexPath: (NSIndexPath *) indexPath {
    self.theLabel.text = [NSString stringWithFormat: @"section %i row %i", indexPath.section, indexPath.row];
}

@end
