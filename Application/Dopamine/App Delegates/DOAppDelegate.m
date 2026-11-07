//
//  AppDelegate.m
//  Dopamine
//
//  Created by Lars Fröder on 23.09.23.
//

#import "DOAppDelegate.h"
#import "DOThemeManager.h"
#import "DOTheme.h"

@interface DOAppDelegate ()

@end

@implementation DOAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Sync the home-screen icon to the enabled theme on every launch, so a
    // brand-new install (where the default theme is Deep Blue Sky) shows the
    // blue AppIcon_Blue instead of the stock green AppIcon.
    DOTheme *theme = [[DOThemeManager sharedInstance] enabledTheme];
    NSString *desiredIcon = theme.icon.length ? theme.icon : nil;
    NSString *currentIcon = application.alternateIconName;
    BOOL same = (currentIcon == nil && desiredIcon == nil)
                || (currentIcon != nil && desiredIcon != nil && [currentIcon isEqualToString:desiredIcon]);
    if (!same && [application supportsAlternateIcons]) {
        [application setAlternateIconName:desiredIcon completionHandler:nil];
    }
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}

- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window
{
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        return UIInterfaceOrientationMaskAll;
    return UIInterfaceOrientationMaskPortrait;
}

@end
