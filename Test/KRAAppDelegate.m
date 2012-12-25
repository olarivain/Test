//
//  KRAAppDelegate.m
//  Test
//
//  Created by Kra on 12/24/12.
//  Copyright (c) 2012 Kra. All rights reserved.
//

#import "KRAAppDelegate.h"

#import "KRAViewController.h"

@implementation KRAAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.viewController = [[KRAViewController alloc] initWithNibName:@"KRAViewController" bundle:nil];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    
    [self createAssets];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void) createAssets {
    // the drawing rectangle
    CGSize theSize = CGSizeMake(20, 20);
    CGRect theRect;
    theRect.origin = CGPointZero;
    theRect.size = theSize;
    
    // all
    [self createAssetWithRect: theRect
                   andCorners: UIRectCornerAllCorners
                       toFile: @"AllCorners.png"];
    
    // top
    [self createAssetWithRect: theRect
                   andCorners: UIRectCornerTopLeft | UIRectCornerTopRight
                       toFile: @"TopCorners.png"];
    
    // bottom
    [self createAssetWithRect: theRect
                   andCorners: UIRectCornerBottomLeft | UIRectCornerBottomRight
                       toFile: @"BottomCorners.png"];
}

- (void) createAssetWithRect: (CGRect) rect andCorners: (UIRectCorner) corner toFile: (NSString *) file {
    // First, all corners
    UIGraphicsBeginImageContext(rect.size);
    
    // set the stroke color
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, [UIColor darkGrayColor].CGColor);
    
    // create the path and stroke it
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect: rect
                                               byRoundingCorners: corner
                                                     cornerRadii: CGSizeMake(5.0f, 5.0f)];
    [path stroke];
    
    // extract image from context
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    // write it
    NSString  *pngPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    pngPath = [pngPath stringByAppendingPathComponent: file];
    [UIImagePNGRepresentation(image) writeToFile: pngPath atomically: YES];
}

@end
