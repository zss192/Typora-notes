

# HLS

## 定义

HLS 全称是 HTTP Live Streaming，是由苹果公司提出的动态自适应流媒体协议，于2009年发布

## HLS架构

一个典型的 HLS 流媒体系统主要由三部分组成，分别为服务器端，内容分发器和客户端

- 服务器端：主要由视频文件录入、视频文件压缩编码及视频文件切片三部分组成
  - 多媒体编码器(Media Encoder)：将输入的音视频编码为符合HLS要求的格式，如H.264+AAC，然后封装成 MPEG2-TS
  - 流分割器(Stream Segmenter)：将封装好的 TS 视频文件切片为一系列等时长(10s)的 TS 分片，同时生成 M3U8 索引文件和 Key加密文件。

- 内容分发器端：处理用户请求将所请求的 TS 流和 M3U8 索引文件传送给客户端，无需做大量的配置和扩展

- 客户端：用户使用 HTTP 协议发送视频文件请求，首先请求M3U8 索引文件，根据 M3U8 索引文件中 TS 分片的 URL 按顺序缓存 TS 分片文件。对加密的视频文件，客户端还需要通过 M3U8 索引文件来获取解密秘钥

<img src="https://cdn.jsdelivr.net/gh/zss192/Typora-notes@master/images/20201206023820467.png" alt="HlS 系统架构" style="zoom: 50%;" />

> HLS文件由若干 URL 和信息标签 Tags 组成 的 M3U8 索引文件、由 H.264/AAC 视/音频编码的 MPEG2-TS 媒体分片文件和用于视频加密的 Key 加密文件三部分组成

## M3U8文件

M3U8 索引文件是由若干 URL 和信息标签 Tags组成的播放列表文件

客户端 根据 M3U8 索引文件中的 URL 获取相应码率的 TS 分片地址进行播放以实现动态自适应

- 一级索引：存储不同码率的二级(替换)索引文件的URL
- 二级(替换)索引：记录相应码率的TS文件的URL

<img src="https://cdn.jsdelivr.net/gh/zss192/Typora-notes@master/images/image-20220929153137792.png" alt="image-20220929153137792" style="zoom:80%;" />

> 客户端首先获取一级索引文件，然后根据网络情况选择合适的二级索引文件获取相应码率的 TS 分片进行播放
>
> 如果在播放过程中网络带宽发生突变，客户端会自动调整选择更低码率的TS 分片实现动态自适应播放

