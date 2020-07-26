//
//  ViewController.m
//  MyHood
//
//  Created by Anya on 16.07.2020.
//  Copyright © 2020 Anna Vondrukhova. All rights reserved.
//

#import "ViewController.h"
#import "DataService.h"
#import "Post.h"
#import "PostCell.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [[DataService instance] loadPosts];
    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(onPostsLoaded:) name:@"postsLoaded" object:nil];
    
}


-(void) onPostsLoaded: (NSNotification *)notification {
    [self.tableView reloadData];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    NSArray *posts = [[DataService instance] loadedPosts];
    Post *post = posts[indexPath.row];
    PostCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"postCell"];
    if (cell) {
        [cell configure: post];
    } else {
        PostCell *cell = [[PostCell alloc]init];
        [cell configure: post];
    }
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[DataService instance] loadedPosts] count] ;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 87.0;
}


@end
