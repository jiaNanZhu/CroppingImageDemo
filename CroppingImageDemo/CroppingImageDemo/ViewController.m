//
//  ViewController.m
//  CroppingImageDemo
//
//  Created by 朱佳男 on 2017/4/24.
//  Copyright © 2017年 ShangYuKeJi. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+CroppingImage.h"
#import "CroppingImageViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>
@interface ViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(8, 100, self.view.bounds.size.width-16, 150)];
    [self.view addSubview:self.imageView];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 300, self.view.bounds.size.width, 50);
    button.backgroundColor = [UIColor redColor];
    [button setTitle:@"选择图片" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(selectImage:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)selectImage:(id)sender {
    UIImagePickerController *mediaUI = [[UIImagePickerController alloc] init];
    mediaUI.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    mediaUI.mediaTypes = [[NSArray alloc] initWithObjects:(NSString*)kUTTypeImage, nil];
    //[UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    mediaUI.allowsEditing = NO;
    mediaUI.delegate = self;
    
    [self presentViewController:mediaUI animated:NO completion:nil];
}
- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    
    //    NSString *mediaType = [info objectForKey: UIImagePickerControllerMediaType];
    UIImage *image = (UIImage *) [info objectForKey:UIImagePickerControllerOriginalImage];
    CGSize size = CGSizeMake(self.view.bounds.size.width-16, 150);
    
    CroppingImageViewController *cropView = [[CroppingImageViewController alloc]initWithRect:size completeBlock:^(UIImage *img) {
        self.imageView.image = img;
    }];
    cropView.selectedImage = image;
    [self.navigationController pushViewController:cropView animated:NO];
    [picker dismissViewControllerAnimated:NO completion:^{
        
        
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
