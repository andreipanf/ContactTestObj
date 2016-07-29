//
//  AddressBookHelper.m
//  ContactTest
//
//  Created by Andrey on 29.07.16.
//  Copyright © 2016 AndreyPanfilov. All rights reserved.
//

#import "AddressBookHelper.h"
#import "Contact.h"
#import "ContactsMapping.h"
@import Contacts;

@implementation AddressBookHelper

+ (void)getAllContacts:(void (^)(NSArray *responce))success failure:(void (^)(NSString *errorString))failure
{
    CNContactStore *store = [[CNContactStore alloc] init];
    [store requestAccessForEntityType:CNEntityTypeContacts completionHandler:^(BOOL granted, NSError * _Nullable error) {
        if (granted == YES) {
            NSArray *keys = @[CNContactFamilyNameKey, CNContactGivenNameKey, CNContactPhoneNumbersKey];
            NSString *containerId = store.defaultContainerIdentifier;
            NSPredicate *predicate = [CNContact predicateForContactsInContainerWithIdentifier:containerId];
            NSError *error;
            NSArray *arrayContacts = [store unifiedContactsMatchingPredicate:predicate keysToFetch:keys error:&error];
            if (error) {
                failure(error.localizedFailureReason);
            } else {
                success([ContactsMapping mappingContactFromAddressBook:arrayContacts]);
            }
        }else{
            failure(@"Нет доступа к контактам,\nзайдите в настройки приложения\nприватность -> Контакты\nИ дайте доступ к контактам");
        }
    }];
}

@end

