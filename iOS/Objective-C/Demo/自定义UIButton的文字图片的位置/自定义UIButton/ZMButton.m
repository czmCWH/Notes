//
//  ZMButton.m
//  自定义UIButton
//
//  Created by czm on 2019/10/29.
//  Copyright © 2019 czm. All rights reserved.
//

#import "ZMButton.h"

@implementation ZMButton

+ (ZMButton *)buttonWithLayout:(ZMButtonLayoutType)type frame:(CGRect)frame normalImg:(UIImage * _Nullable)norImg highlightImg:(UIImage *_Nullable)lightImg title:(NSString * _Nullable)title marginHV:(CGFloat)space {
    
    ZMButton *btn = [ZMButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:norImg forState:UIControlStateNormal];
    [btn setImage:lightImg forState:UIControlStateHighlighted];
    [btn setTitle:title forState:UIControlStateNormal];
    
    // button 的各个尺寸
    CGFloat marginHV = space;
    CGSize titleSize = btn.titleLabel.intrinsicContentSize;
    CGSize imgSize = btn.imageView.frame.size;
    CGSize btnSize = btn.frame.size;
    
    if (CGRectIsEmpty(frame)) {
        if (type == ZMButtonLayoutRight || type == ZMButtonLayoutLeft) {
            frame = CGRectMake(0, 0, titleSize.width + imgSize.width + space, 50);
        } else {
            frame = CGRectMake(0, 0, 100, titleSize.height + imgSize.height + space);
        }
    }
    
    UIEdgeInsets titleInsets = UIEdgeInsetsZero;
    UIEdgeInsets imgInsets = UIEdgeInsetsZero;
    
    switch (type) {
        case ZMButtonLayoutRight:
        {
            titleInsets = UIEdgeInsetsMake(0, -(titleSize.width + imgSize.width), 0, 0);
            imgInsets = UIEdgeInsetsMake(0, 0, 0, -(titleSize.width + imgSize.width + marginHV));
        }
            break;
        case ZMButtonLayoutTop:
        {
            CGFloat topBottomH = (btnSize.height - titleSize.height - imgSize.height - marginHV) * 0.5;
            titleInsets = UIEdgeInsetsMake(topBottomH,
                                        (btnSize.width - titleSize.width)/2.0 - imgSize.width,
                                        topBottomH + marginHV + imgSize.height,
                                        (btnSize.width - titleSize.width)/2.0);
            imgInsets = UIEdgeInsetsMake(topBottomH + marginHV + titleSize.height,
                                    (btnSize.width - imgSize.width)/2.0,
                                    topBottomH,
                                    (btnSize.width - imgSize.width)/2.0 - titleSize.width);
        }
            break;
        case ZMButtonLayoutBottom:
        {
            CGFloat topBottomH = (btnSize.height - titleSize.height - imgSize.height - marginHV) * 0.5;
            titleInsets = UIEdgeInsetsMake(topBottomH + titleSize.height + marginHV,
                                        (btnSize.width - titleSize.width)/2.0 - imgSize.width,
                                        topBottomH,
                                        (btnSize.width - titleSize.width)/2.0);
            imgInsets = UIEdgeInsetsMake(topBottomH,
                                        (btnSize.width - imgSize.width)/2.0,
                                        marginHV + topBottomH + titleSize.height,
                                        (btnSize.width - imgSize.width)/2.0 - titleSize.width);
        }
            break;
        default:
            break;
    }
    
    btn.titleEdgeInsets = titleInsets;
    btn.imageEdgeInsets = imgInsets;
    return btn;
}

@end
