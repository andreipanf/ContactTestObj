//
//  AddressBookHelper.h
//  ContactTest
//
//  Created by Andrey on 29.07.16.
//  Copyright © 2016 AndreyPanfilov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AddressBookHelper : NSObject

+ (void)getAllContacts:(void (^)(NSArray *responce))success failure:(void (^)(NSString *errorString))failure;

@end
