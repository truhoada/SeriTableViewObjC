//
//  DemoLazyLoading.m
//  TableViewObjC
//
//  Created by hoang dang trung on 9/18/15.
//  Copyright (c) 2015 hoang dang trung. All rights reserved.
//

#import "DemoLazyLoading.h"

@interface DemoLazyLoading ()
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end

@implementation DemoLazyLoading

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self imageDownloader:@"http://www.zastavki.com/pictures/originals/2013/Photoshop_Image_of_the_horse_053857_.jpg"];
}

- (void) imageDownloader: (NSString*)urlStringImage {
    dispatch_queue_t imageQueue = dispatch_queue_create("imageDownloader", nil);
    dispatch_async(imageQueue, ^{
        //loading image
        NSURL *imageURL = [NSURL URLWithString:urlStringImage];
        NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
        UIImage *image = [UIImage imageWithData:imageData];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.activityIndicator stopAnimating];
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.width-150)];
            imageView.image = image;
            [self.view addSubview:imageView];
        });
    });
}

@end
