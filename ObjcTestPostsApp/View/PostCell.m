//
//  PostCell.m
//  ObjcTestPostsApp
//
//  Created by Anya on 16.07.2020.
//  Copyright © 2020 Anna Vondrukhova. All rights reserved.
//

#import "PostCell.h"
#import "Post.h"
#import "DataService.h"

@interface PostCell()
@property (strong, nonatomic) IBOutlet UIImageView *postImageView;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *descriptionLabel;
@end

@implementation PostCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.postImageView.layer.cornerRadius = self.postImageView.frame.size.width/2;
    self.postImageView.clipsToBounds = YES;
}

- (void) configure:(Post *)post {
    self.postImageView.image = [[DataService instance] imageForPath:[post imagePath]];
    self.titleLabel.text = [post postTitle];
    self.descriptionLabel.text = [post postDescription];
}

@end
