//
//  BootLogic.m
//  TechmasterApp
//
//  Created by techmaster on 9/7/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

#import "BootLogic.h"
#import "MainScreen.h"


@implementation BootLogic
+ (void) boot: (UIWindow*) window
{
    MainScreen* mainScreen = [[MainScreen alloc] initWithStyle:UITableViewStyleGrouped];
    //--------- From this line, please customize your menu data -----------
    NSDictionary* basic = @{SECTION: @"Basic", MENU: @[
                                    @{TITLE: @"Plain Table", CLASS: @"PlainTable"},
                                    @{TITLE: @"Raw Table", CLASS: @"RawTableViewVC"},
                                    @{TITLE: @"2 Tables in VC", CLASS: @"TwoTableViewsInVC"},
                                    @{TITLE: @"Group Table", CLASS: @"GroupTable"},
                                    @{TITLE: @"Table + Photos", CLASS: @"VictoriaSecret"},
                                    @{TITLE: @"Index Table", CLASS: @"IndexTable"},
                                    @{TITLE: @"Random Password", CLASS: @"RandomPass"},
                                    @{TITLE: @"Table StoryBoard", CLASS: @"TableStoryBoard#Storyboard"},
                                    @{TITLE: @"Table Setting", CLASS: @"TableSetting"}
                                    
                          ]};
    
    NSDictionary* intermediate = @{SECTION: @"Intermediate", MENU: @[
                                    @{TITLE: @"Accessory Table", CLASS: @"AccessoryTable"},
                                    @{TITLE: @"Setting Table", CLASS: @"SettingTable"},
                                    @{TITLE: @"Multi Selection", CLASS: @"MultiSelection"},
                                    @{TITLE: @"Custom Cell", CLASS: @"CustomCellDemo"},
                                    @{TITLE: @"Search", CLASS: @"SearchTable"}



                                  ]};
    NSDictionary* advanced = @{SECTION: @"Advanced", MENU: @[
                                    @{TITLE: @"Custom Draw Cell", CLASS: @"CustomDrawCell"},
                                    @{TITLE: @"Basic Lazy Loading", CLASS: @"DemoLazyLoading"}
                
                             ]};
    
    mainScreen.menu = @[basic, intermediate, advanced];
    mainScreen.title = @"Bootstrap App";
    mainScreen.about = @"This is demo bootstrap demo app. It is collection of sample code of AVFoundation";
    //--------- End of customization -----------
    UINavigationController* nav = [[UINavigationController alloc] initWithRootViewController: mainScreen];
    
    window.rootViewController = nav;
}
@end
