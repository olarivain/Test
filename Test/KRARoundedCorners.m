//
//  KRARoundedCorners.m
//  Test
//
//  Created by Kra on 12/24/12.
//  Copyright (c) 2012 Kra. All rights reserved.
//

#import "KRARoundedCorners.h"

@interface KRARoundedCorners ()

@property (strong, nonatomic) UIColor *fillColor;

@end

@implementation KRARoundedCorners

- (id) initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder: aDecoder];
    if(self) {
        [self sharedInit];
    }
    return self;
}

- (id) initWithFrame:(CGRect)frame {
    self = [super initWithFrame: frame];
    if(self) {
        [self sharedInit];
    }
    return self;
}

- (void) sharedInit {
    // hijack the background color into the fill color and make ourselves
    // transparent
    self.fillColor = self.backgroundColor;
    self.backgroundColor = [UIColor clearColor];
    
    self.borderColor = [UIColor blackColor];
    self.borderWidth = 1.0;
    self.cornerRadius = 5.0f;
    self.corners = UIRectCornerAllCorners;
}

#pragma mark - custom setters
- (void) setBorderColor:(UIColor *)borderColor {
    _borderColor = borderColor;
    [self setNeedsDisplay];
}

- (void) setBorderWidth:(CGFloat)borderWidth {
    _borderWidth = borderWidth;
    [self setNeedsDisplay];
}

- (void) setCornerRadius:(CGFloat)cornerRadius {
    _cornerRadius = cornerRadius;
    [self setNeedsDisplay];
}

- (void) setCorners:(UIRectCorner)corners {
    _corners = corners;
    [self setNeedsDisplay];
}


#pragma mark - draw routine
- (void)drawRect:(CGRect)rect
{
    [super drawRect: rect];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, self.borderColor.CGColor);
    CGContextSetLineWidth(context, self.borderWidth);
    CGContextSetFillColorWithColor(context, self.fillColor.CGColor);
    CGContextSetShouldAntialias(context, YES);
    
    UIBezierPath *roundedCornerPath = [UIBezierPath bezierPathWithRoundedRect: rect
                                                            byRoundingCorners: _corners
                                                                  cornerRadii: CGSizeMake(_cornerRadius, _cornerRadius)];
    [roundedCornerPath fill];
    [roundedCornerPath stroke];

}

@end
