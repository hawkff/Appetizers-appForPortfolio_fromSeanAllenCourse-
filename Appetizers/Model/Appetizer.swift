import Foundation

struct Appetizer: Decodable, Identifiable {
    let calories: Int
    let name: String
    let protein: Int
    let price: Double
    let carbs: Int
    let description: String
    let imageURL: String
    let id: Int
};

struct AppetizerResponse: Decodable {
    let request : [Appetizer]
};

struct MockData {
    static let sampleAppetizer = Appetizer(calories: 99, name: "Test Name", protein: 99, price: 99.9, carbs: 0, description: "Test Description", imageURL: "", id: 0001)
    
    static let appetizers = [sampleAppetizer,sampleAppetizer,sampleAppetizer,sampleAppetizer]
    
    static let orderOne = Appetizer(calories: 99, name: "Test Name", protein: 99, price: 99.9, carbs: 0, description: "Test Description", imageURL: "", id: 0002)
    static let orderTwo = Appetizer(calories: 99, name: "Test Name", protein: 99, price: 99.9, carbs: 0, description: "Test Description", imageURL: "", id: 0003)
    static let orderThree = Appetizer(calories: 99, name: "Test Name", protein: 99, price: 99.9, carbs: 0, description: "Test Description", imageURL: "", id: 0004)
    
    static let order66 = [orderOne, orderTwo, orderThree]
};
