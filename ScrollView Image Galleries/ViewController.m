//
//  ViewController.m
//  ScrollView Image Galleries
//
//  Created by Chris Dean on 2018-02-26.
//  Copyright © 2018 Chris Dean. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) NSMutableArray<UIImageView*> *images;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.images = [[NSMutableArray alloc] init];
    [self.scrollView setPagingEnabled:YES];
    [self.scrollView setDelegate:self];
    [self setupImages];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupImages {
    
    for(int i=0; i<3; i++) {
        UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width*i, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
        
        switch(i) {
            case 0:
                imageView.image = [UIImage imageNamed:@"Lighthouse-in-Field"];
                break;
            case 1:
                imageView.image = [UIImage imageNamed:@"Lighthouse-night"];
                break;
            case 2:
                imageView.image = [UIImage imageNamed:@"Lighthouse-zoomed"];
                break;
        }
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.images addObject:imageView];
        [self.scrollView addSubview:imageView];
    }
    [self.scrollView setContentSize:CGSizeMake(self.view.bounds.size.width * self.images.count, 0)];
}


@end
