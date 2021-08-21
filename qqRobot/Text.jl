module Text
#------
# https://github.com/kyubotics/coolq-http-api/wiki/表情-CQ-码-ID-表
export Default, MainGroupMessage, twrpCoverMessage, viper4AndroidMessage, whoIam, Answer1, Answer2, Answer3, Answer4, Answer5, Bl, Rec, Flash, Rom, Magisk, Moudle

# 回答的内容
Default = """试着艾特我的昵称：后面加上解锁、magisk、模块、rec、刷机或者rom来获得帮助。比如:
    @Are You OK? 解锁
以下下是一些常见的问题：
    1.什么是双清，三清，四清，五清?
    2.什么是刷机的底包?
    3.为什么要解密DATA分区?
    4.关于手机的代号的解释（Lime，Juice）
    5.官方包无法使用Google框架的问题
    6.手机如何安装Viper4Android(蝰蛇)音效
同样，艾特我的昵称加上问题前面的序号获得帮助。比如：
    @Are You OK? 1
通过以上方式来获得对应问题的答案
"""
MainGroupMessage = "隔壁Note9系列总群，有所有和红米Note9 4g有关的包还有其他一些资源，都是由本群的“工具人”大佬“挚爱宅”搬运到云盘里的。群号是：860284890，进群后记得找管理员要云盘的密码"

twrpCoverMessage = "解决刷入的TWRP重启后被官方系统覆盖的问题，可以在刷入TWRP之后刷入Magisk(面具)来解决"

viper4AndroidMessage = "首先在面具里搜索安装viper4android模块，安装完后先不重启，打开桌面的app，它会提示你安装驱动，同意并且自动安装完驱动后，手机会自动重启。
    然后打开app最右上角设置里面的legacy  mode,在设置左边那个像处理器的按钮里看下驱动是否安装成功，如果用的是群主的android10  flyme 9，到此就已经安装成功了。但是类原生的android11系统还需要关闭selinux才行。miui系统可以参考着上面的步骤安装
    成功安装之后，下载群文件里的‘安卓蝰蛇v4A  版本20.5   2.7.2.1配置密码252725.zip’解压到‘/storage/emulated/0/Android/data/com.pittvandewitt.viperfx/files/’目录下面，配置即可生效。因为最新版本不支持中文命名，所以显示的配置都问英文。看不懂的话一个一个试试，看看哪个适合你"

whoIam = "我是雷军[CQ:face,id=4][CQ:face,id=124]
愿你刷机半生，归来仍是MIUI"

Answer1 = """双清:
    Dalvik/ART Cache
    Cache
其目的就是清除分区以及数据而已，简称重置手机。
三清:
    Dalvik/ART Cache
    Cache
    Data
刷机前基本上必选三清！目的是新系统的兼容性达到最佳。
四清:
    Dalvik/ART Cache
    Cache
    Data
    System
四清针对版本差异过大的！
    重要！四清后不刷入系统无法开机进系统！！只能电脑刷或者储存卡刷，请谨慎！
五清:
    Dalvik/ART Cache
    Cache
    Data
    System
    Internal Storage（内置储存）
    一旦选了这个清除，那手机内置存储上的东西就都没有了！就不能从手机选择卡刷包了！
六清:
    Dalvik/ART Cache
    Cache
    Data
    System
    Internal Storage（内置储存）
	USB OTG
    六清清除电脑OTG传的升级包文件，一般用不上
"""

Answer2 = """底包既不是ROM也不是OTA软件包，它是一组低级驱动程序，可帮助操作系统完成其想做的任何事情。
    它包括调制解调器，蓝牙，引导程序，DSP等各种内容。
    为什么要更新底包？
    底包直接从小米提供，没有任何来源可让开发人员像自定义ROM一样自行开发和编辑，
    因此，如果要保持设备最新，请始终更新底包！
    如果我是MIUI官方用户或自定义ROM用户，是否需要更新底包？
    如果用的是官方包的是不需要的；使用自定义ROM的话看发布包的作者的说明，一般都会说清楚是否需要刷底包以及底包的版本。
"""

Answer3 = """解密DATA分区后，才能刷入第三方ROM，可以理解为是对官方系统的保护.
解密DATA会格式化数据么？
    会的，解密完成后，DATA被清空，当然也包括内置卡上也空了
    所以一定先备份好手机上的一切重要资料，包括手机存储/内置卡/外置卡上重要数据！
"""

