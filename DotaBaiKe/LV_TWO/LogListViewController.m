//
//  LogListViewController.m
//  DotaBaiKe
//
//  Created by Mark on 13-2-6.
//  Copyright (c) 2013年 Mark. All rights reserved.
//

#import "LogListViewController.h"
#import "LogDetailViewController.h"

@interface LogListViewController ()

- (void)btnNavLeftClick:(id)sender;
- (void)loadMainView;
- (void)initData;
    
@end

@implementation LogListViewController

@synthesize dicData;
@synthesize tabView;

- (void)dealloc
{
    [dicData release];
    [tabView release];
    
    [super dealloc];
}// dealloc

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        [self setTitle:@"日志改动"];
        [self initData];
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

- (void)initData
{
    if (dicData == nil)
    {
        NSString *strPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"logdata.plist"];
        dicData = [[NSDictionary alloc] initWithContentsOfFile:strPath];
    }
    
    return;
}// initData

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return dicData.count;
}// numberOfSectionsInTableView:

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *arrVers = [dicData allKeys];
    
    return [[dicData objectForKey:[arrVers objectAtIndex:section]] count];
    
}// tableView:numberOfRowsInSection:

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSArray *arrVers = [dicData allKeys];
    
    return [NSString stringWithFormat:@"%@系列", [arrVers objectAtIndex:section]];
}// tableView:titleForHeaderInSection:

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"aCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        [cell.textLabel setFont:[UIFont systemFontOfSize:15.0f]];
        [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    }
    NSArray *arrTMP = [dicData objectForKey:[[dicData allKeys] objectAtIndex:indexPath.section]];
    NSDictionary *dicTMP = [arrTMP objectAtIndex:indexPath.row];
    [cell.textLabel setText:[dicTMP objectForKey:@"subversion"]];
    
    return cell;
}// tableView:cellForRowAtIndexPath:

#pragma mark -
#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSArray *arrTMP = [dicData objectForKey:[[dicData allKeys] objectAtIndex:indexPath.section]];
    NSDictionary *dicTMP = [arrTMP objectAtIndex:indexPath.row];
    LogDetailViewController *detailViewController = [[[LogDetailViewController alloc] initWithInfo:dicTMP] autorelease];
    [self.navigationController pushViewController:detailViewController animated:YES];
    
    return;
}// tableView:didSelectRowAtIndexPath:

@end
