//
//  UIButton+Extension.h
//  工具类的使用
//
//  Created by czm on 2019/11/7.
//  Copyright © 2019 czm. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (Extension)

//设置button响应区域大小(小于此区域则放大，否则保持原大小不变，不赋值保持原大小不变，center相同)
- (void)setMinEventTouchSize:(CGSize)minSize;

@end

NS_ASSUME_NONNULL_END
