//
//  MusicListViewController.h
//  DotaBaiKe
//
//  Created by Mark on 13-2-6.
//  Copyright (c) 2013年 Mark. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface MusicListViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
{
    NSArray         *arrData;
    UITableView     *tabView;
    AVAudioPlayer   *musicPlayer;
}

@property (nonatomic, retain) NSArray       *arrData;
@property (nonatomic, retain) UITableView   *tabView;
@property (nonatomic, retain) AVAudioPlayer *musicPlayer;

@end
