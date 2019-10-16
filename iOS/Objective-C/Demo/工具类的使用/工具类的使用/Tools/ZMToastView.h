//
//  ZMToastView.h
//  工具类的使用
//
//  Created by czm on 2019/10/15.
//  Copyright © 2019 czm. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZMToastView : UIView


+ (void)showWithTitle:(NSString *)title;

+ (void)dismiss;

@end

NS_ASSUME_NONNULL_END
