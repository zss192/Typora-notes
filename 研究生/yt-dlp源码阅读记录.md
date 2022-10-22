youtube-dl下载部分blibili视频只有每秒几百K，而下载youtube视频速度只有几十K。

下载blibli视频可以通过调用Aria2使用多线程解决限速问题。而使用这种方法依然无法解决下载youtube视频限速问题。

通过搜索，发现网上很多用户都存在这个问题，可能是YouTube对于youtube-dl有一些反制措施，解决方法是使用yt-dlp替换youtube-dl

yt-dlp是youtube-dl的一个分支，支持youtube-dl的全部语法同时具有更多的功能。无论下载bilibili还是youtube视频都可以跑满宽带。

## yt-dlp

- 比youtube-dl多了link选项模块(可以写一个互联网快捷方式文件，如.url、.webloc、.desktop)
- sponsorblock选项模块([使用SponsorBlock API](https://sponsor.ajay.app/)为下载的 YouTube 视频制作章节条目或删除各种片段(赞助商、订阅提醒等)
- extractor选项模块(提取器选项，如设置已知提取器错误的重试次数(默认为3))



# 调试准备

\_\_main\_\_.py

```python
if __package__ is None and not hasattr(sys, 'frozen'):   
    import os.path   
    path = os.path.realpath(os.path.abspath(__file__))   
    sys.path.insert(0, os.path.dirname(os.path.dirname(path)))
```

程序打包成 exe 的时，会将一个变量 `frozen` 注入到 `sys` 中,利用`sys.frozen`属性来判断是打包的exe还是py脚本

