//
//  ModelController.m
//  yuezi
//
//  Created by yexifeng on 16/5/26.
//  Copyright © 2016年 moregood. All rights reserved.
//

#import "ModelController.h"
#import "DataViewController.h"
#import "Manager.h"
#import "OneDay.h"

/*
 A controller object that manages a simple model -- a collection of month names.
 
 The controller serves as the data source for the page view controller; it therefore implements pageViewController:viewControllerBeforeViewController: and pageViewController:viewControllerAfterViewController:.
 It also implements a custom method, viewControllerAtIndex: which is useful in the implementation of the data source methods, and in the initial configuration of the application.
 
 There is no need to actually create view controllers for each page in advance -- indeed doing so incurs unnecessary overhead. Given the data model, these methods create, configure, and return a new view controller on demand.
 */


@interface ModelController ()

@property (readonly, strong, nonatomic) NSArray *pageData;
@end

@implementation ModelController

- (instancetype)init {
    self = [super init];
    if (self) {
        NSMutableArray* array = [NSMutableArray array];
        // Create the data model.
        for(int i=0;i<28;i++){
            [array addObject:[[Manager instance] getOneDay:i]];
        }
        _pageData = array;
    }
    return self;
}

- (UINavigationController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard {
    // Return the data view controller for the given index.
    if (([self.pageData count] == 0) || (index >= [self.pageData count])) {
        return nil;
    }

    // Create a new view controller and pass suitable data.
    
    DataViewController *dataViewController = [storyboard instantiateViewControllerWithIdentifier:@"DataViewController"];
    dataViewController.oneDay = self.pageData[index];
    UINavigationController* navController = [[UINavigationController alloc]initWithRootViewController:dataViewController];
    return navController;
}

- (NSUInteger)indexOfViewController:(DataViewController *)viewController {
    // Return the index of the given data view controller.
    // For simplicity, this implementation uses a static array of model objects and the view controller stores the model object; you can therefore use the model object to identify the index.
    return [self.pageData indexOfObject:viewController.oneDay];
}

#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    UINavigationController* navController = viewController;
    NSUInteger index = [self indexOfViewController:(DataViewController *)navController.topViewController];
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index storyboard:navController.topViewController.storyboard];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    UINavigationController* navController = viewController;
    NSUInteger index = [self indexOfViewController:(DataViewController *)navController.topViewController];
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [self.pageData count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index storyboard:navController.topViewController.storyboard];
}

@end
