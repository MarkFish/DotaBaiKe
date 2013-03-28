//
//  MusicListViewController.m
//  DotaBaiKe
//
//  Created by Mark on 13-2-6.
//  Copyright (c) 2013年 Mark. All rights reserved.
//

#import "MusicListViewController.h"

@interface MusicListViewController ()

- (void)btnNavLeftClick:(id)sender;
- (void)loadMainView;
- (void)initData;
- (void)playMusic:(NSString *)strPath;

@end

@implementation MusicListViewController

@synthesize arrData;
@synthesize tabView;
@synthesize musicPlayer;

- (void)dealloc
{
    [arrData release];
    [tabView release];
    [musicPlayer release];
    
    [super dealloc];
}// dealloc

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        [self setTitle:@"音效汇总"];
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
    CGRect tabRect = self.view.bounds;
    tabRect.size.height -= 44.0f;
    tabView = [[UITableView alloc] initWithFrame:tabRect style:UITableViewStyleGrouped];
    [tabView setDataSource:self];
    [tabView setDelegate:self];
    [tabView setRowHeight:60.0f];
    [self.view addSubview:tabView];
    
    return;
}// loadMainView

- (void)initData
{
    if (arrData == nil)
    {
        NSString *strPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"music.plist"];
        arrData = [[NSArray alloc] initWithContentsOfFile:strPath];
    }
    
    return;
}// initData

- (void)playMusic:(NSString *)strPath
{
    if (self.musicPlayer != nil)
    {
        if (self.musicPlayer.isPlaying == YES)
        {
            [self.musicPlayer stop];
        }
        [self.musicPlayer release];
    }
    NSURL *pathURL = [NSURL URLWithString:strPath];
    musicPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:pathURL error:nil];
    [self.musicPlayer setVolume:1.0];
    [self.musicPlayer prepareToPlay];
    [self.musicPlayer setNumberOfLoops:0];
    [self.musicPlayer play];
    
    return;
}// playMusic:

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    [self initData];
    
    return arrData.count;
}// tableView:numberOfRowsInSection:

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"aCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
        [cell.textLabel setFont:[UIFont systemFontOfSize:13.0]];
        [cell.detailTextLabel setNumberOfLines:0];
        UIImageView *accView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 40, 40)];
        [accView setImage:[UIImage imageNamed:@"music_play"]];
        [cell setAccessoryView:accView];
        [accView release];
    }
    NSDictionary *dicTMP = [arrData objectAtIndex:indexPath.row];
    [cell.textLabel setText:[dicTMP objectForKey:@"title"]];
    [cell.detailTextLabel setText:[dicTMP objectForKey:@"description"]];
    [cell.detailTextLabel sizeToFit];
    
    return cell;
}// tableView:cellForRowAtIndexPath:

#pragma mark -
#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSDictionary *dicTMP = [arrData objectAtIndex:indexPath.row];
    NSString *strFilePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:[dicTMP objectForKey:@"file"]];
    [self playMusic:strFilePath];
    
    return;
}// tableView:didSelectedRowAtIndexPath:

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"Play button clicked!");
    
    return;
}// tableView:accessoryButtonTappedForRowWithIndexPath:

@end
