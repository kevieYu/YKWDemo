//
//  ViewController.m
//  Demo
//
//  Created by 于凯文 on 15/6/22.
//  Copyright (c) 2015年 于凯文. All rights reserved.
//

#import "ViewController.h"
#import <AVOSCloud/AVOSCloud.h>
#import <AVFoundation/AVFoundation.h>
#import "AFSoundManager.h"

@interface ViewController ()
@property(nonatomic,strong)AVAudioPlayer *audioPlayer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
//    AVObject *testObject = [AVObject objectWithClassName:@"TestObject"];
//    [testObject setObject:@"bar" forKey:@"foo"];
//    [testObject save];
    
    AVQuery *query = [AVQuery queryWithClassName:@"Music"];
    AVObject *data= [query getObjectWithId:@"5587c808e4b096d588dabe2d"];
    
    NSString *url = [data objectForKey:@"musicURL"];
    NSURL *u =[NSURL URLWithString:url];
    
  
    
    
    
    NSLog(@"%@",url);
    
    [[AFSoundManager sharedManager] startStreamingRemoteAudioFromURL:url andBlock:^(int percentage, CGFloat elapsedTime, CGFloat timeRemaining, NSError *error, BOOL finished) {
        
        if (!error) {
            
            NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
            [formatter setDateFormat:@"mm:ss"];
            
            NSDate *elapsedTimeDate = [NSDate dateWithTimeIntervalSince1970:elapsedTime];
            
            
            NSDate *timeRemainingDate = [NSDate dateWithTimeIntervalSince1970:timeRemaining];
            
            
            
            NSLog(@"%i percent played",percentage);
            
        } else {
            
            NSLog(@"There has been an error playing the remote file: %@", [error description]);
        }
        
    }];
    

    


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
