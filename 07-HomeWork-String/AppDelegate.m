//
//  AppDelegate.m
//  07-HomeWork-String
//
//  Created by Slava on 17.03.17.
//  Copyright © 2017 Slava. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSString *lvl = @"++++++++++++++++++++++++NEW TASK++++++++++++++++++++++++\n";
    

//    https://developer.apple.com/reference/foundation/nsstring
    
    NSString *text = @"A string object presents itself as a sequence of UTF–16 code units. You can determine how many UTF-16 code units a string object contains with object the length method object and can retrieve object a specific UTF-16 code unit with the character method. These two “primitive” methods provide basic access to a string object. Most use of strings, however, is at a higher level, with the strings being treated as single entities: You compare strings against one another, search them for substrings, combine them into new strings, and so on. If you need to access string objects character by character, you must understand the Unicode character encoding, specifically issues related to composed character sequences.";
#pragma mark - lvl_1
    NSLog(@"%@", lvl);
//    Возьмите текст из моего исходника и создайте на его основе строку, с которой будете работать.
    NSString  *textTaskOne = [text substringWithRange:NSMakeRange(122, 65)];
    
//    Выведите на экран сначала первую половину текста, а потом вторую.
    NSInteger twoPartText = [textTaskOne length] / 2;
    NSString *partOne = [textTaskOne substringToIndex:twoPartText];
    NSString *partTwo = [textTaskOne substringFromIndex:twoPartText];
    NSLog(@"%@, %@_%@", textTaskOne, partOne, partTwo);
    
//    Создайте массив, каждый элемент которого является предложением данного текста.
    NSArray *arrayTaskOne = [text componentsSeparatedByString:@". "];
    NSLog(@"%@", arrayTaskOne);
    
    
#pragma mark - lvl_2
    NSLog(@"%@", lvl);
//    Используя массив из пункта 3 создайте новый массив, элементы которого это предложения, содержащие слово NSString. Нужно будет использовать поиск и мутабл массивы
    NSMutableArray *mutableArrayTaskTwo = [NSMutableArray new];
    for (NSString *str in arrayTaskOne) {
        NSRange rangeTaskTwo = [str rangeOfString:@"method" options:NSCaseInsensitiveSearch];
        if (rangeTaskTwo.location != NSNotFound) {
            [mutableArrayTaskTwo addObject:str];
        }
    }
    NSLog(@"%@", mutableArrayTaskTwo);
    
#pragma mark - lvl_3
    NSLog(@"%@", lvl);
//    Создайте новый массив на основе массива из пункта 4, но слова в предложении пусть идут наоборот, первое слово будет в конце, а последнее вначале :)
    NSMutableArray *mutableArrayRevers = [NSMutableArray new];  // создаем пустой массив
    for (NSString *string in mutableArrayTaskTwo) { // пробегаемся по массиву из задания 2
        NSArray *arrayOld = [string componentsSeparatedByString:@" "];  // создаем обычный массив из одного пердложения, разделяюзего слова через пробел
        NSString *result = [[[arrayOld reverseObjectEnumerator] allObjects] componentsJoinedByString:@" "]; // создаем строку, в которую передаем массив при этом развернув у него все строки
        [mutableArrayRevers addObject:result];  // добавляем в mutableArrayRevers результат и выводим
        NSLog(@"old string - %@", string);
        NSLog(@"new string - %@", mutableArrayRevers);
    }
    
    
#pragma mark - lvl_3
    NSLog(@"%@", lvl);
//    В оригинальном тексте каждое слово должно начинаться с маленькой буквы, а заканчиваться на заглавную.
    
    
    
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
