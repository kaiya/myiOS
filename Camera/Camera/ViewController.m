//
//  ViewController.m
//  Camera
//
//  Created by K.Yawn Xoan on 3/24/15.
//  Copyright (c) 2015 K.Yawn Xoan. All rights reserved.
//

#import "ViewController.h"
#import <MediaPlayer/MediaPlayer.h>
#import <MobileCoreServices/UTCoreTypes.h>

@interface ViewController ()

<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (weak,nonatomic) IBOutlet UIImageView *imageView;
@property (weak,nonatomic) IBOutlet UIButton *takePictureButton;

@property(strong, nonatomic) MPMoviePlayerController *moviePlayerController;
@property(strong, nonatomic) UIImage *image;
@property(strong, nonatomic) NSURL *movieURL;
@property(copy,nonatomic) NSString *lastChosenMediaType;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"View did load");
    
    if(![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        self.takePictureButton.hidden = YES;
    }
    
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self updateDisplay];
}
- (IBAction)shootPictureOrVideo:(id)sender{
    [self pickMediaFromSource:UIImagePickerControllerSourceTypeCamera];
    
}
- (IBAction)selectExistingPictureOrVideo:(id)sender{
    [self pickMediaFromSource:UIImagePickerControllerSourceTypePhotoLibrary];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void) updateDisplay{
    if([self.lastChosenMediaType isEqual:(NSString *) kUTTypeImage]){
        self.imageView.image = self.image;
        self.imageView.hidden = NO;
        self.moviePlayerController.view.hidden = YES;
    }else if ([self.lastChosenMediaType isEqual:(NSString *)kUTTypeMovie]){
        [self.moviePlayerController.view removeFromSuperview];
        self.moviePlayerController = [[MPMoviePlayerController alloc]initWithContentURL:self.movieURL];
        [self.moviePlayerController play];
        UIView *movieView = self.moviePlayerController.view;
        movieView.frame = self.imageView.frame;
        movieView.clipsToBounds = YES;
        [self.view addSubview:movieView];
        self.imageView.hidden= YES;
    }
}

- (void)pickMediaFromSource:(UIImagePickerControllerSourceType) sourceType{
    NSArray *mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:sourceType];
    if([UIImagePickerController isSourceTypeAvailable:sourceType] && [mediaTypes count] > 0){
        NSArray *mediaTypes = [UIImagePickerController availableMediaTypesForSourceType:sourceType];
        UIImagePickerController * picker = [[UIImagePickerController alloc] init];
        picker.mediaTypes = mediaTypes;
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = sourceType;
        [self presentViewController:picker animated:YES completion:NULL];
    }else{
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Unsupported media source." delegate:nil cancelButtonTitle:@"Drat!" otherButtonTitles:nil];
        [alert show];
    }
}

- (UIImage *) shrinkImage:(UIImage *) original toSize:(CGSize)size{
    UIGraphicsBeginImageContextWithOptions(size, YES, 0);
    
    CGFloat originalAspect = original.size.width / original.size.height;
    CGFloat targetAspect = size.width / size.height;
    CGRect targetRect;
    
    if(originalAspect > targetAspect){
        // original is wider than target
        targetRect.size.width = size.width;
        targetRect.size.height = size.height;
        targetRect.origin.x = 0;
        targetRect.origin.y = (size.height - targetRect.size.height) * 0.5;
    }else if(originalAspect < targetAspect){
        //original is narrower than target
        targetRect.size.width = size.width *  originalAspect / targetAspect;
        targetRect.size.height = size.height;
        targetRect.origin.x = (size.width -  targetRect.size.width) * 0.5;
        targetRect.origin.y = 0;
    }else{
        //original and target have same aspect ratio
        targetRect = CGRectMake(0, 0, size.width, size.height);
    }
    [original drawInRect:targetRect];
    UIImage *final = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return final;
}

#pragma mark - Image Picker Controller delegate methods
- (void)imagePickerController:(UIImagePickerController *) picker
didFinishPickingMediaWithInfo:(NSDictionary *)info{
    self.lastChosenMediaType = info[UIImagePickerControllerMediaType];
    if([self.lastChosenMediaType  isEqual:(NSString *) kUTTypeImage]){
        UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
        self.image = [self shrinkImage:chosenImage toSize:self.imageView.bounds.size];
    }else if([self.lastChosenMediaType isEqual:(NSString *) kUTTypeMovie]){
        self.movieURL = info[UIImagePickerControllerMediaURL];
    }
    [picker dismissViewControllerAnimated:YES completion:NULL];
}

- (void) imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:YES completion:NULL];
}





















@end














