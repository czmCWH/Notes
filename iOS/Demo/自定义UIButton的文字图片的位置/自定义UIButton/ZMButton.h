//
//  ZMButton.h
//  自定义UIButton
//
//  Created by czm on 2019/10/29.
//  Copyright © 2019 czm. All rights reserved.
//

/*

1、在UIButton中，图片在左，文字在右边
   图片的上、下、左约束是相对于UIButton的，而右是相对于文字的：
   文字的上、下、右约束是相对于UIButton的，而左是相对于图片的：

2、UIButton中图片和文字的边界约束
   btn.titleEdgeInsets
   btn.imageEdgeInsets
 
3、UIControl 的内容水平垂直方向对齐方式
    btn.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
 
 参考博客：http://zhangzr.cn/2017/10/15/UIButton%E5%AE%9E%E7%8E%B0%E5%9B%BE%E7%89%87%E5%92%8C%E6%96%87%E5%AD%97%E8%87%AA%E5%AE%9A%E4%B9%89%E6%8E%92%E5%88%97/#more
 
*/

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    ZMButtonLayoutLeft,     // 系统默认类型：图片在右边，文字在左边
    ZMButtonLayoutRight,
    ZMButtonLayoutTop,      // 文字在上，图片在下
    ZMButtonLayoutBottom
} ZMButtonLayoutType;

@interface ZMButton : UIButton

/// 创建一个自定义图片、文字位置的按钮
/// @param type 图片、文字布局类型
/// @param frame 此类型button必须给定button的size
/// @param norImg 正常状态图片
/// @param lightImg 高亮状态图片
/// @param title 文字
/// @param space 图片与文字之间的间距
+ (ZMButton *)buttonWithLayout:(ZMButtonLayoutType)type frame:(CGRect)frame normalImg:(UIImage * _Nullable)norImg highlightImg:(UIImage *_Nullable)lightImg title:(NSString * _Nullable)title marginHV:(CGFloat)space;

@end

NS_ASSUME_NONNULL_END
