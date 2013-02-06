//
//  LogListViewController.h
//  DotaBaiKe
//
//  Created by Mark on 13-2-6.
//  Copyright (c) 2013年 Mark. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LogListViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    UITableView     *tabView;
}

@property (nonatomic, retain) UITableView   *tabView;

@end
