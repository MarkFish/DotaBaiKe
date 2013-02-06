//
//  LogListViewController.m
//  DotaBaiKe
//
//  Created by Mark on 13-2-6.
//  Copyright (c) 2013年 Mark. All rights reserved.
//

#import "LogListViewController.h"

@interface LogListViewController ()

- (void)btnNavLeftClick:(id)sender;
- (void)loadMainView;
    
@end

@implementation LogListViewController

@synthesize tabView;

- (void)dealloc
{
    [tabView release];
    
    [super dealloc];
}// dealloc

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        [self setTitle:@"日志改动"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Navigation bar left button
    UIButton *btnLeft = [[UIButton alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 54.0f, 30.0f)];
    [btnLeft setBackgroundImage:[UIImage imageNamed:@"nav_left"] forState:UIControlStateNormal];
    [btnLeft setBackgroundImage:[UIImage imageNamed:@"nav_left_press"] forState:UIControlStateHighlighted];
    [btnLeft setTitle:@"返回" forState:UIControlStateNormal];
    [btnLeft.titleLabel setFont:[UIFont boldSystemFontOfSize:15.0f]];
    [btnLeft setTitleEdgeInsets:UIEdgeInsetsMake(0.0f, 5.0f, 0.0f, 0.0f)];
    [btnLeft addTarget:self action:@selector(btnNavLeftClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barItemLeft = [[UIBarButtonItem alloc] initWithCustomView:btnLeft];
    [btnLeft release];
    [self.navigationItem setLeftBarButtonItem:barItemLeft];
    [barItemLeft release];
    // Load main view
    [self loadMainView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark Private Methods

- (void)btnNavLeftClick:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
    
    return;
}// btnNavLeftClick

- (void)loadMainView
{
    tabView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    [tabView setDataSource:self];
    [tabView setDelegate:self];
    [self.view addSubview:tabView];
    
    return;
}// loadMainView

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}// tableView:numberOfRowsInSection:

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"aCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    return cell;
}// tableView:cellForRowAtIndexPath:

#pragma mark -
#pragma mark UITableViewDelegate



@end
