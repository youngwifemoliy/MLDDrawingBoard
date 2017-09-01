//
//  MLDDrawingBoard.m
//  MLDDrawingBoard
//
//  Created by Moliy on 2017/9/1.
//  Copyright © 2017年 Moliy. All rights reserved.
//

#import "MLDDrawingBoard.h"
@interface MLDDrawingBoard ()
@property(nonatomic,retain)NSMutableArray *lineArray;

@end

@implementation MLDDrawingBoard

-(void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    CGContextSetLineWidth(context, 2.0);
    for (int i = 0; i < [_lineArray count]; i++)
    {
        NSMutableArray *pointArray = [_lineArray objectAtIndex:i];
        for (int j = 0; j <(int)pointArray.count - 1; j++)
        {
            NSValue *pointValue1 = [pointArray objectAtIndex:j];
            NSValue *pointValue2 = [pointArray objectAtIndex:j + 1];
            CGPoint point1 = [pointValue1 CGPointValue];
            CGPoint point2 = [pointValue2 CGPointValue];
            CGContextMoveToPoint(context, point1.x, point1.y);
            CGContextAddLineToPoint(context, point2.x, point2.y);
        }
    }
    CGContextStrokePath(context);
}

- (NSMutableArray *)lineArray
{
    if (!_lineArray)
    {
        _lineArray = [NSMutableArray arrayWithCapacity:0];
    }
    return _lineArray;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches
          withEvent:(UIEvent *)event
{
    NSMutableArray *pointArray = [NSMutableArray arrayWithCapacity:1];
    [_lineArray addObject:pointArray];
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches
          withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    NSMutableArray *pointArray = [_lineArray lastObject];
    NSValue *pointValue = [NSValue valueWithCGPoint:point];
    [pointArray addObject:pointValue];
    [self setNeedsDisplay];
}

- (void)removeLastLine
{
    [_lineArray removeLastObject];
    [self setNeedsDisplay];
}

- (void)removeAllLine
{
    [_lineArray removeAllObjects];
    [self setNeedsDisplay];
}

@end
