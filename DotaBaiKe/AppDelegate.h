//
//  AppDelegate.h
//  DotaBaiKe
//
//  Created by Mark on 12-12-27.
//  Copyright (c) 2012年 Mark. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    UINavigationController *rootViewController;
}

@property (strong, nonatomic) UIWindow                  *window;
@property (nonatomic, retain) UINavigationController    *rootViewController;

@end
