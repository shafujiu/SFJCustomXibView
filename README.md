# SFJCustomXibView
介绍如何在xib/storyboard中使用xib自定义的view
# 如何把自己通过xib 或者sb 自定义的View使用在SB中、？

## 1. xib 部分
![image](http://on5ajnh9a.bkt.clouddn.com/1494317817.png)

## 2. 代码部分
需要重写 `(instancetype)initWithCoder:(NSCoder *)aDecoder`
```
- (UIView *)p_colorView{
    SFJColorView *colorView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] lastObject];
    return colorView;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        UIView *view = [self p_colorView];
        view.frame = self.bounds; 
        [self addSubview:view];
    }
    return self;
}
```
> 值得注意的是，内部的view的frame 的设置。我们通过XIB创建出来的文件他的size如果没有指定的话，那么 就默认会是xib创建出来的大小。

注意
``` 
/** 注意这里的owner传的self 是class 官方要求是 The object to assign as the nib’s File's Owner object.
    需要的是实例对象而不是class对象。
+ (UIView *)view{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] lastObject];
}
*/
```

## 3. 使用
在创建好的xib 或者sb文件中进行如下设置（跟普通创建一样，创建好UIView后，跟改其class即可）
![image](http://on5ajnh9a.bkt.clouddn.com/1494318783.png)

> 注意：
> 1. -(instancetype)initWithFrame:通常代码初始化使用。
> 2. -(instancetype)initWithCoder:XIB/SB 初始化的时候会调用。
> 3. 初始化完成之后，回调用awakeFromNib方法


> - loadNibNamed: owner: options: 与 - initWithCoder: 的关系，加载xib 或者sb文件的时候会调用 - initWithCoder:

# 另一种方式（多此一举）。

## 1. xib部分
与上面一样，但是得增加一个步骤，链接view作为该类的属性
![image](http://on5ajnh9a.bkt.clouddn.com/1494381281.png)

## 2. 代码部分
同样需要重写`initWithCoder`方法
```
- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self p_setup];
//        [self p_commonInit];
    }
    return self;
}


- (void)p_setup{
    [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil];
    [self addSubview:self.view];
    self.view.frame = self.bounds;
}
```
## 3. 使用 与上面一样
> 注意调用的顺序，首先在我们的sb或者xib中，我们的自定义View被加载的时候，会调用自定义View的initWithCoder，此时就会调用我们的自定义函数p_setup，在这个函数里面会加载 loadNibNamed（创建出view）> 然后在添加到自定义View上。

> 关键点就在于，我们的自定义view的view属性的加载。

> 总结：两者的区别在于，是否将xib创建的view作为File's Owner （自定义view类）的属性。
