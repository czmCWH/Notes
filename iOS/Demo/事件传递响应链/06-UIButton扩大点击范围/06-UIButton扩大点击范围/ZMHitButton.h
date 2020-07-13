//
//  ZMHitButton.h
//  06-UIButton扩大点击范围
//
//  Created by czm on 2019/10/18.
//  Copyright © 2019 czm. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZMHitButton : UIButton

@property (nonatomic, assign)CGFloat stretchW;      /** 延展的宽度(左右) <*/
@property (nonatomic, assign)CGFloat stretchH;      /** 延展的高度(上下) <*/
@end

NS_ASSUME_NONNULL_END
