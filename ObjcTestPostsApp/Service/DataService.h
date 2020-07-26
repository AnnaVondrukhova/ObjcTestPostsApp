//
//  DataService.h
//  MyHood
//
//  Created by Anya on 16.07.2020.
//  Copyright © 2020 Anna Vondrukhova. All rights reserved.
//

#ifndef DataService_h
#define DataService_h


#endif /* DataService_h */

@interface DataService: NSObject
+(id) instance;
-(id) init;
-(NSArray *) loadedPosts;
-(void) savePosts;
-(void) loadPosts;
-(NSString *) saveImageAndCreatePathWithImage:(UIImage *)image;
-(UIImage *) imageForPath:(NSString *)path;
-(void) addPost:(id)post;
@end
