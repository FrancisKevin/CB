//
//  ImageController.m
//  CBExampleAPI
//
//  Created by FrancisKevin on 15/12/10.
//  Copyright © 2015年 CB. All rights reserved.
//

#import "ImageController.h"

@interface ImageController () <UIActionSheetDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *iv;

@end

@implementation ImageController

+ (instancetype)imageController
{
    ImageController *vc = [[ImageController alloc] initWithNibName:@"ImageController" bundle:nil];
    return vc;
}

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Setup UI
- (void)setupUI
{
    self.iv.image = self.imgScreenshot;
    self.iv.contentMode = UIViewContentModeScaleAspectFit;
    self.iv.backgroundColor = [UIColor blackColor];
    
    UITapGestureRecognizer *singleTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapImageView:)];
    self.iv.userInteractionEnabled = YES;
    [self.iv addGestureRecognizer:singleTapGesture];
}

#pragma mark - UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)
    {
        [self saveImageToPhotos:self.imgScreenshot];
    }
    else if (buttonIndex == 1)
    {
        [self openImagePickerControllerWithSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    }
    else if (buttonIndex == 2)
    {
        [self openImagePickerControllerWithSourceType:UIImagePickerControllerSourceTypeCamera];
    }
}

#pragma mark - UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    self.iv.image = image;
    
    [picker dismissViewControllerAnimated:YES completion:^{
        ;
    }];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    
}

#pragma mark - Custom Method
- (void)singleTapImageView:(UIGestureRecognizer*)gestureRecognizer
{
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"保存图片", @"打开相册", @"打开相机", nil];
    [sheet showInView:self.view];
}

- (void)saveImageToPhotos:(UIImage *)saveImage
{
    UIImageWriteToSavedPhotosAlbum(saveImage, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    NSString *msg = nil;
    if (error)
    {
        msg = @"图片保存失败";
    }
    else
    {
        msg = @"图片保存成功";
    }
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"保存图片" message:msg delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
}

- (void)openImagePickerControllerWithSourceType:(UIImagePickerControllerSourceType)sourceType
{
    if ([UIImagePickerController isSourceTypeAvailable:sourceType])
    {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = NO;
        picker.sourceType = sourceType;
        [self presentViewController:picker animated:YES completion:^{
            ;
        }];
    }
}

@end
