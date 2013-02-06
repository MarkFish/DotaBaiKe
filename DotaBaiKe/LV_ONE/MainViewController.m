//
//  MainViewController.m
//  DotaBaiKe
//
//  Created by Mark on 12-12-27.
//  Copyright (c) 2012年 Mark. All rights reserved.
//

#import "MainViewController.h"
#import "HeroListViewController.h"
#import "ArmListViewController.h"
#import "MusicListViewController.h"
#import "LogListViewController.h"

@interface MainViewController ()

- (void)loadMainView;
- (void)btnItemClickEvent:(id)sender;
- (void)btnInfoClickEvent:(id)sender;

@end

@implementation MainViewController

@synthesize heroViewController;
@synthesize armViewController;
@synthesize musicViewController;
@synthesize logViewController;

- (void)dealloc
{
    [heroViewController release];
    [armViewController release];
    [musicViewController release];
    [logViewController release];
    
    [super dealloc];
}// dealloc

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
    // Load the main view
    [self loadMainView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark Private Methods

- (void)loadMainView
{
    // Part one background view
    UIImage *imgBK_P1 = [UIImage imageNamed:@"main_back"];
    UIImageView *imgViewBK_P1 = [[UIImageView alloc] initWithImage:imgBK_P1];
    CGRect rect_P1 = CGRectMake(0.0f, 0.0f, imgBK_P1.size.width, imgBK_P1.size.height);
    [imgViewBK_P1 setFrame:rect_P1];
    [self.view addSubview:imgViewBK_P1];
    [imgViewBK_P1 release];
    // Part three background view -- logo view
    UIImage *imgBK_P3 = [UIImage imageNamed:@"dotaer_logo"];
    UIImageView *imgViewBK_P3 = [[UIImageView alloc] initWithImage:imgBK_P3];
    float fHeight = self.view.bounds.size.height-44.0f;
    CGRect rect_P3 = CGRectMake(0.0f, fHeight-imgBK_P3.size.height, imgBK_P3.size.width, imgBK_P3.size.height);
    [imgViewBK_P3 setFrame:rect_P3];
    UILabel *lbMark = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 20.0f)];
    [lbMark setBackgroundColor:[UIColor clearColor]];
    [lbMark setText:MarkName];
    float fontTMP = 13.0f;
    [lbMark setMinimumFontSize:fontTMP];
    [lbMark setFont:[UIFont systemFontOfSize:fontTMP]];
    [lbMark setTextAlignment:NSTextAlignmentRight];
    [lbMark setTextColor:[UIColor whiteColor]];
    [lbMark setCenter:CGPointMake(lbMark.center.x, imgViewBK_P3.frame.size.height-lbMark.frame.size.height/2)];
    [imgViewBK_P3 addSubview:lbMark];
    [lbMark release];
    [self.view addSubview:imgViewBK_P3];
    [imgViewBK_P3 release];
    // Part two background view
    UIImage *imgBK_P2 = [UIImage imageNamed:@"back_lines"];
    UIImageView *imgViewBK_P2 = [[UIImageView alloc] initWithImage:imgBK_P2];
    CGRect rect_P2 = CGRectMake(0.0f, rect_P1.size.height, imgBK_P2.size.width, fHeight-imgBK_P3.size.height-imgBK_P1.size.height);
    [imgViewBK_P2 setFrame:rect_P2];
    [self.view addSubview:imgViewBK_P2];
    [self.view bringSubviewToFront:imgViewBK_P2];
    [imgViewBK_P2 release];
    // Item buttons
    NSArray *arrItems = [[NSArray alloc] initWithObjects:@"英雄资料", @"装备合成", @"音效汇总", @"改动日志", nil];
    UIImage *imgBtn = [[UIImage imageNamed:@"btn_item"] stretchableImageWithLeftCapWidth:388 topCapHeight:23];
    for (int i = 0; i < 4; i++)
    {
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(60.0f, rect_P1.size.height+(40+10.0)*i, 200.0f, 40.0f)];
        [btn setBackgroundImage:imgBtn forState:UIControlStateNormal];
        [btn.titleLabel setFont:[UIFont systemFontOfSize:15.0f]];
        [btn setTitle:[arrItems objectAtIndex:i] forState:UIControlStateNormal];
        [btn setShowsTouchWhenHighlighted:YES];
        [btn setTag:i+1];
        [btn addTarget:self action:@selector(btnItemClickEvent:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        [btn release];
    }
    [arrItems release];
    // Map version information
    UILabel  *lbVersion = [[UILabel alloc] initWithFrame:CGRectMake(60.0f, 330.0f, 200.0f, 20.0f)];
    [lbVersion setBackgroundColor:[UIColor clearColor]];
    [lbVersion setTextAlignment:NSTextAlignmentRight];
    [lbVersion setFont:[UIFont systemFontOfSize:13.0f]];
    [lbVersion setTextColor:[UIColor whiteColor]];
    NSString *strInfo = [NSString stringWithFormat:@"DotA版本:%@", MAP_VERSION];
    [lbVersion setText:strInfo];
    [self.view addSubview:lbVersion];
    [lbVersion release];
    // Infomation button
    UIButton *btnInfo = [UIButton buttonWithType:UIButtonTypeInfoLight];
    [btnInfo setCenter:CGPointMake(280.0f, 340.0f)];
    [btnInfo addTarget:self action:@selector(btnItemClickEvent:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnInfo];
    
    return;
}// loadMainView

- (void)btnItemClickEvent:(id)sender
{
    NSLog(@"Item button clicked!");
    UIButton *btn = (UIButton *)sender;
    switch (btn.tag)
    {
        // Hero list
        case 1:
        {
            if (heroViewController == nil)
            {
                heroViewController = [[HeroListViewController alloc] init];
            }
            [self.navigationController pushViewController:heroViewController animated:YES];
            
            break;
        }
        // Arm list
        case 2:
        {
            if (armViewController == nil)
            {
                armViewController = [[ArmListViewController alloc] init];
            }
            [self.navigationController pushViewController:armViewController animated:YES];
            
            break;
        }
        // Music list
        case 3:
        {
            if (musicViewController == nil)
            {
                musicViewController = [[MusicListViewController alloc] init];
            }
            [self.navigationController pushViewController:musicViewController animated:YES];
            
            break;
        }
        // Log list
        case 4:
        {
            if (logViewController == nil)
            {
                logViewController = [[LogListViewController alloc] init];
            }
            [self.navigationController pushViewController:logViewController animated:YES];
            
            break;
        }
        default:
            break;
    }
    
    return;
}// btnItemClickEvent:

- (void)btnInfoClickEvent:(id)sender
{
    NSLog(@"Info button clicked!");
    
    
    return;
}// btnInfoClickEvent:

@end
