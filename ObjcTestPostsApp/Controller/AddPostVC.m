//
//  AddPostVC.m
//  MyHood
//
//  Created by Anya on 16.07.2020.
//  Copyright © 2020 Anna Vondrukhova. All rights reserved.
//

#import "AddPostVC.h"
#import "DataService.h"
#import "Post.h"

@interface AddPostVC ()
@property (strong, nonatomic) IBOutlet UIImageView *postImage;
@property (strong, nonatomic) IBOutlet UITextField *titleTextField;
@property (strong, nonatomic) IBOutlet UITextField *descriptionTextField;
@property (nonatomic, strong) UIImagePickerController *imagePicker;
@end

@implementation AddPostVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.postImage.layer.cornerRadius = self.postImage.frame.size.width/2;
    self.postImage.clipsToBounds = YES;
    self.imagePicker = [[UIImagePickerController alloc] init];
    self.imagePicker.delegate = self;
}

- (IBAction)addPicBtnPressed:(id)sender {
    [sender setTitle:@"" forState:UIControlStateNormal];
    [self presentViewController:self.imagePicker animated:YES completion:nil];
}

- (IBAction)makePostBtnPressed:(id)sender {
    NSString *title = self.titleTextField.text;
    NSString *description = self.descriptionTextField.text;
    UIImage *image = self.postImage.image;
    
    if((title)&&(description)&&(image)&&(![title  isEqual: @""])&&(![description isEqual: @""])) {
        NSString *imagePath = [[DataService instance] saveImageAndCreatePathWithImage:image];
        Post *post = [[Post alloc] initWithImagePath: imagePath title: title description: description];
        [DataService.instance addPost:post];
        [self dismissViewControllerAnimated:YES completion:nil];

    }
}

- (IBAction)cancelBtnPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info {
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    if(image) {
        self.postImage.image = image;
    }
    
    [self.imagePicker dismissViewControllerAnimated:true completion:nil];
}

@end
