import Foundation

// Custom protocol to allow flexible decoding with fallback logic
public protocol FlexiDecodable: Decodable {
    static func decodeWithFallback(from decoder: Decoder) -> Self?
}

// Default implementation of `decodeWithFallback` for `FlexiDecodable` types
public extension FlexiDecodable {

    static func decodeWithFallback(from decoder: Decoder) -> Self? {
        let container = try? decoder.singleValueContainer()

        // Attempt to decode the value directly into the desired type (Self)
        if let value = try? container?.decode(Self.self) {
            return value
        }

        // Fallback to other type conversions if direct decoding fails:

        // Try converting from String
        if let stringValue = try? container?.decode(String.self) {
            return transformFromString(stringValue)
        }
        
        // Try converting from Int
        else if let intValue = try? container?.decode(Int.self) {
            return transformFromInt(intValue)
        }
        
        // Try converting from Float
        else if let floatValue = try? container?.decode(Float.self) {
            return transformFromFloat(floatValue)
        }
        
        // Try converting from Double
        else if let doubleValue = try? container?.decode(Double.self) {
            return transformFromDouble(doubleValue)
        }

        // If no valid type conversion is found, print an error and return nil
        print("Error: Unable to decode or convert value into \(Self.self). Returning nil instead.")
        return nil
    }

    // Convert from String to Self (generic method)
    private static func transformFromString(_ value: String) -> Self? {
        // Handle known types for conversion, e.g., "true"/"false" to Bool, "123" to Int
        if let boolValue = transformStringToBool(value), let convertedValue = boolValue as? Self {
            return convertedValue
        }

        if let intValue = Int(value), let convertedValue = transformFromInt(intValue) {
            return convertedValue
        }

        if let doubleValue = Double(value), let convertedValue = transformFromDouble(doubleValue) {
            return convertedValue
        }

        // If no known transformation works, return nil
        print("Error: Invalid string value for \(Self.self).")
        return nil
    }

    // Convert from Int to Self
    private static func transformFromInt(_ value: Int) -> Self? {
        // Manually handle conversion from Int to Self using custom logic
        // This is where we can use casting or specific initialization logic
        return value as? Self
    }

    // Convert from Float to Self
    private static func transformFromFloat(_ value: Float) -> Self? {
        // Manually handle conversion from Float to Self using custom logic
        // This is where we can use casting or specific initialization logic
        return value as? Self
    }

    // Convert from Double to Self
    private static func transformFromDouble(_ value: Double) -> Self? {
        // Manually handle conversion from Double to Self using custom logic
        // This is where we can use casting or specific initialization logic
        return value as? Self
    }

    // Special conversion for Boolean from String
    private static func transformStringToBool(_ value: String) -> Bool? {
        if value.lowercased() == "true" {
            return true
        } else if value.lowercased() == "false" {
            return false
        }
        return nil
    }
}
