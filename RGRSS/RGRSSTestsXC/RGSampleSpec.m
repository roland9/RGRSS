#import "Kiwi.h"
#import "RGFeedManager.h"


SPEC_BEGIN(SpreadsheetTests)

describe(@"Loading Spreadsheet", ^{
    
    beforeAll(^{
        NSString *urlString = @"http://spreadsheets.google.com/feeds/list/0Apmsn6hlyPHudDBHbWJ6NkI4SFNwTEkzQVBXS3VGY0E/od6/public/values?alt=json";
        NSURL *url = [NSURL URLWithString:urlString];
        [[RGFeedManager sharedRGFeedManager] loadURL:url];
    });
    
    it(@"data loaded", ^{
        [[expectFutureValue([[RGFeedManager sharedRGFeedManager] responseEntries]) shouldEventuallyBeforeTimingOutAfter(5)] haveCountOf:41];
        
        [[expectFutureValue([[RGFeedManager sharedRGFeedManager] responseEntries]) shouldEventuallyBeforeTimingOutAfter(5)]
         containObjectsInArray:@[
                                 @{@"itemId": @"1",
                                   @"parentId": @"0",
                                   @"description": @"Asia"
                                   },
                                 @{@"itemId": @"10",
                                   @"parentId": @"1",
                                   @"description": @"Indonesia"
                                   },
                                 @{@"itemId": @"41",
                                   @"parentId": @"6",
                                   @"description": @"Kenya"
                                   }
                                 ]];
        
    });
});

SPEC_END
