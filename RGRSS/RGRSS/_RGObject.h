// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to RGObject.h instead.

#import <CoreData/CoreData.h>


extern const struct RGObjectAttributes {
	__unsafe_unretained NSString *articleLink;
	__unsafe_unretained NSString *detailHTML;
	__unsafe_unretained NSString *imageFull;
	__unsafe_unretained NSString *imageThumbnail;
	__unsafe_unretained NSString *itemDescription;
	__unsafe_unretained NSString *itemId;
	__unsafe_unretained NSString *nextLevel;
	__unsafe_unretained NSString *numberOfSubentries;
	__unsafe_unretained NSString *parentId;
} RGObjectAttributes;

extern const struct RGObjectRelationships {
} RGObjectRelationships;

extern const struct RGObjectFetchedProperties {
} RGObjectFetchedProperties;












@interface RGObjectID : NSManagedObjectID {}
@end

@interface _RGObject : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (RGObjectID*)objectID;





@property (nonatomic, strong) NSString* articleLink;



//- (BOOL)validateArticleLink:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* detailHTML;



//- (BOOL)validateDetailHTML:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* imageFull;



//- (BOOL)validateImageFull:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* imageThumbnail;



//- (BOOL)validateImageThumbnail:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* itemDescription;



//- (BOOL)validateItemDescription:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* itemId;



//- (BOOL)validateItemId:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* nextLevel;



//- (BOOL)validateNextLevel:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* numberOfSubentries;



@property int32_t numberOfSubentriesValue;
- (int32_t)numberOfSubentriesValue;
- (void)setNumberOfSubentriesValue:(int32_t)value_;

//- (BOOL)validateNumberOfSubentries:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* parentId;



//- (BOOL)validateParentId:(id*)value_ error:(NSError**)error_;






@end

@interface _RGObject (CoreDataGeneratedAccessors)

@end

@interface _RGObject (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveArticleLink;
- (void)setPrimitiveArticleLink:(NSString*)value;




- (NSString*)primitiveDetailHTML;
- (void)setPrimitiveDetailHTML:(NSString*)value;




- (NSString*)primitiveImageFull;
- (void)setPrimitiveImageFull:(NSString*)value;




- (NSString*)primitiveImageThumbnail;
- (void)setPrimitiveImageThumbnail:(NSString*)value;




- (NSString*)primitiveItemDescription;
- (void)setPrimitiveItemDescription:(NSString*)value;




- (NSString*)primitiveItemId;
- (void)setPrimitiveItemId:(NSString*)value;




- (NSString*)primitiveNextLevel;
- (void)setPrimitiveNextLevel:(NSString*)value;




- (NSNumber*)primitiveNumberOfSubentries;
- (void)setPrimitiveNumberOfSubentries:(NSNumber*)value;

- (int32_t)primitiveNumberOfSubentriesValue;
- (void)setPrimitiveNumberOfSubentriesValue:(int32_t)value_;




- (NSString*)primitiveParentId;
- (void)setPrimitiveParentId:(NSString*)value;




@end
