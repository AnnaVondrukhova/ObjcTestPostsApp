//
//  Post.h
//  MyHood
//
//  Created by Anya on 16.07.2020.
//  Copyright © 2020 Anna Vondrukhova. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Post : NSObject <NSCoding>
-(NSString *) imagePath;
-(NSString *) postTitle;
-(NSString *) postDescription;
-(id) initWithImagePath:(NSString *)imagePath title:(NSString *)title description:(NSString *)description;
- (nullable instancetype)initWithCoder;
@end

NS_ASSUME_NONNULL_END
