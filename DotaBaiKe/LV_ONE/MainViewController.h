//
//  MainViewController.h
//  DotaBaiKe
//
//  Created by Mark on 12-12-27.
//  Copyright (c) 2012年 Mark. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HeroListViewController;
@class ArmListViewController;
@class MusicListViewController;
@class LogListViewController;

@interface MainViewController : UIViewController
{
    HeroListViewController   *heroViewController;
    ArmListViewController    *armViewController;
    MusicListViewController  *musicViewController;
    LogListViewController    *logViewController;
}

@property (nonatomic, retain) HeroListViewController   *heroViewController;
@property (nonatomic, retain) ArmListViewController     *armViewController;
@property (nonatomic, retain) MusicListViewController   *musicViewController;
@property (nonatomic, retain) LogListViewController     *logViewController;

@end
