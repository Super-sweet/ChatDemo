//
//  MessageCell.m
//  WeCat
//
//  Created by  唐忠政 on 16/7/16.
//  Copyright © 2016年  唐忠政. All rights reserved.
//

#import "MessageCell.h"

#define kScreenW [UIScreen mainScreen].bounds.size.width

@interface MessageCell()
{
    UIImageView *_imageView;
    UILabel *_label;
    UIImageView *_BgView;
}

@end

@implementation MessageCell

- (void)awakeFromNib {
    // Initialization code
}

-(instancetype)init {
    self = [super init];
    [self createUI];
    return self;
    
}

-(void)createUI {
    
}

-(void)setMessage:(Message *)message  {
    _message = message;
    _imageView = [[UIImageView alloc] init];
    _BgView = [[UIImageView alloc] init];
    _label = [[UILabel alloc] init];
    _label.frame = CGRectZero;
    _label.backgroundColor = [UIColor clearColor];
//    [_label sizeToFit];
    
    _label.numberOfLines = 0;
    _label.text = message.content;
    _label.textAlignment = NSTextAlignmentLeft;
    _label.font = [UIFont systemFontOfSize:_message.contentFontSize];

    
    NSString *str = _message.icon;
//    NSLog(@"调用了该方法");
    NSLog(@"%@",str);
    if ([str isEqualToString:@"icon01.jpg"]) {
        _imageView.frame = CGRectMake(kScreenW-20-50+10, 20, 50, 50);
//        _BgView.frame = CGRectMake(kScreenW-20-50-200, 20, message.frame.size.width,message.frame.size.height+35);
        _BgView.image = [UIImage imageNamed:@"chatto_bg_normal"];
        _BgView.image = [_BgView.image stretchableImageWithLeftCapWidth:31 topCapHeight:31];
        _BgView.frame = CGRectMake(kScreenW-kHeadImageSize-kEdgeSize*2-_message.frame.size.width-35, kEdgeSize+10, _message.frame.size.width+35, _message.frame.size.height+25);
        
        //3) 设置messageLabel的frame
        _label.frame = CGRectMake(kScreenW-kHeadImageSize-kEdgeSize*2-_message.frame.size.width-20, kEdgeSize*2+10, _message.frame.size.width, _message.frame.size.height);
    }else if([str isEqualToString:@"icon02.jpg"]){
        _imageView.frame = CGRectMake(10, 20, 50, 50);
        _BgView.frame = CGRectMake(70, 20, message.frame.size.width+40, message.frame.size.height+35);
        _BgView.image = [UIImage imageNamed:@"chatfrom_bg_normal"];
        _BgView.image = [_BgView.image stretchableImageWithLeftCapWidth:30 topCapHeight:30];
        _BgView.frame = CGRectMake(kHeadImageSize+kEdgeSize*2, kEdgeSize+10, _message.frame.size.width+35, _message.frame.size.height+25);
        
        //6) 设置messageLabel的frame
        _label.frame = CGRectMake(kHeadImageSize+kEdgeSize*2+20, kEdgeSize*2+10, _message.frame.size.width, _message.frame.size.height);
    }
    _imageView.image = [UIImage imageNamed:str];
    [self.contentView addSubview:_imageView];
    [self.contentView addSubview:_BgView];
    [self.contentView addSubview:_label];
    [self setNeedsLayout];
//    [self.contentView addSubview:_btn];
}

//-(void)layoutSubviews {
//    [super layoutSubviews];
//    _imageView = [[UIImageView alloc] init];
//    BOOL isSelf = _message.isSelf;
//    NSLog(@"调用了该方法");
//    if (isSelf) {
//        _imageView.frame = CGRectMake(kScreenW-20-50, 20, 50, 50);
//        [self setNeedsLayout];
//    }else if(!isSelf){
//        _imageView.frame = CGRectMake(20, 20, 50, 50);
//        [self setNeedsLayout];
//    }
//    [self.contentView addSubview:_imageView];
//    _imageView.image = [UIImage imageNamed:_message.icon];
//}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
