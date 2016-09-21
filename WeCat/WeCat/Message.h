//
//  Message.h
//  WeCat
//
//  Created by  唐忠政 on 16/7/16.
//  Copyright © 2016年  唐忠政. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Message : NSObject

@property(nonatomic,strong)NSMutableDictionary *dic;

@property(nonatomic,copy)NSString *content;

@property(nonatomic,copy)NSString *icon;

@property(nonatomic,copy)NSString *time;

@property(nonatomic,copy)NSString *isSelf;

@property(nonatomic,assign,readonly)CGRect frame;

@property(nonatomic,assign,readonly)CGFloat contentFontSize;

@end
