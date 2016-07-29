//
//  ContactsMapping.h
//  ContactTest
//
//  Created by Andrey on 29.07.16.
//  Copyright © 2016 AndreyPanfilov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ContactsMapping : NSObject

+(NSArray*)mappingContactFromAddressBook:(NSArray*)arrayContacts;

@end
