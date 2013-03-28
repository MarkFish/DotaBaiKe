//
//  HeroListViewController.h
//  DotaBaiKe
//
//  Created by Mark on 13-2-6.
//  Copyright (c) 2013年 Mark. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HeroListViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    NSArray         *arrHotel;
    UITableView     *tabView;
}

@property (nonatomic, retain) NSArray       *arrHotel;
@property (nonatomic, retain) UITableView   *tabView;

@end
