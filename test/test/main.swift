//
//  main.swift
//  test
//
//  Created by t2023-m0024 on 1/23/24.
//

import Foundation

// Function to arrange food for the Food Fight Contest based on quantity and caloric order.
func solution(_ food: [Int]) -> String {
    // Extracting the water quantity from the first element of the food array.
    let water = food[0]
    // Calculating the number of food items (excluding water).
    let foodCount = food.count - 1
    
    // Arrays to store food items for the left and right players.
    var leftFood = [Int]()
    var rightFood = [Int]()
    
    // Loop through each food item (excluding water) to distribute quantities to left and right players.
    for i in 1...foodCount {
        // Calculating the half quantity and the remainder for each food item.
        let half = food[i] / 2
        let remainder = food[i] % 2
        // Distributing the food quantities to the left and right players based on the half and remainder.
        leftFood += Array(repeating: i, count: half + remainder)
        rightFood += Array(repeating: i, count: half)
    }
    
    // Sorting the left array in ascending order and the right array in descending order.
    leftFood.sort()
    rightFood.sort(by: >)
    
    // Combining the left food array, water array, and right food array to form the final result array.
    let result = leftFood + Array(repeating: water, count: food[0]) + rightFood
    
    // Converting the result array to a string by mapping each element to a string and joining them.
    return result.map { String($0) }.joined()
}

// Main function to handle user input and execute the solution function.
func main() {
    // Prompting the user to enter the quantities of water and food.
    print("Enter the quantities of water and food (separated by space):", terminator: " ")
    
    // Reading the user input as a string.
    guard let input = readLine() else {
        print("Invalid input. Please enter valid values.")
        exit(1)
    }
    
    // Splitting the input string into an array of integers.
    let quantities = input.components(separatedBy: " ").compactMap { Int($0) }
    
    // Checking if the required number of values are provided.
    guard quantities.count > 1 else {
        print("Invalid input. Please enter both water and food quantities.")
        exit(1)
    }

    // Executing the solution function with user input.
    let result = solution(quantities)
    
    // Printing the result.
    print("Food Fight Contest Result: \(result)")
}

// Calling the main function to start the execution.
main()
