//
//  TMActivityIndicatorButton.m
//  Hagtap
//
//  Created by Admin on 9/10/15.
//  Copyright © 2015 Hagtap. All rights reserved.
//

#import "TMActivityIndicatorButton.h"
@interface TMActivityIndicatorButton()
{
    UIActivityIndicatorView *buttonActivityIndicator;
    UIImage *oldImage;
}
@end
@implementation TMActivityIndicatorButton

-(void)startAnimating
{
    if(buttonActivityIndicator == nil)
    {
        buttonActivityIndicator = [[UIActivityIndicatorView alloc]initWithFrame:self.imageView.frame];
        buttonActivityIndicator.hidesWhenStopped = YES;
        [self addSubview:buttonActivityIndicator];
    }
    [buttonActivityIndicator stopAnimating];
    
    static UIImage *emptyImage = nil;
    if(emptyImage == nil)
    {
        emptyImage = [UIImage new];
        CGSize newSize = self.imageView.frame.size;
        UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
        [emptyImage drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
        emptyImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    
    if(self.currentImage != nil && ![self.currentImage isEqual:emptyImage])
    {
        oldImage = self.currentImage;
    }
    
    [self setImage:emptyImage forState:UIControlStateNormal];
    buttonActivityIndicator.frame = self.imageView.frame;
    [buttonActivityIndicator startAnimating];
    [self setUserInteractionEnabled:NO];
}
-(void)stopAnimating
{
    [buttonActivityIndicator stopAnimating];
    if(oldImage != nil)
    {
        [self setImage:oldImage forState:UIControlStateNormal];
    }
    [self setUserInteractionEnabled:YES];
}
@end
