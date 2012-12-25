//
//  KRARoundedCorners.h
//  Test
//
//  Created by Kra on 12/24/12.
//  Copyright (c) 2012 Kra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KRARoundedCorners : UIView

@property (strong, nonatomic) UIColor *borderColor;
@property (assign, nonatomic) CGFloat borderWidth;

@property (assign, nonatomic) UIRectCorner corners;
@property (assign, nonatomic) CGFloat cornerRadius;

@end
