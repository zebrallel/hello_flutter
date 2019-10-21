import 'dart:math' show Rectangle;

import 'package:meta/meta.dart' show required;

import 'package:charts_common/src/common/color.dart' show Color;
import 'package:charts_common/src/common/graphics_factory.dart' show GraphicsFactory;
import 'package:charts_common/src/common/text_element.dart' show TextDirection, TextElement;
import 'package:charts_common/src/common/text_style.dart' show TextStyle;
import 'package:charts_common/src/data/series.dart' show AccessorFn;
import 'package:charts_common/src/chart/cartesian/axis/spec/axis_spec.dart' show TextStyleSpec;
import 'package:charts_common/src/chart/common/chart_canvas.dart' show ChartCanvas;
import 'package:charts_common/src/chart/bar/bar_renderer.dart' show ImmutableBarRendererElement;
import 'package:charts_common/src/chart/bar/bar_renderer_decorator.dart' show BarRendererDecorator;

class BarLabelDecorator<D> extends BarRendererDecorator<D> {
  // Default configuration
  static const _defaultLabelPosition = BarLabelPosition.auto;
  static const _defaultLabelPadding = 5;
  static const _defaultHorizontalLabelAnchor = BarLabelAnchor.start;
  static const _defaultVerticalLabelAnchor = BarLabelAnchor.end;
  static final _defaultInsideLabelStyle =
      new TextStyleSpec(fontSize: 12, color: Color.white);
  static final _defaultOutsideLabelStyle =
      new TextStyleSpec(fontSize: 12, color: Color.black);
  static final _labelSplitPattern = '\n';
  static final _defaultMultiLineLabelPadding = 2;

  /// Configures [TextStyleSpec] for labels placed inside the bars.
  final TextStyleSpec insideLabelStyleSpec;

  /// Configures [TextStyleSpec] for labels placed outside the bars.
  final TextStyleSpec outsideLabelStyleSpec;

  /// Configures where to place the label relative to the bars.
  final BarLabelPosition labelPosition;

  /// For labels drawn inside the bar, configures label anchor position.
  final BarLabelAnchor labelAnchor;

  /// Space before and after the label text.
  final int labelPadding;

  final int labelMaxWidth;

  BarLabelDecorator(
      {TextStyleSpec insideLabelStyleSpec,
      TextStyleSpec outsideLabelStyleSpec,
      this.labelAnchor = null,
      this.labelPosition = _defaultLabelPosition,
      this.labelPadding = _defaultLabelPadding,
      this.labelMaxWidth
      })
      : insideLabelStyleSpec = insideLabelStyleSpec ?? _defaultInsideLabelStyle,
        outsideLabelStyleSpec =
            outsideLabelStyleSpec ?? _defaultOutsideLabelStyle;

  @override
  void decorate(Iterable<ImmutableBarRendererElement<D>> barElements,
      ChartCanvas canvas, GraphicsFactory graphicsFactory,
      {@required Rectangle drawBounds,
      @required double animationPercent,
      @required bool renderingVertically,
      bool rtl = false}) {
    // Only decorate the bars when animation is at 100%.
    if (animationPercent != 1.0) {
      return;
    }

      _decorateVerticalBars(
          barElements, canvas, graphicsFactory, drawBounds, rtl);
  }

