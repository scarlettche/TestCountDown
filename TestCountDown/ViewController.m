//
//  ViewController.m
//  TestCountDown
//
//  Created by Scarlett Che on 2018/5/7.
//  Copyright © 2018年 Scarlett Che. All rights reserved.
//

#import "ViewController.h"
#import "SCCountdownLabel.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet SCCountdownLabel *label;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITextField *textField1;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (IBAction)action:(UIButton *)sender {
    NSInteger interval = self.textField1.text.integerValue;
    if (interval == 0) {
        self.textField1.text = @"参数无效";
        return;
    }
    
    [self.label setupTotalInterval:interval dateformatter:self.textField.text];
}
@end
