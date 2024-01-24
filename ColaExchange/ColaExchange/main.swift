//
//  main.swift
//  ColaExchange
//
//  Created by t2023-m0024 on 1/24/24.
//

import Foundation

func colaExchange(a: Int, b: Int, n: Int) -> Int {
    var totalCola = 0
    var remainingBottles = n

    while remainingBottles >= a {
        let exchangedCola = remainingBottles / a * b
        totalCola += exchangedCola
        remainingBottles = remainingBottles % a + exchangedCola
    }

    return totalCola
}

// 커맨드 라인 인자 확인
guard CommandLine.arguments.count == 1 else {
    print("Usage: ./colaExchange.swift")
    exit(1)
}

// 사용자로부터 입력 받기
print("Enter the number of bottles to exchange (a):", terminator: " ")
guard let a = Int(readLine() ?? "") else {
    print("Invalid input for a.")
    exit(1)
}

print("Enter the number of cola bottles received per exchange (b):", terminator: " ")
guard let b = Int(readLine() ?? "") else {
    print("Invalid input for b.")
    exit(1)
}

print("Enter the initial number of empty bottles (n):", terminator: " ")
guard let n = Int(readLine() ?? "") else {
    print("Invalid input for n.")
    exit(1)
}

// 결과 출력
let result = colaExchange(a: a, b: b, n: n)
print("Total Cola Bottles: \(result)")
