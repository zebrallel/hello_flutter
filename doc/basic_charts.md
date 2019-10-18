[google/charts]('https://github.com/google/charts')

# 基本概念

- Domain  e.g. 交通工具
- Measure  e.g. 销量
- Data point ('轿车'，5000)
- Series 
- Tick 刻度
- Legend 图例
- Behavior 行为

# 实现一个图表

* 定义series
  * id
  * data
  * domainFn
  * measureFn
* 禁用默认交互
  * defaultInteractions
* 自定义measure颜色
  * colorFn
* 动态改变measure
* 添加measure label
  * barRendererDecorator
* 添加图例
  * SeriesLegend
* 自定义measure axis刻度
  * primaryMeasureAxis
  * tickProviderSpec
* 添加CustomLine
  * customSeriesRenderers
  * LineRendererConfig
  * customRendererId
  * charts.rendererIdKey
* 添加viewport
  * OrdinalViewPort
* 添加pan and zoom
  * SlidingViewport
  * PanAndZoomBehavior