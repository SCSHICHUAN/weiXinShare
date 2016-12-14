//
//  ViewController.m
//  weiXinShare
//
//  Created by SHICHUAN on 2016/12/12.
//  Copyright © 2016年 SHICHUAN. All rights reserved.
//

#import "ViewController.h"
#import "WXApi.h"
#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>
#import "WXApiObject.h"
@interface ViewController ()
- (IBAction)shareText:(UIButton *)sender;
- (IBAction)sharePicture:(UIButton *)sender;
- (IBAction)shareMusic:(UIButton *)sender;
- (IBAction)shareWeb:(UIButton *)sender;
- (IBAction)shareVideo:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}






#pragma mark - 分享文字
- (IBAction)shareText:(UIButton *)sender {
    
    
    SendMessageToWXReq *req = [[SendMessageToWXReq alloc] init];
    //设置发送的文字
    req.text = @"微信分享测试文字";
    req.bText = YES;
    //    req.scene = 1;//朋友圈
    //   req.scene = 2;//收藏
    req.scene = 0;//分享给好友
    //发送请求
    [WXApi sendReq:req];

    
}



#pragma mark - 分享图片
- (IBAction)sharePicture:(UIButton *)sender {
    
        WXMediaMessage *message = [WXMediaMessage message];
        [message setThumbImage:[UIImage imageNamed:@"iconvv.png"]];
        WXImageObject *imageObject = [WXImageObject object];
        NSString *filePath = [[NSBundle mainBundle]pathForResource:@"345" ofType:@"jpg"];
        imageObject.imageData = [NSData dataWithContentsOfFile:filePath];
        message.mediaObject = imageObject;
    
    
    
        SendMessageToWXReq *req = [[SendMessageToWXReq alloc] init];
        req.bText = NO;
        req.message = message;
        req.scene = 0;
        [WXApi sendReq:req];

}


#pragma mark - 分享音乐
- (IBAction)shareMusic:(UIButton *)sender {
   
    WXMediaMessage *message = [WXMediaMessage message];
    message.title = @"微信分享音乐测试";
    message.description = @"崔健";
    [message setThumbImage:[UIImage imageNamed:@"res3.jpg"]];
    WXMusicObject *ext = [WXMusicObject object];
    ext.musicUrl = @"http://y.qq.com/i/song.html#p=7B22736F6E675F4E616D65223A22E4B880E697A0E68980E69C89222C22736F6E675F5761704C69766555524C223A22687474703A2F2F74736D7573696334382E74632E71712E636F6D2F586B30305156342F4141414130414141414E5430577532394D7A59344D7A63774D4C6735586A4C517747335A50676F47443864704151526643473444442F4E653765776B617A733D2F31303130333334372E6D34613F7569643D3233343734363930373526616D703B63743D3026616D703B636869643D30222C22736F6E675F5769666955524C223A22687474703A2F2F73747265616D31342E71716D757369632E71712E636F6D2F33303130333334372E6D7033222C226E657454797065223A2277696669222C22736F6E675F416C62756D223A22E4B880E697A0E68980E69C89222C22736F6E675F4944223A3130333334372C22736F6E675F54797065223A312C22736F6E675F53696E676572223A22E5B494E581A5222C22736F6E675F576170446F776E4C6F616455524C223A22687474703A2F2F74736D757369633132382E74632E71712E636F6D2F586C464E4D313574414141416A41414141477A4C36445039536A457A525467304E7A38774E446E752B6473483833344843756B5041576B6D48316C4A434E626F4D34394E4E7A754450444A647A7A45304F513D3D2F33303130333334372E6D70333F7569643D3233343734363930373526616D703B63743D3026616D703B636869643D3026616D703B73747265616D5F706F733D35227D";
    ext.musicDataUrl = @"http://stream20.qqmusic.qq.com/32464723.mp3";
    
    message.mediaObject = ext;
    
    SendMessageToWXReq* req = [[SendMessageToWXReq alloc] init];
    req.bText = NO;
    req.message = message;
    req.scene = 0;
    
    [WXApi sendReq:req];
    
    
    
}



#pragma mark - 分享网页
- (IBAction)shareWeb:(UIButton *)sender {
        WXMediaMessage *message = [WXMediaMessage message];
        message.title = @"微信分享测试网页";
        message.description = @"百度网页";
        [message setThumbImage:[UIImage imageNamed:@"iconvv.png"]];
    
        WXWebpageObject *webpageObject = [WXWebpageObject object];
        webpageObject.webpageUrl = @"www.baidu.com";
        message.mediaObject = webpageObject;
    
    
    
        SendMessageToWXReq *req = [[SendMessageToWXReq alloc] init];
        req.bText = NO;
        req.message = message;
        req.scene =0;
        
        [WXApi sendReq:req];
}


#pragma mark - 分享视频
- (IBAction)shareVideo:(UIButton *)sender {
   
    WXMediaMessage *message = [WXMediaMessage message];
    message.title = @"微信分享测试视频";
    message.description = @"一样的监牢，不一样的门";
    [message setThumbImage:[UIImage imageNamed:@"res4.jpg"]];
    
    WXVideoObject *ext = [WXVideoObject object];
    ext.videoUrl =  @"http://v.youku.com/v_show/id_XNTUxNDY1NDY4.html";
    
    message.mediaObject = ext;
    
    GetMessageFromWXResp* resp = [[GetMessageFromWXResp alloc] init];
    resp.message = message;
    resp.bText = NO;
    
    [WXApi sendResp:resp];
    
}
@end
