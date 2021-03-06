// UIAlertView+AFNetworking.m
//
// Copyright (c) 2013-2014 AFNetworking (http://afnetworking.com)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "CSNotificationView+AFNetworking.h"

#import "AFURLSessionManager.h"

static void AFGetAlertViewTitleAndMessageFromError(NSError *error, NSString * __autoreleasing *title, NSString * __autoreleasing *message) {
    if (error.localizedDescription && (error.localizedRecoverySuggestion || error.localizedFailureReason)) {
        *title = error.localizedDescription;
        
        if (error.localizedRecoverySuggestion) {
            *message = error.localizedRecoverySuggestion;
        } else {
            *message = error.localizedFailureReason;
        }
    } else if (error.localizedDescription) {
        *title = NSLocalizedStringFromTable(@"Error", @"AFNetworking", @"Fallback Error Description");
        *message = error.localizedDescription;
    } else {
        *title = NSLocalizedStringFromTable(@"Error", @"AFNetworking", @"Fallback Error Description");
        *message = [NSString stringWithFormat:NSLocalizedStringFromTable(@"%@ Error: %ld", @"AFNetworking", @"Fallback Error Failure Reason Format"), error.domain, (long)error.code];
    }
}

@implementation CSNotificationView (AFNetworking)

+ (void)showNotificationViewForTaskWithErrorOnCompletion:(NSURLSessionTask *)task
                                       controller:(UIViewController*)controller
{
    __block id observer = [[NSNotificationCenter defaultCenter] addObserverForName:AFNetworkingTaskDidCompleteNotification object:task queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *notification) {
        
        NSError *error = notification.userInfo[AFNetworkingTaskDidCompleteErrorKey];
        if (error) {
            NSString *title, *message;
            AFGetAlertViewTitleAndMessageFromError(error, &title, &message);
            
            [CSNotificationView showInViewController:controller style:CSNotificationViewStyleError message:message];
        }
        
        [[NSNotificationCenter defaultCenter] removeObserver:observer name:AFNetworkingTaskDidCompleteNotification object:notification.object];
    }];
}

@end
