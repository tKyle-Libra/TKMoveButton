//
//  TKMoveButton.m
//  TKMoveButton
//
//  Created by 同乐 on 16/6/28.
//  Copyright © 2016年 tKyle. All rights reserved.
//

#import "TKMoveButton.h"

@interface TKMoveButton()

/**
 *  触摸点和中心点x方向移动的距离
 */

@property (assign , nonatomic) CGFloat xDistance;
/**
 *  触摸点和中心点y方向移动的距离
 */
@property (assign , nonatomic) CGFloat yDistance;

/**
 *  是否触摸
 */
@property (assign , nonatomic) BOOL isDrag;

@end


@implementation TKMoveButton

/**
 *  手指按下开始触摸
 */
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    /**
     *  获得触摸在按钮的父视图中的坐标
     */
    UITouch *touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:self.superview];
    
    _xDistance =  self.center.x - currentPoint.x;
    _yDistance = self.center.y - currentPoint.y;
    _isDrag = YES;
    
}

/**
 *  手指按住移动过程
 */
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    if(_isDrag)
    {
        /**
         *  获得触摸在按钮的父视图中的坐标
         */
        UITouch *touch = [touches anyObject];
        CGPoint currentPoint = [touch locationInView:self.superview];
        
        /**
         *  移动按钮到当前触摸位置
         */
        CGPoint newCenter = CGPointMake(currentPoint.x + _xDistance, currentPoint.y + _yDistance);
        self.center = newCenter;
    }
}

/**
 *  手指停止触摸
 */
-(void) touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    _isDrag = NO;
}

@end
