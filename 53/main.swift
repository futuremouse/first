//
//  main.swift
//  53
//
//  Created by t2023-m0024 on 1/26/24.
//

func solution(_ k: Int, _ score: [Int]) -> [Int] {
    var result: [Int] = []
    var hallOfFame: [Int: Int] = [:] // 가수의 점수와 출현 횟수를 저장할 딕셔너리

    // 가수의 점수를 딕셔너리에 저장
    for s in score {
        hallOfFame[s, default: 0] += 1
    }

    // 명예의 전당에 속한 가수의 최하위 점수를 구함
    var previousCount = 0
    for i in 0..<score.count {
        let currentScore = score[i]
        let currentCount = hallOfFame[currentScore]!

        if i >= k && currentCount == previousCount {
            continue // 현재 점수와 이전 점수가 같고, k번째 이후라면 건너뜀
        }

        result.append(currentScore)
        previousCount = currentCount
    }

    return result
}

