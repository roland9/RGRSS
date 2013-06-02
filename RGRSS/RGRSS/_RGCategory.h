// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to RGCategory.h instead.

#import <CoreData/CoreData.h>


extern const struct RGCategoryAttributes {
	 NSString *category;
} RGCategoryAttributes;

extern const struct RGCategoryRelationships {
	 NSString *channel;
	 NSString *item;
} RGCategoryRelationships;

extern const struct RGCategoryFetchedProperties {
} RGCategoryFetchedProperties;

@class RGChannel;
@class RGItem;



@interface RGCategoryID : NSManagedObjectID {}
@end

@interface _RGCategory : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (RGCategoryID*)objectID;





@property (nonatomic, retain) NSString* category;



//- (BOOL)validateCategory:(id*)value_ error:(NSError**)error_;





@property (nonatomic, retain) RGChannel *channel;

//- (BOOL)validateChannel:(id*)value_ error:(NSError**)error_;




@property (nonatomic, retain) RGItem *item;

//- (BOOL)validateItem:(id*)value_ error:(NSError**)error_;





@end

@interface _RGCategory (CoreDataGeneratedAccessors)

@end

@interface _RGCategory (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveCategory;
- (void)setPrimitiveCategory:(NSString*)value;





- (RGChannel*)primitiveChannel;
- (void)setPrimitiveChannel:(RGChannel*)value;



- (RGItem*)primitiveItem;
- (void)setPrimitiveItem:(RGItem*)value;


@end
