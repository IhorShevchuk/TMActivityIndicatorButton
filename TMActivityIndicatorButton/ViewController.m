//
//  ViewController.m
//  TMActivityIndicatorButton
//
//  Created by Admin on 10/27/15.
//  Copyright © 2015 Techmagic. All rights reserved.
//

#import "ViewController.h"
#import "TMActivityIndicatorButton.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)buttonAction:(id)sender
{
    [self.animtedButton startAnimating];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        sleep(1);
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.animtedButton stopAnimating];
        });
        
    });
}

@end
