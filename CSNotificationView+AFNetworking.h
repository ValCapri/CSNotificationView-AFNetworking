// CSNotificationView+AFNetworking.h
// BeRoads
//
// Copyright (c) 2014 Lionel Schinckus
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

#import <Foundation/Foundation.h>

#import <Availability.h>

#if defined(__IPHONE_OS_VERSION_MIN_REQUIRED)

#import <UIKit/UIKit.h>
#import <CSNotificationView/CSNotificationView.h>

@class AFURLConnectionOperation;

/**
 This category adds methods to the `CSNotificationView` class. The methods in this category provide support for automatically showing a notification if a session task or request operation finishes with an error. Notification title and message are filled from the corresponding `localizedDescription` & `localizedRecoverySuggestion` or `localizedFailureReason` of the error.
 */
@interface CSNotificationView (AFNetworking)

///-------------------------------------
/// @name Showing Notification for Session Task
///-------------------------------------

/**
 Shows an notification view with the error of the specified session task, if any.
 
 @param task The session task.
 @param controller The view controller.
 */
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= 70000
+ (void)showNotificationViewForTaskWithErrorOnCompletion:(NSURLSessionTask *)task
                                         controller:(UIViewController*)controller;
#endif

///------------------------------------------
/// @name Showing Notification for Request Operation
///------------------------------------------

/**
 Shows an notification view with the error of the specified request operation, if any.
 
 @param operation The request operation.
 @param controller The view controller.
 */
+ (void)showNotificationViewForRequestOperationWithErrorOnCompletion:(AFURLConnectionOperation *)operation
                                                     controller:(UIViewController*)controller;


@end

#endif
