# RxAssign

Support Combine `assign` subscriber in RxSwift.

RxAssign extends Driver and Signal in RxCocoa.

## At a Glance

Assign element with key path.
```swift
Driver.of("hello")
    .assign(to: \.text, on: titleLabel)
    .disposed(by: disposeBag)
```

```swift
Signal.of("world")
    .assign(to: \.text, on: titleLabel)
    .disposed(by: disposeBag)
```

without RxAssign
1. Subscribe using emit(or drive) and assign.
```swift
class Test {
    var title: String = ""
}

Signal.of("world")
    .emit { (title: String) in
        test.title = title
    }
    .disposed(by: disposeBag)
```

2. Adopt ObserverType in Object and emit(or drive).


## Installation <a id="Installation"></a>

### Swift Package Manager
Project > Project Dependencies > Add &nbsp; `https://github.com/heoblitz/SwiftPreview`  


## License
MIT
