//
//  DetailViewController.m
//  TableViewObjC
//
//  Created by hoang dang trung on 9/10/15.
//  Copyright (c) 2015 hoang dang trung. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController () <UIWebViewDelegate>

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    self.webView.delegate = self;
    [self.view addSubview: self.webView];
    
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.title = self.animal;
    NSString *encodedQuery = [self.animal stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[[NSURL alloc]initWithString:[NSString stringWithFormat: @"https://www.google.com/search?q=%@", encodedQuery]]];
    [self.webView loadRequest:request];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    NSLog(@"%@  -- %@", request.URL.host, request.URL.query);
    return true;
}

- (void) webViewDidFinishLoad:(UIWebView *)webView {
    NSLog(@"Load Completed");
}


@end
