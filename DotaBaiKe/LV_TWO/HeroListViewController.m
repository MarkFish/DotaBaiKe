//
//  HeroListViewController.m
//  DotaBaiKe
//
//  Created by Mark on 13-2-6.
//  Copyright (c) 2013年 Mark. All rights reserved.
//

#import "HeroListViewController.h"

@interface HeroListViewController ()

- (void)btnNavLeftClick:(id)sender;
- (void)initData;
- (void)loadMainView;

@end

@implementation HeroListViewController

@synthesize arrHotel;
@synthesize tabView;

- (void)dealloc
{
    [arrHotel release];
    [tabView release];
    
    [super dealloc];
}// dealloc

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        [self setTitle:@"英雄资料"];
        [self initData];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor blackColor]];
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
}// btnNavLeftClick:

- (void)initData
{
    NSString *strPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"hotel.plist"];
    arrHotel = [[NSArray alloc] initWithContentsOfFile:strPath];
    
    return;
}// initData

- (void)loadMainView
{
    tabView = [[UITableView alloc] initWithFrame:CGRectMake(0.0f,
                                                            0.0f,
                                                            self.view.bounds.size.width,
                                                            self.view.bounds.size.height-44.0f)
                                           style:UITableViewStylePlain];
    [tabView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [tabView setBackgroundColor:[UIColor clearColor]];
    [tabView setDataSource:self];
    [tabView setDelegate:self];
    [self.view addSubview:tabView];
    
    return;
}// loadMainView

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrHotel.count;
}// tableView:numberOfRowsInSection:

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"aCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    [cell.textLabel setTextColor:[UIColor whiteColor]];
    [cell.textLabel setText:[arrHotel objectAtIndex:indexPath.row]];
    
    return cell;
}// tableView:cellForRowAtIndexPath:

#pragma mark -
#pragma mark UITableViewDelegate



@end
