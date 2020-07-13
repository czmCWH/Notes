//
//  ZMHitButton.m
//  06-UIButton扩大点击范围
//
//  Created by czm on 2019/10/18.
//  Copyright © 2019 czm. All rights reserved.
//

#import "ZMHitButton.h"

@implementation ZMHitButton

- (BOOL)pointInside:(CGPoint)point withEvent:(nullable UIEvent *)event {
    CGRect bounds = self.bounds;
    bounds.size.width += self.stretchW;
    bounds.origin.x -= self.stretchW*0.5;
    
    bounds.size.height += self.stretchH;
    bounds.origin.y -= self.stretchH*0.5;
    
    return CGRectContainsPoint(bounds, point);
}

@end
