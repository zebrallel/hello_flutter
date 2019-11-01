# 架构

dart framework

# Dart

### final & const

const: 意味着编译时完全确定，并且不可变
final: 类似于js中的const

### var & dynamic

var: 第一次执行后会确定类型，之后不可再改变
dynamic: 动态类型，类型不固定

### Future, Stream, Generator

### abstract, implement, with, mixin

dart里没有interface

implements: 实现这个class内的所有方法和变量
with: 使用mixin, mixin on 可以指定其必须继承的父类

# Life cycle

createState
initState

didUpdateWidget

didChangeDependencies
deactive
dipose

# Widget & Element & RenderObject

widget: immutable对象，每次state发生变化都会创建一个新的widget
element: 持有（widget，renderObject)，保存上下文信息
renderObject：保存大量绘制相关的信息

# Layout

https://zhuanlan.zhihu.com/p/51961551
