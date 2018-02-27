//
//  ImageDetailViewController.m
//  ScrollView Image Galleries
//
//  Created by Chris Dean on 2018-02-26.
//  Copyright © 2018 Chris Dean. All rights reserved.
//

#import "ImageDetailViewController.h"

@interface ImageDetailViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;


@end

@implementation ImageDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.scrollView.minimumZoomScale = 0.1;
    self.scrollView.maximumZoomScale = 1.0;

    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.imageView.image = self.capturedImage;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return self.imageView;
}

@end
