//
//  ViewController.m
//  pusher
//
//  Created by mafukudo on 13/09/07.
//
//

#import "ViewController.h"
#import "UIColor+FlatUI.h"
#import "UISlider+FlatUI.h"
#import "UIStepper+FlatUI.h"
#import "UITabBar+FlatUI.h"
#import "UINavigationBar+FlatUI.h"
#import "FUIButton.h"
#import "FUISwitch.h"
#import "UIFont+FlatUI.h"
#import "FUIAlertView.h"
#import "UIBarButtonItem+FlatUI.h"
#import "UIProgressView+FlatUI.h"
#import "FUISegmentedControl.h"
#import "UIPopoverController+FlatUI.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize webView;
@synthesize backButton;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //[self.view setBackgroundColor:[UIColor whiteColor]];
    
    // UIWebView生成
    webView = [[UIWebView alloc] init];
    backButton = [[UIBarButtonItem alloc] init];
    
    webView.frame = self.view.bounds;
    // 読み込み中等にぐるぐる回る
    webView.delegate = self;
    backButton.enabled = NO;
    //ページをWebViewのサイズに合わせて表示するよう設定
    webView.scalesPageToFit = YES;
    webView.autoresizingMask = (UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight);
    [self.view addSubview:webView];
    NSURL *url = [NSURL URLWithString:@"http://www.yahoo.co.jp"];
    NSURLRequest *req = [NSURLRequest requestWithURL:url];
    [webView loadRequest:req];
    
    //ナビゲーションコントロールを表示する
    [self.navigationController setNavigationBarHidden:NO animated:NO];
    
    // this will appear as the title in the navigation bar
    UILabel *label = [[[UILabel alloc] initWithFrame:CGRectZero] autorelease];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont flatFontOfSize:20.0];
    //label.shadowColor = [UIColor colorWithWhite:0.0 alpha:0.5];
    //label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    self.navigationItem.titleView = label;
    //タイトルを「Hoge」にする
    label.text = @"顧客情報詳細";
    [label sizeToFit];
    //self.navigationItem.title = @"顧客情報詳細";
    
    
    [self.navigationController.navigationBar configureFlatNavigationBarWithColor:[UIColor colorWithRed:0.17254901960784313 green:0.24313725490196078 blue:0.3137254901960784 alpha:1.0]];

    // ナビゲーションバー左のボタン
    self.navigationItem.leftBarButtonItem =
    [[[UIBarButtonItem alloc]
      initWithBarButtonSystemItem: UIBarButtonSystemItemAdd
      target: self action: @selector(backButtonClicked)] autorelease];
    
    [UIBarButtonItem configureFlatButtonsWithColor:[UIColor peterRiverColor]
                                  highlightedColor:[UIColor belizeHoleColor]
                                      cornerRadius:3];

    
//    //右側にカメラボタンを表示する
//    UIBarButtonItem *btn = [[[UIBarButtonItem alloc]
//                             initWithBarButtonSystemItem:UIBarButtonSystemItemCamera
//                             target:self action:selector(hoge:)] autorelease];
//    self.navigationItem.rightBarButtonItem = btn;
}

////カメラボタンが押されたときに呼ばれるメソッド
//-(void)hoge:(UIBarButtonItem*)b{
//    NSLog(@"ボタンを押されましたね");
//}

- (void)backButtonClicked {
    [webView goBack];
}

// ページ読込開始時にインジケータをくるくるさせる
-(void)webViewDidStartLoad:(UIWebView*)webView{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
}

// ページ読込完了時にインジケータを非表示にする
-(void)webViewDidFinishLoad:(UIWebView*)webView{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
    backButton.enabled = (self.webView.canGoBack);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [webView release];
    [super dealloc];
}

@end
