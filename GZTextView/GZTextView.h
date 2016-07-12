//
//  GZTextView.h
//  GZTextView
//
//  Created by xinshijie on 16/6/25.
//  Copyright © 2016年 Mr.quan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GZTextView : UITextView

@property (nonatomic, strong) UILabel * GZplaceHolderLabel;

@property (nonatomic, copy) NSString * GZplaceholder;

@property (nonatomic, strong) UIColor * GZplaceholderColor;


/**
 *  检测当输入时改变字体颜色
 *
 *  @param notification 监测
 */
- (void)GZtextChanged:(NSNotification * )notification;

@end
