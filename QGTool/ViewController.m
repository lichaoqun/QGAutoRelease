//
//  ViewController.m
//  QGTool
//
//  Created by 李超群 on 2017/12/26.
//  Copyright © 2017年 李超群. All rights reserved.
//

#import "ViewController.h"
#import "XXView.h"
#import "NSObject+SJObserverHelper.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self test1];
}

-(void)test1{
    XXView *view = [[XXView alloc] initWithFrame:CGRectMake(50, 50, 100, 100)];
    view.tag = 998;
    [self.view addSubview:view];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        for(UIView *subview in self.view.subviews){
            if(subview.tag == 998){
                [subview removeFromSuperview];
                break;
            }
        }
    });
    
//    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(testxx1) name:@"testxx1" object:nil];
//    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(testxx2) name:@"testxx2" object:nil];

    [view sj_addObserver:self forKeyPath:@"frame"];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [[NSNotificationCenter defaultCenter]postNotificationName:@"testxx1" object:nil];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"testxx2" object:nil];
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
