//
//  DataService.m
//  MyHood
//
//  Created by Anya on 16.07.2020.
//  Copyright © 2020 Anna Vondrukhova. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "DataService.h"
#import "Post.h"

@interface DataService ()
//@property (class, nonatomic, strong) DataService *instance;
@property (nonatomic, strong) NSMutableArray* _loadedPosts;
@end

@implementation DataService


+(id) instance {
    static DataService *_instance = nil;
    
    @synchronized (self) {
        if (_instance == nil) {
            _instance = [[self alloc]init];
        }
    }
    return _instance;
}

NSString *KEY_POSTS = @"posts";

-(id) init {
 self = [super init];
 if(self) {
     self._loadedPosts = [[NSMutableArray alloc] init];
 }
 return self;
}

-(NSArray *) loadedPosts {
    return self._loadedPosts;
}

-(void) savePosts {
    NSData *postsData = [NSKeyedArchiver archivedDataWithRootObject:self._loadedPosts requiringSecureCoding:NO error:nil];
    [NSUserDefaults.standardUserDefaults setObject:postsData forKey:KEY_POSTS];
//    [NSUserDefaults.standardUserDefaults synchronize];
}

-(void) loadPosts {
    NSData *postsData = [[NSData alloc]init];
    postsData = [NSUserDefaults.standardUserDefaults objectForKey:KEY_POSTS];
    
    if (postsData) {
        NSMutableArray *postsArray = [NSKeyedUnarchiver unarchiveObjectWithData:postsData];
        if (postsArray) {
            self._loadedPosts = postsArray;
        }
    }
    
    [NSNotificationCenter.defaultCenter postNotification: [NSNotification notificationWithName:@"postsLoaded" object:nil]];
}

-(NSString *) saveImageAndCreatePathWithImage:(UIImage *)image  {
    NSData *imgData = [[NSData alloc]init];
    imgData = UIImagePNGRepresentation(image);
    NSString *imgPath = [NSString stringWithFormat:@"image%f.png", NSDate.timeIntervalSinceReferenceDate];
    NSString *fullPath = [self documentsPathForFileName:imgPath];
    [imgData writeToFile:fullPath atomically:YES];
    return imgPath;
}

-(UIImage *) imageForPath:(NSString *)path {
    NSString *fullpath = [self documentsPathForFileName:path];
    UIImage *image = [UIImage imageNamed:fullpath];
    return image;
}

-(void) addPost:(Post *)post {
    [self._loadedPosts addObject:post];
    [self savePosts];
    [self loadPosts];
}

-(NSString *) documentsPathForFileName:(NSString *)name {
    NSArray *paths = NSSearchPathForDirectoriesInDomains( NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *fullPath = paths[0];
    return [fullPath stringByAppendingPathComponent:name];
}
@end
