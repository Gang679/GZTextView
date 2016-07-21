//
//  GZTextView.m
//  GZTextView
//
//  Created by xinshijie on 16/6/25.
//  Copyright © 2016年 Mr.quan. All rights reserved.
//

#import "GZTextView.h"
#define GZRGBCOLOR(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]

@implementation GZTextView

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        [self setPlaceholder:@"轻斟浅醉17"];/*可写可不写*/
        self.layer.cornerRadius = 10.0f;
        self.layer.borderWidth = 1;
        self.GZplaceholderColor = GZRGBCOLOR(0x89, 0x89, 0x89);
        self.editable = YES;
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(GZtextChanged:) name:UITextViewTextDidChangeNotification object:nil];
    }
    return self;
}

-(void)setPlaceholder:(NSString *)placeholder{
    
    if (_GZplaceholder != placeholder) {
        
        _GZplaceholder = placeholder;
        
        [self.GZplaceHolderLabel removeFromSuperview];
        
        self.GZplaceHolderLabel = nil;
        
        [self setNeedsDisplay];
        
        
    }
    
}

- (void)GZtextChanged:(NSNotification *)notification{
    
    if ([[self GZplaceholder] length] == 0) {
        return;
    }
    
    if ([[self text] length] == 0) {
        [[self viewWithTag:666] setAlpha:1.0];
    }
    
    else{
        
        [[self viewWithTag:666] setAlpha:0];
    }
    
}

-(void)drawRect:(CGRect)rect{
    
    [super drawRect:rect];
    
    if ([[self GZplaceholder] length] > 0) {
        if (_GZplaceHolderLabel == nil) {
            _GZplaceHolderLabel = [[UILabel alloc]initWithFrame:CGRectMake(8, 8, self.bounds.size.width - 16, 0)];
            _GZplaceHolderLabel.lineBreakMode = NSLineBreakByWordWrapping;
            _GZplaceHolderLabel.numberOfLines = 0;
            _GZplaceHolderLabel.font = self.font;
            _GZplaceHolderLabel.backgroundColor = [UIColor clearColor];
            _GZplaceHolderLabel.textColor = self.GZplaceholderColor;
            _GZplaceHolderLabel.alpha = 0;
            _GZplaceHolderLabel.tag = 666;
            [self addSubview:_GZplaceHolderLabel];
        }
        _GZplaceHolderLabel.text = self.GZplaceholder;
        [_GZplaceHolderLabel sizeToFit];
        [self sendSubviewToBack:_GZplaceHolderLabel];
    }
    
    if ([[self text] length] == 0 && [[self GZplaceholder] length] >0) {
        [[self viewWithTag:666] setAlpha:1.0];
    }
    
}

@end
