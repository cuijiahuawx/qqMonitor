include("Text.jl")
include("Utils.jl")
include( "Model.jl")
using .Text, .Utils, .Model
using HTTP, JSON, URIs

#创建群机器人
# robot = Robot("http://192.168.1.102:5700", "130810319", "3416619995")
robot = Robot("http://192.168.1.102:5700", "1046910350", "3416619995")
println("创建群机器人")

target1 = 929068429
target2 = 1074879215
# target2 = 2509605080
targetImgList = ["[CQ:image,file=http://qqpublic.qpic.cn/qq_public/0/0-2820394294-D7C9ADD614475855E5A5C651BF706920/0]", "[CQ:image,file=http://www.bkill.com/u/upload/2017/05/20/202107572100.jpeg]"]

#初始化群成员列表
members = initialMembers(robot)
println("初始化群成员列表")

#获取初始DotOS的版本
# DotOSVersion = getDotOSVersion()
#开启循环
println("开启循环")
while true
    # global robot, members, DotOSVersion, target
    global robot, members
    #监视各个ROM的版本状态
    # DotOSVersion = checkDotOSVersion(robot, DotOSVersion)
    #判断是否有新成员加入
    members =  checkNewMembers(robot, members)
    #监听群内消息
    content = getGroupMessage(robot)
    #根据消息，匹配内容进行回应
    monitorGroupMeaasage(robot, content)
    # 针对个人回消息
    try
        qqID = content["data"]["messages"][end]["user_id"]
        if target1 == qqID || target2 == qqID
            sendMessage(robot, qqID, rand(targetImgList))
        end
    catch e
        println("针对个人回消息失败")
    end
end
