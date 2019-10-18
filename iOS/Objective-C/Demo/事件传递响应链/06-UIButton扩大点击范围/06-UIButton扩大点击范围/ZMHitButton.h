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

@property (nonatomic, assign)CGFloat stretchW;      /** 宽度点击延展的值 <*/
@property (nonatomic, assign)CGFloat stretchH;      /** 高度点击延展的值 <*/
@end

NS_ASSUME_NONNULL_END
