// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to RGItem.h instead.

#import <CoreData/CoreData.h>


extern const struct RGItemAttributes {
	__unsafe_unretained NSString *author;
	__unsafe_unretained NSString *comments;
	__unsafe_unretained NSString *enclosure;
	__unsafe_unretained NSString *guid;
	__unsafe_unretained NSString *itemDescription;
	__unsafe_unretained NSString *linkXXX;
	__unsafe_unretained NSString *pubDate;
	__unsafe_unretained NSString *source;
	__unsafe_unretained NSString *title;
} RGItemAttributes;

extern const struct RGItemRelationships {
	__unsafe_unretained NSString *category;
	__unsafe_unretained NSString *channel;
} RGItemRelationships;

extern const struct RGItemFetchedProperties {
} RGItemFetchedProperties;

@class RGCategory;
@class RGChannel;











@interface RGItemID : NSManagedObjectID {}
@end

@interface _RGItem : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (RGItemID*)objectID;





@property (nonatomic, strong) NSString* author;



//- (BOOL)validateAuthor:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* comments;



//- (BOOL)validateComments:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* enclosure;



//- (BOOL)validateEnclosure:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* guid;



//- (BOOL)validateGuid:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* itemDescription;



//- (BOOL)validateItemDescription:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* linkXXX;



//- (BOOL)validateLinkXXX:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSDate* pubDate;



//- (BOOL)validatePubDate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* source;



//- (BOOL)validateSource:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* title;



//- (BOOL)validateTitle:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) RGCategory *category;

//- (BOOL)validateCategory:(id*)value_ error:(NSError**)error_;




@property (nonatomic, strong) RGChannel *channel;

//- (BOOL)validateChannel:(id*)value_ error:(NSError**)error_;





@end

@interface _RGItem (CoreDataGeneratedAccessors)

@end

@interface _RGItem (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveAuthor;
- (void)setPrimitiveAuthor:(NSString*)value;




- (NSString*)primitiveComments;
- (void)setPrimitiveComments:(NSString*)value;




- (NSString*)primitiveEnclosure;
- (void)setPrimitiveEnclosure:(NSString*)value;




- (NSString*)primitiveGuid;
- (void)setPrimitiveGuid:(NSString*)value;




- (NSString*)primitiveItemDescription;
- (void)setPrimitiveItemDescription:(NSString*)value;




- (NSString*)primitiveLinkXXX;
- (void)setPrimitiveLinkXXX:(NSString*)value;




- (NSDate*)primitivePubDate;
- (void)setPrimitivePubDate:(NSDate*)value;




- (NSString*)primitiveSource;
- (void)setPrimitiveSource:(NSString*)value;




- (NSString*)primitiveTitle;
- (void)setPrimitiveTitle:(NSString*)value;





- (RGCategory*)primitiveCategory;
- (void)setPrimitiveCategory:(RGCategory*)value;



- (RGChannel*)primitiveChannel;
- (void)setPrimitiveChannel:(RGChannel*)value;


@end
