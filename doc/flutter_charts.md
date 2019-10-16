---
theme: 'Moon'
controls: false
transition: 'slide'
enableTitleFooter: false
---

# chart types

- Bar charts
- Time series charts
- Line Charts
- Scatter plot charts
- Combo Charts
- Pie Charts

---

# conception

- Domain  e.g. 交通工具
- Measure  e.g. 销量
- Data point ('轿车'，5000)
- Series 
- Tick 刻度
- Legend 图例
- Behavior 行为

---

```dart
var series = [
  new charts.Series(
    id: 'Clicks',
    domainFn: (ClicksPerYear clickData, _) => clickData.year,
    measureFn: (ClicksPerYear clickData, _) => clickData.clicks,
    colorFn: (ClicksPerYear clickData, _) => clickData.color,
    data: data,
  ),
];

class ClicksPerYear {
  String year;
  int clicks;
  Color color;

  ClicksPerYear({this.year, this.clicks, this.color});
}
```

---

# BarGroupingType

- grouped
- stacked
- groupedStacked

---

# domain axis & measure axis

* domainAxis
* primaryMeasureAxis
* secondaryMeasureAxis

---

# OrdinalAxisSpec

- viewport
- renderSpec
  - GridLineRendererSpec
  - SmallTickRendererSpec
  - NoneRenderSpec
- scaleSpec
  - SimpleOrdinalScaleSpec
  - FixedPixelSpaceOrdinalScaleSpec
  - FixedPixelOrdinalScaleSpec
- tickProviderSpec
  - BasicOrdinalTickProviderSpec
  - StaticOrdinalTickProviderSpec
- tickFormatterSpec
  - BasicOrdinalTickFormatterSpec
- showAxisLine

---

# BarRenderDecorator

- BarLabelDecorator
  - insideLabelStyleSpec
  - outsideLabelStyleSpec
  - labelAnchor
  - labelPosition
  - labelPadding

# BarRendererConfig

- cornerStrategy
- fillPattern
- groupingType
- layoutPaintOrder

# behaviors

# selectionModels
