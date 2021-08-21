module Model
#------
export Robot
#定义群机器人信息(go-aqhttp的主接口地址，群号，机器人QQ号)
mutable struct Robot
    baseUrl ::String
    groupId ::String
    robotId ::String
end
#------
end