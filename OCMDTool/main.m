//
//  main.m
//  OCMDTool
//
//  Created by yanguo sun on 24/11/2016.
//  Copyright © 2016 Lvmama. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MMMarkdown.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        if (argc < 2) {
            NSLog(@"please give path!");
            return 1;
        }
        NSString *aa =[NSString stringWithCString:argv[1] encoding:NSUTF8StringEncoding];
        // @"/Users/sunyanguo/bin" ;
        NSString *markPath = [aa stringByAppendingString:@"/tagBranchTable.md"];
        NSString *htmlPath = [aa stringByAppendingString:@"/tagBranchTable.html"];
        NSString *templePath = [aa stringByAppendingString:@"/temple.html"];
        NSString *markString = [[NSString alloc] initWithContentsOfFile:markPath encoding:NSUTF8StringEncoding error:nil];
        NSString *templeString = [[NSString alloc] initWithContentsOfFile:templePath encoding:NSUTF8StringEncoding error:nil];

        NSString *tableString = [MMMarkdown HTMLStringWithMarkdown:markString extensions:MMMarkdownExtensionsGitHubFlavored error:nil];
        NSString *htmlString = [templeString stringByReplacingOccurrencesOfString:@"{{tablePlaceHolder}}" withString:tableString];
        BOOL ret = [htmlString writeToFile:htmlPath atomically:NO encoding:NSUTF8StringEncoding error:nil];
        //{{tablePlaceHolder}}
        if (ret) {
            NSLog(@"over!");
        } else {
            NSLog(@"error!");
        }
    }
    return 0;
}
