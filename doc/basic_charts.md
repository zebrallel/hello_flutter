# 基本概念

- Domain  e.g. 交通工具
- Measure  e.g. 销量
- Data point ('轿车'，5000)
- Series 
- Tick 刻度
- Legend 图例
- Behavior 行为

# 实现一个柱状图

* 定义series
  * id
  * data
  * domainFn
  * measureFn
* 禁用默认交互
* 自定义measure颜色
* 动态改变measure
* 添加measure label
* 添加图例
* 自定义measure axis刻度
  * primaryMeasureAxis
  * tickProviderSpec