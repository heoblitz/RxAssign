# RxAssign

Support Combine `Assign` subscriber in RxSwift.

`Assign` uses a KeyPath which is really nice and useful.

** RxAssign extends Driver and Signal in RxCocoa.

## At a Glance

Assign element with key path.
```swift
Driver.of("hello")
    .assign(to: \.title, on: test)
    .disposed(by: disposeBag)
```

```swift
Signal.of("world")
    .assign(to: \.test.title, on: self)
    .disposed(by: disposeBag)
```

These equivalent to `assign`
1. Subscribe using emit(or drive) and assign.
```swift
class Test {
    var title: String = ""
}

Signal.of("hello")
    .emit { (title: String) in
        test.title = title
    }
    .disposed(by: disposeBag)
```

2. Adopt ObserverType in Object and emit(or drive).
```swift
class Test: ObserverType {
    typealias Element = String
    
    var title: String = ""
    
    func on(_ event: Event<String>) {
        if case let .next(element) = event {
            title = element
        }
    }
}

Driver.of("world")
    .drive(test)
    .disposed(by: disposeBag)
```

## Dependencies
RxSwift, RxCocoa 6.0+ 

## Installation <a id="Installation"></a>

### Swift Package Manager
Project > Project Dependencies > Add &nbsp; `https://github.com/heoblitz/RxAssign`  

### Cocoapods
```ruby
pod 'RxAssign'
```

## License
MIT
