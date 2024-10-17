# FlexiDecodable for Swift

**FlexiDecodable** is a lightweight, flexible, and easy-to-use library for decoding JSON data into Swift types, providing **type coercion** with fallback support. It allows you to seamlessly handle different data types coming from a JSON response and automatically convert them to the expected types in your model. 

This library is especially useful when dealing with API responses that may contain multiple types for a single field (e.g., `String`, `Int`, `Float`, `Double`, etc.), making it easier to work with inconsistent data structures.

[!IMPORTANT] The current version is still in development. There may be breaking changes in version updates until version 1.0.

## Features:

- **Type Coercion with Fallback**: Automatically convert `String`, `Int`, `Float`, `Double`, and `Bool` types to your model's expected type.
- **Flexible Data Handling**: Coerce data from different types (e.g., `"true"` string to `Bool`, `"1"` string to `Int`, etc.).
- **Error Handling**: Throws clear errors if the type conversion fails, ensuring data integrity.
- **Easy Integration**: Seamless integration with your existing Swift codebase using the standard `Decodable` protocol.
- **Customizable for Future Types**: Easily extendable to support other types like `Date`, `URL`, etc.

[!CAUTION] 🚨 Breaking changes:
- **Version 0.1.0**: Initial release with support for `String`, `Int`, `Float`, `Double`, and `Bool` coercion.

## Demo

Usage of the library is simple and can be seen in the example provided below:

```swift
struct WelcomeModel: FlexiDecodable {
    let id: String?
    let title: String
    let type: Int?
    let category: Float?
}

let jsonData = """
{
    "id": "123",
    "title": "Welcome",
    "type": "1",
    "category": "45.67"
}
""".data(using: .utf8)!

do {
    let decodedModel = try JSONDecoder().decode(WelcomeModel.self, from: jsonData)
    print(decodedModel)  // Outputs: WelcomeModel(id: "123", title: "Welcome", type: 1, category: 45.67)
} catch {
    print("Decoding failed: \(error)")
}
```

## Installation

### Swift Package Manager

Add the following to your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/your-username/FlexiDecodable.git", from: "1.0.0")
]
```

### Cocoapods

Add the following line to your `Podfile`:

```ruby
pod 'FlexiDecodable', '~> 1.0.0'
```

Then run:

```bash
pod install
```

or

```bash
pod update
```

## Usage

### Basic Usage

Here's how to use **FlexiDecodable** in your Swift model:

```swift
struct MyModel: FlexiDecodable {
    let id: String?
    let isActive: Bool?
    let amount: Float?
}

let jsonData = """
{
    "id": "456",
    "isActive": "true",
    "amount": "99.99"
}
""".data(using: .utf8)!

do {
    let model = try JSONDecoder().decode(MyModel.self, from: jsonData)
    print(model)  // Outputs: MyModel(id: "456", isActive: true, amount: 99.99)
} catch {
    print("Decoding failed: \(error)")
}
```

### Options for Custom Types

While the basic functionality works out of the box for `String`, `Int`, `Float`, `Double`, and `Bool`, you can extend the functionality in the future as needed. **FlexiDecodable** is built with extensibility in mind.

### Supported Types

#### String
- Can be converted from `String`, `Int`, `Float`, `Double`.

#### Int
- Can be converted from `String`, `Float`, `Double`.

#### Float
- Can be converted from `String`, `Int`, `Double`.

#### Double
- Can be converted from `String`, `Int`, `Float`.

#### Bool
- Can be converted from `String` ("true"/"false") or `Int` (1 for `true`, 0 for `false`).

### Customizing for Future Types

You can extend the library to support additional types (like `Date`, `URL`, etc.) by adding new `decodeWithFallback` functions for each type.

## Options

You can extend the `decodeWithFallback` method to handle more types in the future as needed. Right now, it supports:

- **String**: Converts from `String`, `Int`, `Float`, `Double`.
- **Int**: Converts from `String`, `Float`, `Double`.
- **Float**: Converts from `String`, `Int`, `Double`.
- **Bool**: Converts from `String` ("true"/"false") or `Int` (1 for `true`, 0 for `false`).

## License

**FlexiDecodable** is available under the MIT license. See the [LICENSE](LICENSE) file for more information.

---
