//
//  NSManagedObject+Convenience.m
//  Avaamo
//
//  Created by Sergii Kryvoblotskyi on 6/5/14.
//  @Copyright Avaamo Inc., All rights reserved.
//

@implementation NSManagedObject (Convenience)

+ (NSArray *)fetchAllInContext:(NSManagedObjectContext *)context
{

    return [self fetchAllWithPredicate:nil inContext:context];
}

+ (NSArray *)fetchAllWithPredicate:(NSPredicate *)predicate inContext:(NSManagedObjectContext *)context
{
    return [self fetchAllWithPredicate:predicate inContext:context sortedBy:nil asc:NO];
}

+ (NSArray *)fetchAllWithPredicate:(NSPredicate *)predicate inContext:(NSManagedObjectContext *)context sortedBy:(NSString *)field asc:(BOOL)ask
{
    NSEntityDescription *entity = [self currentEntityDescriptionInContext:context];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    request.entity = entity;
    request.predicate = predicate;
    
    if (field) {
        NSSortDescriptor *sd = [NSSortDescriptor sortDescriptorWithKey:field ascending:ask];
        request.sortDescriptors = @[sd];
    }
    
    NSError *requestError = nil;
    NSArray *result = [context executeFetchRequest:request
                                             error:&requestError];
    
    if (requestError != nil) {
        return nil;
    }
    return result;
}


+ (NSArray *)fetchAllWithPredicate:(NSPredicate *)predicate inContext:(NSManagedObjectContext *)context properties:(NSArray *)properties
{
    NSEntityDescription *entity = [self currentEntityDescriptionInContext:context];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    request.entity = entity;
    request.predicate = predicate;
    request.returnsDistinctResults = YES;
    request.propertiesToFetch = properties;
    
    NSError *requestError = nil;
    NSArray *result = [context executeFetchRequest:request
                                             error:&requestError];
    
    if (requestError != nil) {
        return nil;
    }
    return result;
}

+ (void)truncateAllInContext:(NSManagedObjectContext *)context
{
    NSEntityDescription *entity = [self currentEntityDescriptionInContext:context];

    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setEntity:entity];

    NSArray *items = [context executeFetchRequest:fetchRequest error:NULL];

    for (NSManagedObject *managedObject in items) {
        [context deleteObject:managedObject];
    }
}

+ (void)deleteAllMatchingPredicate:(NSPredicate *)predicate
                         inContext:(NSManagedObjectContext *)context
{
    NSArray *objectsToTruncate = [self fetchAllWithPredicate:predicate
                                                  inContext:context];

    for (NSManagedObject *objectToTruncate in objectsToTruncate)
    {
        [context deleteObject:objectToTruncate];
    }
}


+ (id)fetchFirstWithPredicate:(NSPredicate *)predicate inContext:(NSManagedObjectContext *)context
{
    NSEntityDescription *entity = [self currentEntityDescriptionInContext:context];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    request.entity = entity;
    request.predicate = predicate;
    request.fetchLimit = 1;
    
    NSError *requestError = nil;
    NSArray *result = [context executeFetchRequest:request
                                             error:&requestError];
    
    if (requestError != nil || result.count == 0) {
        return nil;
    }
    return result[0];
}

+ (id)createInContext:(NSManagedObjectContext *)context
{
    NSEntityDescription *entity = [NSEntityDescription insertNewObjectForEntityForName:NSStringFromClass(self)
                                                                inManagedObjectContext:context];
    return entity;
}

#pragma mark - Count

+ (NSInteger )countFetchWithPredicate:(NSPredicate *)predicate inContext:(NSManagedObjectContext *)context
{
    NSEntityDescription *entity = [self currentEntityDescriptionInContext:context];
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    request.entity = entity;
    request.predicate = predicate;
    
    NSError *requestError = nil;
    NSInteger result = [context countForFetchRequest:request error:&requestError];
    return result;
}

#pragma mark - Helpers

+ (NSEntityDescription *)currentEntityDescriptionInContext:(NSManagedObjectContext *)context
{
    return [NSEntityDescription entityForName:NSStringFromClass(self)
                       inManagedObjectContext:context];
}

#pragma mark - Contexts

- (instancetype)inContext:(NSManagedObjectContext *)context
{
    __block NSManagedObject *object = nil;
    [context performBlockAndWait:^{
        object = [context objectWithID:self.objectID];
    }];
    return object;
}

@end
