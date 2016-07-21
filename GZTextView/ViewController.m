//
//  ViewController.m
//  GZTextView
//
//  Created by xinshijie on 16/7/12.
//  Copyright © 2016年 Mr.quan. All rights reserved.
//

#import "ViewController.h"
#import "GZTextView.h"
#define GZScreenWidth [UIScreen mainScreen].bounds.size.width

@interface ViewController ()<UITextViewDelegate>

@property(strong, nonatomic)GZTextView * textView;
@property(strong, nonatomic)UILabel * numLabel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *la = [[UILabel alloc]initWithFrame:CGRectMake(GZScreenWidth * 0.3, 20, GZScreenWidth * 0.4, 44)];
    [self.view addSubview:la];
    la.text = @"刚子TextViewDemo";
    _textView = [[GZTextView alloc]initWithFrame:CGRectMake(20, 100, GZScreenWidth - 40, 150)];
    _textView.backgroundColor = [UIColor whiteColor];
    _textView.delegate = self;
    _textView.font = [UIFont systemFontOfSize:14.f];
    _textView.textColor = [UIColor blackColor];
    _textView.textAlignment = NSTextAlignmentLeft;
    _textView.GZplaceholder = @"请输入少于30字的介绍";
    [self.view addSubview:_textView];
    
    UILabel *GZLab = [[UILabel alloc]initWithFrame:CGRectMake(GZScreenWidth * 0.1, _textView.frame.origin.y + 170, GZScreenWidth * 0.8, 150)];
    GZLab.numberOfLines = 0 ;
    GZLab.textColor = [UIColor orangeColor];
    [self.view addSubview:GZLab];
    GZLab.text = @"新浪微博：轻斟浅醉17\n\ngithub：https://github.com/Gang679 \n\n简书:http://www.jianshu.com/users/ab83189244d9/latest_articles";
    
    
    _numLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_textView.frame)-90, CGRectGetMaxY(_textView.frame)+6, 80, 21)];
    _numLabel.textAlignment = NSTextAlignmentRight;
    _numLabel.text = @"30";
    _numLabel.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_numLabel];
    
}

#pragma mark textField的字数限制

//在这个地方计算输入的字数
- (void)textViewDidChange:(UITextView *)textView
{
    NSInteger wordCount = textView.text.length;
    self.numLabel.text = [NSString stringWithFormat:@"%ld/30",(long)wordCount];
    [self wordLimit:textView];
}

#pragma mark 超过30字不能输入
-(BOOL)wordLimit:(UITextView *)text{
    if (text.text.length < 30) {
        NSLog(@"%ld",text.text.length);
        self.textView.editable = YES;
    }
    else{
        self.textView.editable = NO;
        
    }
    return nil;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
