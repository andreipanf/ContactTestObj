//
//  ContactsMapping.m
//  ContactTest
//
//  Created by Andrey on 29.07.16.
//  Copyright © 2016 AndreyPanfilov. All rights reserved.
//

#import "ContactsMapping.h"
#import "Contact.h"
@import Contacts;


@implementation ContactsMapping

+(NSArray*)mappingContactFromAddressBook:(NSArray*)arrayContacts
{
    NSMutableArray *contactsArray = [[NSMutableArray alloc]init];
    for (CNContact *contact in arrayContacts) {
        
        for (CNLabeledValue *label in contact.phoneNumbers) {
            //У контактов может быть несколько номеров, но в условии не указанно что с этим делать
            //поэтому для каждого номера будет свой обьект контакта в таблице.
            
            NSString *phone = [label.value stringValue];
            if ([phone length] > 0) {
                Contact *contactObj = [[Contact alloc] initWithName:contact.givenName familyName:contact.familyName andPhoneNumber:phone];
                [contactsArray addObject:contactObj];
            }
        }
    }
    return contactsArray;

}

@end
