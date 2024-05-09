# NetEC-bmv2

本项目为NetEC论文在模拟器环境下的概念demo，用于展示可以采用查表法在可编程交换机上实现Reed-Solomon编解码。真实环境实验和其他信息详见论文。https://ieeexplore.ieee.org/abstract/document/9693136

# 需求：
[minimet](https://mininet.org/): 网络模拟器

[behavior_model](https://github.com/p4lang/behavioral-model): P4交换机软件实现

# 目录解析

## 主目录
netec.p4, mult.p4, xor.p4: p4核心逻辑

netec.py, p4_mininet.py: 模拟器脚本

## src

BMPSend.java: 简易发包器，按自定义格式打包bmp文件，使得能够被交换机逻辑处理。

BMPRecv.java: 简易收包器，按自定义格式解析bmp文件，并保存。

LogTableSend.java: 将伽罗华域上的对数指数表（scripts/logtables.txt）按自定义格式发送给交换机实例，存入交换机芯片内存。注：控制平面下发性能太慢。

## scripts

commands.txt: 解码需要的参数，事先计算好（略去理论部分）

log_tables.txt: 16位伽罗华域上的对数指数表

## pics

blue.bmp, orange.bmp, pink.bmp: 被保护的数据。

coding1.bmp, coding1.bmp, coding3.bmp: 计算出的校验数据。

注：通过设置编码矩阵，使得coding1.bmp是上述三个彩色图片的简单异或，文件头部并未损坏，且文件内容叠加，因此coding1.bmp可以直接打开肉眼观察，而coding2.bmp和coding3.bmp无文件语义。

## meta_programs: 

一系列可配置参数的python脚本用于生成根目录下的p4子程序


# 编码实验

1. ```sudo mn -c```
2. ```sudo python netec.py --behavioral-exe ../behavioral-model/targets/simple_switch/simple_switch --json ./netec.json --num-hosts 4```
3. mininet>```xterm h1 h2 h3 h4```
4. h1: ```java BMPRecv 10.0.0.1```
5. h2: ```java LogTableSend ./scripts/log_tables.txt``` (run this script on h2/h3/h4)
6. h2: ```java BMPSend ./pics/pink.bmp ```
7. h3: ```java BMPSend ./pics/blue.bmp ```
8. h4: ```java BMPSend ./pics/orange.bmp ```
9. 等待h1写入recon.bmp
10. recon.bmp为3个bmp文件直接异或，可打开肉眼观察，应与./pics/coding1.bmp一致。

# 解码实验
1. ```sudo mn -c```
2. ```sudo python netec.py --behavioral-exe ../behavioral-model/targets/simple_switch/simple_switch --json ./netec.json --num-hosts 4```
3. ```../behavioral-model/targets/simple_switch/simple_switch_CLI < ./scripts/commands.txt``` (replace with your behavioral-model path)
4. mininet>```xterm h1 h2 h3 h4```
5. h1: ```java BMPRecv 10.0.0.1```
6. h2: ```java LogTableSend ./scripts/log_tables.txt```(run this script on h2/h3/h4)
7. h2: ```java BMPSend ./pics/coding1.bmp ```
8. h3: ```java BMPSend ./pics/coding2.bmp ```
9. h4: ```java BMPSend ./pics/coding3.bmp ```
10. 等待h1写入recon.bmp
11. recon.bmp为解码出的重建图像，应与./pics/blue.bmp一致
