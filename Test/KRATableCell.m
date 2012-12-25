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
#import "KRARoundedCorners.h"

@interface KRATableCell ()

@property (weak, nonatomic) IBOutlet UILabel *theLabel;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet KRARoundedCorners *roundedCorners;

@end

@implementation KRATableCell

- (void) awakeFromNib {
    // nothing to do if we don't have a map view
    if(_mapView == nil) {
        return;
    }
    
    // create a path that clips the map at the top corners
    CGRect maskRect;
    maskRect.origin = CGPointZero;
    maskRect.size = _mapView.frame.size;
    
    UIBezierPath *roundedCornerPath = [UIBezierPath bezierPathWithRoundedRect: maskRect
                                                            byRoundingCorners: UIRectCornerTopLeft | UIRectCornerTopRight
                                                                  cornerRadii: CGSizeMake(_roundedCorners.cornerRadius, _roundedCorners.cornerRadius)];
    
    // create the corresponding shape layer, assign it the mask path
    CAShapeLayer *maskLayer = [CAShapeLayer layer];    
    maskLayer.path = roundedCornerPath.CGPath;
    
    // and inject that into the map's main layer
    _mapView.layer.mask = maskLayer;
}

- (void) updateCorners: (UIRectCorner) corners {
    _roundedCorners.corners = corners;
}

- (void) updateWithIndexPath: (NSIndexPath *) indexPath {
    self.theLabel.text = [NSString stringWithFormat: @"section %i row %i", indexPath.section, indexPath.row];
}

@end