一个标准的一级索引M3U8文件如下所示，来源：[流媒体协议HLS解析](https://blog.csdn.net/houxiaoni01/article/details/100899177)

```bash
#EXTM3U
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=1280000
http://example.com/low.m3u8
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=2560000
http://example.com/mid.m3u8
#EXT-X-STREAM-INF:PROGRAM-ID=1,BANDWIDTH=7680000
http://example.com/hi.m3u8
#EXT-X-ENDLIST
```

该文件定义了多种不同码率的二级索引文件，M3U8 索引文件以#EXTM3U 标签开头，以#EXT 开头的标签为信息标签 Tags，以#EXT-X-ENDLIST 标签结尾

二级索引M3U8文件则存储具体的TS文件地址，如下所示：

```bash
#EXTM3U		//头标签，说明M3U8 索引文件是 M3U 扩展而来
#EXT-X-VERSION:3		//当前 M3U8 索引文件的版本号
#EXT-X-PLAYLIS-TYPE:VOD		//定义了点播（VOD）和直播（Live）类型
#EXT-X-TARGETDURATION:10		//每个 TS 分片的播放最大时长
#EXT-X-MEDIA-SEQUENCE:0		//第一个TS分片的编号(默认从0开始),该标签是为了多码率切换后视频对齐
#EXTINF,
low-0000.ts
#EXTINF,
low-0001.ts
#EXTINF, 
low-0002.ts
#EXTINF, 
low-0003.ts
#EXTINF, 
......
#EXT-X-ENDLIST		//结尾标签，存在该标签，则为点播业务；不存在该标签，则为直播业务
```

# DASH

## 定义

DASH (Dynamic Adaptive Streaming over HTTP) 是由 3GPP(Third Generation Partnership Project)和 MPEG(Moving Pictures Experts Group）一起合作制定的标准，于 2012年完成并发布。

## DASH架构

<img src="https://cdn.jsdelivr.net/gh/zss192/Typora-notes@master/images/f1ba58208c4cc068a53d7d79c31cd0d4.png" alt="MPEG-DASH是啥？" style="zoom: 50%;" />

DASH服务器主要包含两种文件：

- MPD (Media Presentation Description)索引文件：以 XML 格式用来保存视频分片的信息(相当于HLS的M3U8文件)
- 视频分片文件：具体的媒体内容，其支持多种封装格式和音视频编码格式
  - DASH中第一个视频切片叫做初始分片，包含了必要的初始化信息，主要负责初始化客户端的播放参数。之后的媒体段就是具体的多媒体内容

与HLS类似，DASH也需要进行编码封装切片，不过DASH通常支持2-10s的切片。

> 客户端首先向服务器请求并解析MPD索引文件， 获得可用的视频分片 URL，从而向服务器端请求最合适码率的视频分片

## MPD文件

MPD文件的格式如下所示：

![image-20220929150145282](https://cdn.jsdelivr.net/gh/zss192/Typora-notes@master/images/image-20220929150145282.png)

- Period按时间顺序排列，一个Period记录一个时间段的分片信息，包含了多种码率、语言、字幕
- Period 可以按照视频、音频、码率等分为多个 Adaptation Sets
- 一个 Adaptation Sets 又将媒体内容细分为若干个 Representation。一个 Representation 可以由一种或多种编码方案组成，该编码方案包含了具体的多媒体内容
  - 所谓的码率自适应就是指，客户端可以根据不同的网络情况，从一个 Representation 切换到另一个 Representation

如下为一个MPD文件示例（来源：[自适应流媒体传输（四）——深入理解MPD](https://blog.csdn.net/nonmarking/article/details/85714099)）

![在这里插入图片描述](https://cdn.jsdelivr.net/gh/zss192/Typora-notes@master/images/20190103225909518.png)

# HLS和DASH的对比

|                | HLS       | DASH               |
| -------------- | --------- | ------------------ |
| 类型           | Apple专有 | MPEG定义的开放标准 |
| 视频源编码格式 | H.264     | H.264/others       |
| 音频源编码格式 | AAC/MP3   | AAC/others         |
| 片段格式       | MPEG-2TS  | MPEG-2TS/MP4格式   |
| 默认片段长度   | 10s       | 灵活的             |

# 常见格式

常见视/音频封装格式有：AVI、 RMVB、MVK、MP4、MP3、FLV、MPEG2-TS 等

常见的视频编码格式有： MPEG-4、MPEG-2、H.264、H.265 等

常见的音频编码格式有：MPEG Layer1、 MPEG Layer2、MPEG Layer3、AAC等

# 参考文献

[1]祝谷乔, 宋皓. MPEG-DASH与HLS流传输技术的比较分析[J]. 电信科学, 2015, 31(4): 29–33.

[2]潘吴斌, 程光, 吴桦, 等. 移动网络加密YouTube视频流QoE参数识别方法[J]. 计算机学报, 2018, 41(11): 2436–2452.

[3]李泽平. 流媒体服务器负载均衡算法研究与应用[D/OL]. 

[4]黄顺翔. YouTube移动端加密视频流关联与传输模式识别[D/OL]. 东南大学, 2017.

[5]郭东海. 多屏互动背景下的数字视频直播技术研究[J]. 广播电视信息, 2021, 28(1): 41–43.

[6]陈剑. MPEG-DASH传输技术研究与算法优化[D/OL]. 北京工业大学, 2019.