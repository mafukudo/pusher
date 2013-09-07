//
//  ViewController.h
//  pusher
//
//  Created by mafukudo on 13/09/07.
//
//

#import <UIKit/UIKit.h>
#import "FUIAlertView.h"

@interface ViewController : UIViewController <UIPopoverControllerDelegate, UIActionSheetDelegate, FUIAlertViewDelegate, UIWebViewDelegate> {
    
    UIWebView *webView;
    UIBarButtonItem *backButton;
}

@property (nonatomic, retain) UIWebView *webView;
@property (nonatomic, retain) UIBarButtonItem *backButton;

- (void)backButtonClicked;

@end
