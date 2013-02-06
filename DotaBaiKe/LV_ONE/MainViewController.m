//
//  MainViewController.m
//  DotaBaiKe
//
//  Created by Mark on 12-12-27.
//  Copyright (c) 2012年 Mark. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        [self setTitle:@"刀塔百科"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // 设置导航栏背景
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"header_nav_bg.png"]
                                                  forBarMetrics:UIBarMetricsDefault];
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
