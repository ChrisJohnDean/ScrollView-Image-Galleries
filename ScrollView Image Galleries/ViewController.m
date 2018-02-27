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
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.images = [[NSMutableArray alloc] init];
    [self.scrollView setPagingEnabled:YES];
    [self.scrollView setDelegate:self];
    [self setupImages];
}

- (void)setupImages {
    
    for(int i=0; i<3; i++) {
        UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width*i, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
        [imageView addGestureRecognizer:tapGesture];
        
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
        imageView.userInteractionEnabled = YES;
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.images addObject:imageView];
        [self.scrollView addSubview:imageView];
    }
    [self.scrollView setContentSize:CGSizeMake(self.view.bounds.size.width * self.images.count, 0)];
}

-(void)handleTap:(UITapGestureRecognizer*)gesture {
    
    [self performSegueWithIdentifier:@"detailViewSegue" sender:gesture.view];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    //UIImage *img = (UIImage*)sender.image;
    if([segue.identifier isEqualToString:@"detailViewSegue"]) {
        ImageDetailViewController *vc = [segue destinationViewController];
        
        vc.capturedImage = ((UIImageView *)sender).image;
        
    }
}

@end
