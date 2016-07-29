//
//  Contact.h
//  ContactTest
//
//  Created by Andrey on 29.07.16.
//  Copyright © 2016 AndreyPanfilov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Contact : NSObject

@property (nonatomic) NSString *firstName;
@property (nonatomic) NSString *familyName;

@property (nonatomic) NSString *fullName;

@property (nonatomic) NSString *phoneNumber;

-(id)initWithName:(NSString*)firstName familyName:(NSString*)familyName  andPhoneNumber:(NSString*)phoneNuber;

@end