  void _decorateVerticalBars(
      Iterable<ImmutableBarRendererElement<D>> barElements,
      ChartCanvas canvas,
      GraphicsFactory graphicsFactory,
      Rectangle drawBounds,
      bool rtl) {
    // Create [TextStyle] from [TextStyleSpec] to be used by all the elements.
    // The [GraphicsFactory] is needed so it can't be created earlier.
    final insideLabelStyle =
        _getTextStyle(graphicsFactory, insideLabelStyleSpec);
    final outsideLabelStyle =
        _getTextStyle(graphicsFactory, outsideLabelStyleSpec);

    for (var element in barElements) {
      final labelFn = element.series.labelAccessorFn;
      final datumIndex = element.index;
      final label = (labelFn != null) ? labelFn(datumIndex) : null;

      // If there are custom styles, use that instead of the default or the
      // style defined for the entire decorator.
      final datumInsideLabelStyle = _getDatumStyle(
          element.series.insideLabelStyleAccessorFn,
          datumIndex,
          graphicsFactory,
          defaultStyle: insideLabelStyle);
      final datumOutsideLabelStyle = _getDatumStyle(
          element.series.outsideLabelStyleAccessorFn,
          datumIndex,
          graphicsFactory,
          defaultStyle: outsideLabelStyle);

      // Skip calculation and drawing for this element if no label.
      if (label == null || label.isEmpty) {
        continue;
      }

      var labelElements = label
          .split(_labelSplitPattern)
          .map((labelPart) => graphicsFactory.createTextElement(labelPart));

      final bounds = element.bounds;

      // Get space available inside and outside the bar.
      final totalPadding = labelPadding * 2;
      final insideBarHeight = bounds.height - totalPadding;
      final outsideBarHeight = drawBounds.height - bounds.height - totalPadding;

      var calculatedLabelPosition = labelPosition;
      if (calculatedLabelPosition == BarLabelPosition.auto) {
        // For auto, first try to fit the text inside the bar.
        labelElements = labelElements.map(
            (labelElement) => labelElement..textStyle = datumInsideLabelStyle);

        final labelMaxWidth = labelElements
            .map(
                (labelElement) => labelElement.measurement.horizontalSliceWidth)
            .fold(0, (max, current) => max > current ? max : current);

        // Total label height depends on the label element's text style.
        final totalLabelHeight = _getTotalLabelHeight(labelElements);

        // A label fits if the length and width of the text fits.
        calculatedLabelPosition =
            totalLabelHeight < insideBarHeight && labelMaxWidth < bounds.width
                ? BarLabelPosition.inside
                : BarLabelPosition.outside;
      }

      // Set the max width, text style, and text direction.
      labelElements = labelElements.map((labelElement) => labelElement
        ..textStyle = calculatedLabelPosition == BarLabelPosition.inside
            ? datumInsideLabelStyle
            : datumOutsideLabelStyle
        ..maxWidth = this.labelMaxWidth ?? bounds.width
        ..textDirection = rtl ? TextDirection.rtl : TextDirection.ltr);

      // Total label height depends on the label element's text style.
      final totalLabelHeight = _getTotalLabelHeight(labelElements);

      var labelsDrawn = 0;
      for (var labelElement in labelElements) {
        // Calculate the start position of label based on [labelAnchor].
        int labelY;
        final labelHeight = labelElement.measurement.verticalSliceWidth.round();
        final offsetHeight =
            (labelHeight + _defaultMultiLineLabelPadding) * labelsDrawn;

        if (calculatedLabelPosition == BarLabelPosition.inside) {
          final _labelAnchor = labelAnchor ?? _defaultVerticalLabelAnchor;
          switch (_labelAnchor) {
            case BarLabelAnchor.end:
              labelY = bounds.top + labelPadding + offsetHeight;
              break;
            case BarLabelAnchor.middle:
              labelY = (bounds.bottom -
                      bounds.height / 2 -
                      totalLabelHeight / 2 +
                      offsetHeight)
                  .round();
              break;
            case BarLabelAnchor.start:
              labelY = bounds.bottom -
                  labelPadding -
                  totalLabelHeight +
                  offsetHeight;
              break;
          }
        } else {
          // calculatedLabelPosition == LabelPosition.outside
          labelY = bounds.top - labelPadding - totalLabelHeight + offsetHeight;
        }

        // Center the label inside the bar.
        final labelX = (bounds.left +
                bounds.width / 2 -
                labelElement.measurement.horizontalSliceWidth / 2)
            .round();

        canvas.drawText(labelElement, labelX, labelY);
        labelsDrawn += 1;
      }
    }
  }

  /// Helper function to get the total height for a group of labels.
  /// This includes the padding in between the labels.
  int _getTotalLabelHeight(Iterable<TextElement> labelElements) =>
      (labelElements.first.measurement.verticalSliceWidth *
              labelElements.length)
          .round() +
      _defaultMultiLineLabelPadding * (labelElements.length - 1);

  // Helper function that converts [TextStyleSpec] to [TextStyle].
  TextStyle _getTextStyle(
      GraphicsFactory graphicsFactory, TextStyleSpec labelSpec) {
    return graphicsFactory.createTextPaint()
      ..color = labelSpec?.color ?? Color.black
      ..fontFamily = labelSpec?.fontFamily
      ..fontSize = labelSpec?.fontSize ?? 12
      ..lineHeight = labelSpec?.lineHeight;
  }

  /// Helper function to get datum specific style
  TextStyle _getDatumStyle(AccessorFn<TextStyleSpec> labelFn, int datumIndex,
      GraphicsFactory graphicsFactory,
      {TextStyle defaultStyle}) {
    final styleSpec = (labelFn != null) ? labelFn(datumIndex) : null;
    return (styleSpec != null)
        ? _getTextStyle(graphicsFactory, styleSpec)
        : defaultStyle;
  }
}

/// Configures where to place the label relative to the bars.
enum BarLabelPosition {
  /// Automatically try to place the label inside the bar first and place it on
  /// the outside of the space available outside the bar is greater than space
  /// available inside the bar.
  auto,

  /// Always place label on the outside.
  outside,

  /// Always place label on the inside.
  inside,
}

/// Configures where to anchor the label for labels drawn inside the bars.
enum BarLabelAnchor {
  /// Anchor to the measure start.
  start,

  /// Anchor to the middle of the measure range.
  middle,

  /// Anchor to the measure end.
  end,
}
