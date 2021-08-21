include("Text.jl")
include("Utils.jl")
include( "Model.jl")
using .Text, .Utils, .Model

robot = Robot("http://192.168.1.102:5700", "130810319", "3416619995")
groupSendMessage(robot, "[CQ:image,file=,type=show,id=40004]")https://exp-picture.cdn.bcebos.com/2a1ecb460596b814e9fce0b043d246fe464e2283.jpg?x-bce-process=image%2Fresize%2Cm_lfit%2Cw_500%2Climit_1%2Fquality%2Cq_80