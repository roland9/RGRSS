// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to RGItem.h instead.

#import <CoreData/CoreData.h>


extern const struct RGItemAttributes {
	 NSString *author;
	 NSString *comments;
	 NSString *enclosure;
	 NSString *guid;
	 NSString *itemDescription;
	 NSString *linkXXX;
	 NSString *pubDate;
	 NSString *source;
	 NSString *title;
} RGItemAttributes;

extern const struct RGItemRelationships {
	 NSString *category;
	 NSString *channel;
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





@property (nonatomic, retain) NSString* author;



//- (BOOL)validateAuthor:(id*)value_ error:(NSError**)error_;





@property (nonatomic, retain) NSString* comments;



//- (BOOL)validateComments:(id*)value_ error:(NSError**)error_;





@property (nonatomic, retain) NSString* enclosure;



//- (BOOL)validateEnclosure:(id*)value_ error:(NSError**)error_;





@property (nonatomic, retain) NSString* guid;



//- (BOOL)validateGuid:(id*)value_ error:(NSError**)error_;





@property (nonatomic, retain) NSString* itemDescription;



//- (BOOL)validateItemDescription:(id*)value_ error:(NSError**)error_;





@property (nonatomic, retain) NSString* linkXXX;



//- (BOOL)validateLinkXXX:(id*)value_ error:(NSError**)error_;





@property (nonatomic, retain) NSDate* pubDate;



//- (BOOL)validatePubDate:(id*)value_ error:(NSError**)error_;





@property (nonatomic, retain) NSString* source;



//- (BOOL)validateSource:(id*)value_ error:(NSError**)error_;





@property (nonatomic, retain) NSString* title;



//- (BOOL)validateTitle:(id*)value_ error:(NSError**)error_;





@property (nonatomic, retain) RGCategory *category;

//- (BOOL)validateCategory:(id*)value_ error:(NSError**)error_;




@property (nonatomic, retain) RGChannel *channel;

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
