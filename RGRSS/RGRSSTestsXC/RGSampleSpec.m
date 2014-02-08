#import "Kiwi.h"
#import "RGFeedManager.h"
#import "RGObject.h"


SPEC_BEGIN(SpreadsheetTests)

describe(@"Loading Spreadsheet", ^{
    
    beforeAll(^{
        NSString *urlString = @"http://spreadsheets.google.com/feeds/list/0Apmsn6hlyPHudDBHbWJ6NkI4SFNwTEkzQVBXS3VGY0E/od6/public/values?alt=json";
        NSURL *url = [NSURL URLWithString:urlString];
        [[RGFeedManager sharedRGFeedManager] loadURL:url];
    });
    
    it(@"data loaded", ^{
        [[expectFutureValue([[RGFeedManager sharedRGFeedManager] responseEntries]) shouldEventuallyBeforeTimingOutAfter(5)] haveCountOf:53];

        RGObject *obj1 = [[RGObject alloc] init];
        obj1.itemId = @"1";
        obj1.parentId = @"0";
        obj1.itemDescription = @"Asia";

        RGObject *obj2 = [[RGObject alloc] init];
        obj2.itemId = @"10";
        obj2.parentId = @"1";
        obj2.itemDescription = @"Indonesia";

        RGObject *obj3 = [[RGObject alloc] init];
        obj3.itemId = @"41";
        obj3.parentId = @"6";
        obj3.itemDescription = @"Kenya";

        RGObject *obj4 = [[RGObject alloc] init];
        obj4.itemId = @"44";
        obj4.parentId = @"12";
        obj4.itemDescription = @"Düsseldorf";

        [[expectFutureValue([[RGFeedManager sharedRGFeedManager] responseEntries]) shouldEventuallyBeforeTimingOutAfter(5)]
         containObjectsInArray:@[obj1, obj2, obj3, obj4]];
        
    });
});

SPEC_END
