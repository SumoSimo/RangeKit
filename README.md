# RangeKit
A framework for ranges in Swift. Anything reusable related to ranges will be added here.

Currently, this framework supports splitting ranges using CountableRange.

## How to use

You can split an instance of CountableRange against another instance of CountableRange. For example, use the following as a guide:

|-------[]|

denotes a CountableRange, where the vertical bar, |, denotes either the lower or upper bound.

In the following, the top range denotes the range that will be split,
while the bottom range denotes the range that the first range will be split against.

```
    |-------[]|
|-------[]|
```

This results in the following:

```
          |-[]|
```

which is the remnant of the first range that was split.

Using a more concrete example:

```swift
let topRange = CountableRange(uncheckedBounds: (lower: 5, upper: 10))

let bottomRange = CountableRange(uncheckedBounds: (lower: 0, upper: 7))

let resultingRanges = topRange.split(against: bottomRange)
```

This results in an array containing CountableRange(uncheckedBounds: (lower: 7, upper: 10))
