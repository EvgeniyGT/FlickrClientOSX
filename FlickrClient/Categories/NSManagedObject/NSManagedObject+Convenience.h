//
//  NSManagedObject+Convenience.h
//  Avaamo
//
//  Created by Sergii Kryvoblotskyi on 6/5/14.
//  @Copyright Avaamo Inc., All rights reserved.
//

#import <CoreData/CoreData.h>

@interface NSManagedObject (Convenience)
+ (NSArray *)fetchAllInContext:(NSManagedObjectContext *)context;
+ (NSArray *)fetchAllWithPredicate:(NSPredicate *)predicate inContext:(NSManagedObjectContext *)context;
+ (NSArray *)fetchAllWithPredicate:(NSPredicate *)predicate inContext:(NSManagedObjectContext *)context sortedBy:(NSString *)field asc:(BOOL)ask;

+ (void)truncateAllInContext:(NSManagedObjectContext *)context;

+ (void)deleteAllMatchingPredicate:(NSPredicate *)predicate inContext:(NSManagedObjectContext *)context;

+ (id)fetchFirstWithPredicate:(NSPredicate *)predicate inContext:(NSManagedObjectContext *)context;
+ (id)createInContext:(NSManagedObjectContext *)context;

+ (NSInteger )countFetchWithPredicate:(NSPredicate *)predicate inContext:(NSManagedObjectContext *)context;

/**
 *  Returns current object in given context
 *
 *  @param context NSManagedObjectContext
 *
 *  @return NSManagedObject
 */
- (instancetype)inContext:(NSManagedObjectContext *)context;

@end
