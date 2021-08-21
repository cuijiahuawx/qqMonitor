module Utils
#------
include("Text.jl")
using .Text
using HTTP, JSON, URIs
using Gumbo, Cascadia

export getDotOSVersion, getEvolutionXVersion, checkDotOSVersion, checkEvolutionXVersion, sendMessage, groupSendMessage, getNickname, initialMembers, checkNewMembers, getGroupMessage, monitorGroupMeaasage

#获取DotOS版本信息
function getDotOSVersion()
    try
        content = HTTP.request("GET", "https://www.droidontime.com/juice")
        source = parsehtml(String(content.body))
        focuse = source.root[2][4][2][3][1][1][1][2].text
        version = split(strip(focuse), "-")[3]
        return version
    catch e
        println("获取DotOS版本信息失败")
    end
end

#监听DotOS版本变化
function checkDotOSVersion(robot, DotOSVersion)
    newDotOSVersion = getDotOSVersion()
    if newDotOSVersion !=  DotOSVersion && occursin(newDotOSVersion, "v")
        dotOSMessage = """DotOS更新到$(newDotOSVersion)了！！！下载链接：
        https://www.droidontime.com/juice
        如果自己网速不好的话，可以去$(MainGroupMessage)
        """
        groupSendMessage(robot, dotOSMessage)
    end
    return newDotOSVersion
end

#获取EvolutionX版本信息
function getEvolutionXVersion()
    try
        content = HTTP.request("GET", "https://sourceforge.net/projects/evolution-x/files/juice/")
        source = parsehtml(String(content.body))
        versionInfo = eachmatch(Selector(".file .name"), source.root)[1][1]
        version =  split(versionInfo.text, "_")[2]
        return version
    catch e
        println("获取EvolutionX版本信息失败")
    end
end

#监听EvolutionX版本变化
function checkEvolutionXVersion(robot, EvolutionXVersion)
    newEvolutionXVersion = getEvolutionXVersion()
    if newEvolutionXVersion != EvolutionXVersion && occursin(newEvolutionXVersio, "v")
        EvolutionXMessage = """EvolutionX更新到$(newEvolutionXVersion)了！！！下载链接：
        https://sourceforge.net/projects/evolution-x/files/juice/
        如果自己网速不好的话，可以去$(MainGroupMessage)
        """
        groupSendMessage(robot, EvolutionXMessage)
    end
    return newEvolutionXVersion
end

#初始化群成员列表
function initialMembers(robot)
    members = Set()
    membersUrl = URI(robot.baseUrl * "/get_group_member_list")
    membersUrl = URI(membersUrl; query=Dict("group_id" => robot.groupId))
    try 
        membersResponse = HTTP.request("GET", string(membersUrl))
        membersContent = membersResponse.body |> String |> JSON.parse
        membersList = membersContent["data"]
        for member = membersList
            qqID = member["user_id"]
            push!(members, qqID)
        end
        return members
    catch e
        println("初始化群成员列表失败")
    end
end

#监听群内成员变化
function checkNewMembers(robot, members)
    newMembers = initialMembers(robot)
    newOne = setdiff(newMembers, members)
    if isempty(newOne) != true
        qqID = pop!(newOne)
        nickname = getNickname(robot, qqID)
        welcome = """[CQ:at,qq=$(qqID)] 
        Hello,$(nickname)。欢迎你来到红米Note9 4g交流群[CQ:face,id=137][CQ:face,id=137][CQ:face,id=137]
            进群先看群公告。经验表明，你想问的很多问题酷安和百度已经有了答案。
            $(Default)
        """
        groupSendMessage(robot, welcome)
        union!(members, newMembers)
    end
    return members
end

#往群内发送消息
function groupSendMessage(robot, message)
    url = URI(robot.baseUrl * "/send_group_msg")
    url = URI(url; query=Dict("group_id" => robot.groupId, "message" => message))
    HTTP.request("GET", string(url))
    println("向$(robot.groupId)群里发送了:$(message)")
end

#针对个人发送消息
function sendMessage(robot, qqID, message)
    message = "[CQ:at,qq=$(qqID)]" * message
    groupSendMessage(robot, message)
end

#根据QQ号获取对方昵称
function getNickname(robot, qqID)
    url = URI(robot.baseUrl * "/get_group_member_info")
    url = URI(url; query=Dict("group_id" => robot.groupId, "user_id" => qqID))
    try
        response = HTTP.request("GET", string(url))   
        content = response.body |> String |> JSON.parse
        nickname = content["data"]["nickname"]
    catch e
        println("根据QQ号获取对方昵称失败")
    end
end

#监听群内消息
function getGroupMessage(robot)
    url = URI(robot.baseUrl * "/get_group_msg_history")
    url = URI(url; query=Dict("group_id" => robot.groupId))
    try 
        response = HTTP.request("GET", string(url))
        content = response.body |> String |> JSON.parse
        return content
    catch e
        println("监听群内消息失败")
    end
end

#监听群内消息，根据消息，匹配内容进行回应
function monitorGroupMeaasage(robot, content)
    try
        content = content["data"]["messages"][end]["message"]
        if occursin("没有", content) || occursin("消失", content) || occursin("覆盖", content) && occursin("twrp", content)
            groupSendMessage(robot, twrpCoverMessage)
        elseif occursin("下载", content) && (occursin("qq", content) || occursin("QQ", content))
            groupSendMessage(robot, "QQ文件保存目录为/storage/emulated/0/Android/data/com.tencent.mobileqq/Tencent/QQfile_recv/")
            println(occursin("下载", content))
            println(occursin("qq", content))
            println(occursin("QQ", content))
        end
        println(content)
        if occursin("[CQ:at,qq=3416619995]", content)
            content = replace(content, "[CQ:at,qq=3416619995]" => "")
            println(content)
            if occursin("解锁", content)
                groupSendMessage(robot, Bl)
                println("在这里吗？")
            elseif occursin("rec", content)
                groupSendMessage(robot, Rec)
            elseif occursin("刷机", content)
                groupSendMessage(robot, Flash)
            elseif occursin("rom", content)
                groupSendMessage(robot, Rom)
            elseif occursin("magisk", content)
                groupSendMessage(robot, Magisk)
            elseif occursin("模块", content)
                groupSendMessage(robot, Moudle)
            elseif occursin("1", content)
                groupSendMessage(robot, Answer1)
            elseif occursin("2", content)
                groupSendMessage(robot, Answer2)
            elseif occursin("3", content)
                groupSendMessage(robot, Answer3)
            elseif occursin("4", content)
                groupSendMessage(robot, Answer4)
            elseif occursin("5", content)
                groupSendMessage(robot, Answer5)
            elseif occursin("6", content)
                groupSendMessage(robot, viper4AndroidMessage)
            elseif occursin("你是", content)
                groupSendMessage(robot, whoIam)
                groupSendMessage(robot, "[CQ:image,file=http://pic.bkill.com/img/download/20170520130402784.jpg]")
            else
                groupSendMessage(robot, Default)
            end
        end
    catch e
        println("没有发现信息")
    end
end
#------
end