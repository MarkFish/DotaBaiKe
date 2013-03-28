//
//  LogDetailViewController.h
//  DotaBaiKe
//
//  Created by Mark on 13-2-7.
//  Copyright (c) 2013年 Mark. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LogDetailViewController : UIViewController
{
    NSDictionary *dicINFO;
    UIScrollView *sclView;
    UITextView   *txtHero;
    UITextView   *txtArticle;
    UITextView   *txtGame;
}

@property (nonatomic, retain) NSDictionary *dicINFO;
@property (nonatomic, retain) UIScrollView *sclView;
@property (nonatomic, retain) UITextView   *txtHero;
@property (nonatomic, retain) UITextView   *txtArticle;
@property (nonatomic, retain) UITextView   *txtGame;

#pragma mark -
#pragma mark Custom Methods

- (id)initWithInfo:(NSDictionary *)dicInfo;

@end