Answer4 = """Redmi 9 Power ,Redmi 9T,Redmi Note9 4g是通用的,有一个统一代号Lime。
    Poco是小米的一个全新子品牌，Poco M3也是通用的。加上它也有一个代号叫Juice。
    所以只要刷的包是Juice或者Lime的，咱们手机都可以刷。
"""
Answer5 = """MIUI12.0.18到12.5这中间的所有版本都不能用谷歌框架,所以刷入低版本的MIUI即可解决问题。推荐使用12.0.10版的系统，下载地址：
    https://xiaomirom.com/rom/redmi-note-9-4g-9t-lime-china-fastboot-recovery-rom/
"""

Bl = """（数据无价，注意备份重要数据!!!）
手机官方为了保证手机的安全，为手机设置了BL锁，在BL锁未解的情况下，用户是不能自行刷机或获取ROOT权限的。
    解锁步骤：
    1.首先手机要绑定小米账号，新买的手机绑定后一个星期才能解锁
    2.下载解锁工具根据软件提示解锁，解锁工具下载地址：
    https://www.miui.com/unlock/index.html
"""

Rec = """（数据无价，注意备份重要数据!!!）官方自带的recovery不够用，所以要安装第三方的rec。常用的第三方rec有TWRP,橙狐（OrangeFox）,PBRP。
    刷入第三方rec步骤：
    1.在群文件>rec(官方，第三方)里找到群主（爱多功能 ｡◕‿◕｡）发的“红米note9 4G刷rec快捷工具”压缩文件，下载后解压缩。
    2.手机进入bootloder模式并连接电脑，点击解压后文件里的“1.刷入第三方rec 安卓10进入rec.bat”刷入即可。
    如何防止恢复覆盖第三方Recovery?
    一般非官方/管改系统都默认去了恢复官方recovery，所以直接卡刷ROM开机就行了并不会恢复官方recovery；如果你是卡刷官方包后，不做任何操作是肯定会恢复官方recovery的，关于如何防止恢复官方recovery办法：
        1.最常用的办法是卡刷完官方ROM包后刷个Magisk.zip就OK了。
        2.如果你并不想ROOT但是又不想恢复官方recovery，可以再卡刷完ROM后。签名boot、当然有的TWRP高级里没有签名boot功能，但是一般情况下都会有防止覆盖TWRP功能，这俩个功能实现原理不一样，但是它俩都可以防止恢复官方recovery。
    也可以参考：https://fiime.cn/thread/357 进行刷入
"""

Flash = """（数据无价，注意备份重要数据!!!）
刷机过程一般如下：
    1.刷入对应TWRP，可以参考：
        https://fiime.cn/thread/357
    2.刷入对应底包，可以参考：
        https://fiime.cn/thread/358
    3.刷入原生ROM，可以参考：
        https://fiime.cn/thread/359
"""

Rom = """按照系统来分类，分为
    1.官方包（小米官方发布）红米note9 4G-历史官方包网址：
        https://xiaomirom.com/rom/redmi-note-9-4g-9t-lime-china-fastboot-recovery-rom/
    2.官改包（在官方发布的基础上精简或者添加了额外功能）
    3.类原生包（在原生Android的基础上减少了谷歌服务框架或者增加了额外功能）
    4.通刷包（移植别的手机系统的比如魅族的flyme9,一加的OxygenOS，三星的OneUI，vivo的OriginOS） 
    群主做的包都在群文件里面，刷入时参考置顶公告进行刷入
    $(MainGroupMessage)
"""

Magisk = """Magisk又叫面具,主要用来获取root权限
安装前手机必须解锁并刷入了第三方的Rec
    1.下载Magisk的压缩包，群文件里有
    2.进入rec刷入Magisk的压缩包
    3.进入手机，打开Magisk，然后会要求重启一下
    4.重启进入手机，不出意外的话，应该成功了
    如果后面要安装Lsp,EdXposed框架的话，推荐使用搞机助手安装，搞机助手安装包群文件里有
    可以看网址：https://sspai.com/post/67932 了解更多
"""

Moudle = """Xposed/Magisk模块/软件推荐(个人接触过的，觉得好用的)
    通用的模块：
    Scene4（省电、去广告、自动点击安装软件）
    验证码提取器（从短信自动提取验证码并输入、还能自动删除验证码短信）
    Viper4AndroidFX（蝰蛇音效，提升手机音频播放效果）
    类原生：
    米窗（给类原生提供小窗功能）
    应用音量控制器（支持应用级别的音量调节）
    一加桌面
    MIUI:
    ChiMi（各种调教MIUI）
    Flyme9:
    Flyme助手（主题、字体无限试用，配置状态栏等等。。。）
    软件：
    VancedManager（去油管和油管Music的广告，还添加了些功能）
    具体安装方法，或者更多的模块去酷安探索吧｡
"""
#------
end