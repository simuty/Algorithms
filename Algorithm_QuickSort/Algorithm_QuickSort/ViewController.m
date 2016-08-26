//
//  ViewController.m
//  Algorithm_QuickSort
//
//  Created by BWF-HHW on 16/8/25.
//  Copyright © 2016年 HHW. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSMutableArray *mutableArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSMutableArray *array = [NSMutableArray array];
    
    //int x = arc4random() % 100;---- 表示 [0, 100)
    static int num = 10000;
    for (int i = 0;i < num; i++) {
      u_int32_t x = arc4random() % num;
      NSNumber *num = [[NSNumber alloc] initWithInt:x];
      [array addObject:num];
    }
    
    //调用快速排序的方法
    [self quickSortWithArray:array withLeft:0 andRight:array.count - 1];
    
    NSLog(@"%@",array);

    
}


- (void)quickSortWithArray:(NSMutableArray *)array withLeft:(NSInteger)left andRight:(NSInteger)right{
    //数组不需要排序
    if (left >= right) return;
    
    //数组第一个位置
    NSInteger i = left;
    //数组最后一个位置
    NSInteger j = right;
    //将第一个位置的<value>作为---基准
    NSInteger pivot = [array[left] integerValue];
    
    
    while (i != j) {
        //从后往前走, 直到找到 大于 <基准> 的数字, 此时 j 保存那个数字的下标位置
        while (i < j && pivot <= [array[j] integerValue]) {
            j--;
        }
        //再从前往后走, 直到找到 小于 <基准> 的数字, 此时 i 保存那个数字的下标位置
        while (i < j && pivot >= [array[i] integerValue]) {
            i++;
        }
        //互换位置
        if (i < j) {
            [array exchangeObjectAtIndex:i withObjectAtIndex:j];
        }
        
    }
    //最终将基准数归位, 因为i == j, 需要将<基数所在位置的value>与<i/j相等的位置的value>互换位置
    [array exchangeObjectAtIndex:i withObjectAtIndex:left];

    //继续左边的排序
    [self quickSortWithArray:array withLeft:left andRight:i - 1];
    //继续右边的排序
    [self quickSortWithArray:array withLeft:i + 1 andRight:right];
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
