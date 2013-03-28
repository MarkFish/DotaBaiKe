//
//  LogDetailViewController.m
//  DotaBaiKe
//
//  Created by Mark on 13-2-7.
//  Copyright (c) 2013年 Mark. All rights reserved.
//

#import "LogDetailViewController.h"

@interface LogDetailViewController ()

- (void)btnNavLeftClick:(id)sender;
- (void)loadMainView;
- (void)segmentChanged:(id)sender;

@end

@implementation LogDetailViewController

@synthesize dicINFO;
@synthesize sclView;
@synthesize txtHero;
@synthesize txtArticle;
@synthesize txtGame;

- (void)dealloc
{
    [dicINFO release];
    [sclView release];
    [txtHero release];
    [txtArticle release];
    [txtGame release];
    
    [super dealloc];
}// dealloc

// Ignore this method
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor scrollViewTexturedBackgroundColor]];
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
#pragma mark Custom Methods

- (id)initWithInfo:(NSDictionary *)dicInfo
{
    self = [super initWithNibName:nil bundle:nil];
    if (self)
    {
        [self setDicINFO:dicInfo];
        [self setTitle:[NSString stringWithFormat:@"%@改动记录", [dicINFO objectForKey:@"subversion"]]];
    }
    
    return self;
}// initWithInfo

#pragma mark -
#pragma mark Private Methods

- (void)btnNavLeftClick:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
    
    return;
}// btnNavLeftClick:

- (void)loadMainView
{
    // Header view
    NSArray   *arrItems = [[NSArray alloc] initWithObjects:@"英雄改动", @"物品改动", @"游戏性改动", nil];
    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0.0f, 0.0f, self.view.bounds.size.width, 49.0f)];
    UISegmentedControl *segControl = [[UISegmentedControl alloc] initWithItems:arrItems];
    [segControl setFrame:CGRectMake(10.0f, 0.0f, 300.0f, 30.0f)];
    [segControl setSegmentedControlStyle:UISegmentedControlStyleBar];
    [segControl setCenter:toolBar.center];
    [segControl setSelectedSegmentIndex:0];
    [segControl addTarget:self action:@selector(segmentChanged:) forControlEvents:UIControlEventValueChanged];
    [toolBar addSubview:segControl];
    [segControl release];
    [self.view addSubview:toolBar];
    float fSH = toolBar.frame.size.height;
    [toolBar release];
    // Content view
    sclView = [[UIScrollView alloc] initWithFrame:CGRectMake(0.0f,
                                                             fSH,
                                                             self.view.bounds.size.width,
                                                             self.view.bounds.size.height-fSH-44)];
    [sclView setContentSize:CGSizeMake(self.view.bounds.size.width*3, sclView.frame.size.height)];
    [sclView setBackgroundColor:[UIColor scrollViewTexturedBackgroundColor]];
    [sclView setPagingEnabled:NO];
    [sclView setScrollEnabled:NO];
    UIFont *txtFont = [UIFont systemFontOfSize:15.0f];
    txtHero = [[UITextView alloc] initWithFrame:CGRectMake(0.0f,
                                                           0.0f,
                                                           self.view.bounds.size.width,
                                                           self.view.bounds.size.height-fSH-44)];
    NSString *strPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:[dicINFO objectForKey:@"hero"]];
    NSString *strData = [NSString stringWithContentsOfFile:strPath encoding:NSUTF8StringEncoding error:nil];
    [txtHero setText:strData];
    [txtHero setEditable:NO];
    [txtHero setFont:txtFont];
    [sclView addSubview:txtHero];
    
    CGRect artRect = txtHero.frame;
    artRect.origin.x += sclView.frame.size.width;
    txtArticle = [[UITextView alloc] initWithFrame:artRect];
    [txtArticle setEditable:NO];
    [txtArticle setFont:txtFont];
    [sclView addSubview:txtArticle];
    
    artRect.origin.x += sclView.frame.size.width;
    txtGame = [[UITextView alloc] initWithFrame:artRect];
    [txtGame setEditable:NO];
    [txtGame setFont:txtFont];
    [sclView addSubview:txtGame];
    
    [self.view addSubview:sclView];
    
    return;
}// loadMainView

- (void)segmentChanged:(id)sender
{
    NSLog(@"Segment changed!");
    UISegmentedControl *segControl = (id)sender;
    switch (segControl.selectedSegmentIndex)
    {
        // Hero log
        case 0:
        {
            [sclView setContentOffset:CGPointMake(0.0f, sclView.contentOffset.y) animated:NO];
            break;
        }
        // Article log
        case 1:
        {
            if (txtArticle.text.length < 1)
            {
                NSLog(@"First Article Data");
                NSString *strPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:[dicINFO objectForKey:@"article"]];
                NSString *strData = [NSString stringWithContentsOfFile:strPath encoding:NSUTF8StringEncoding error:nil];
                [txtArticle setText:strData];
            }
            [sclView setContentOffset:CGPointMake(sclView.frame.size.width, sclView.contentOffset.y) animated:NO];
            
            break;
        }
        // Game log
        case 2:
        {
            if (txtGame.text.length < 1)
            {
                NSLog(@"First Game Data");
                NSString *strPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:[dicINFO objectForKey:@"game"]];
                NSString *strData = [NSString stringWithContentsOfFile:strPath encoding:NSUTF8StringEncoding error:nil];
                [txtGame setText:strData];
            }
            [sclView setContentOffset:CGPointMake(sclView.frame.size.width*2, sclView.contentOffset.y) animated:NO];
            
            break;
        }
        default:
            break;
    }
    
    return;
}// segmentChanged:

@end
