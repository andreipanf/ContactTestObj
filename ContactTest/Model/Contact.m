//
//  Contact.m
//  ContactTest
//
//  Created by Andrey on 29.07.16.
//  Copyright © 2016 AndreyPanfilov. All rights reserved.
//

#import "Contact.h"

@implementation Contact

-(id)initWithName:(NSString*)firstName familyName:(NSString*)familyName  andPhoneNumber:(NSString*)phoneNuber
{
    self = [super init];
    if(self) {
        self.firstName = firstName;
        self.familyName = familyName;
        
        if (firstName == nil) {
            self.fullName = [NSString stringWithFormat:@"%@",firstName];
        }else if (familyName == nil){
            self.fullName = [NSString stringWithFormat:@"%@",familyName];
        }
        else{
            self.fullName = [NSString stringWithFormat:@"%@ %@",firstName,familyName];
        }
        
        self.phoneNumber = phoneNuber;
    }
    return self;
}

@end
