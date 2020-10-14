//
//  MyScalar.h
//  test
//
//  Created by czm on 2020/10/10.
//  Copyright © 2020 czm. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef struct {
    float x, y, z;
} ThreePoint;

@interface MyScalar : NSObject

@property (nonatomic, assign)float num;
@property (nonatomic, assign)BOOL result;
@property (nonatomic, assign)CGPoint point;
@property (nonatomic, strong)NSNumber *count;
@property (nonatomic, assign)int total;
@property (nonatomic, assign)ThreePoint threePt;

@end

NS_ASSUME_NONNULL_END
