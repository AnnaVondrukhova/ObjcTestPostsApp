//
//  Post.m
//  MyHood
//
//  Created by Anya on 16.07.2020.
//  Copyright © 2020 Anna Vondrukhova. All rights reserved.
//

#import "Post.h"

@interface Post ()
@property (nonatomic, strong) NSString *imagePath;
@property (nonatomic, strong) NSString *postTitle;
@property (nonatomic, strong) NSString *postDescription;
@end

@implementation Post

- (void)encodeWithCoder:(nonnull NSCoder *)coder {
    [coder encodeObject:_imagePath forKey:@"imagePath"];
    [coder encodeObject:_postTitle forKey:@"postTitle"];
    [coder encodeObject:_postDescription forKey:@"postDescription"];
}

- (NSString *) imagePath {
    return _imagePath;
}

-(NSString *) postTitle {
    return _postTitle;
}

-(NSString *) postDescription {
    return _postDescription;
}

-(id) initWithImagePath:(NSString *)imagePath title:(NSString *)title description:(NSString *)description {
    self.imagePath = imagePath;
    self.postTitle = title;
    self.postDescription = description;
    
    return self;
}

- (nullable instancetype)initWithCoder:(nonnull NSCoder *)decoder {
    self = [self init];
    if(self) {
        self.imagePath = [decoder decodeObjectForKey:@"imagePath"];
        self.postTitle = [decoder decodeObjectForKey:@"postTitle"];
        self.postDescription = [decoder decodeObjectForKey:@"postDescription"];
    }
    
    return self;
}

@end
