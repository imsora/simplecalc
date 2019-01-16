//
//  main.swift
//  SimpleCalc
//
//  Created by Ted Neward on 10/3/17.
//  Copyright © 2017 Neward & Associates. All rights reserved.
//

import Foundation

public class Calculator {
    public func calculate(_ args: [String]) -> Int {
        let operators = ["+", "-", "/", "*", "%"]
        var ans = 0
        if(args.count > 1){
            if operators.contains(args[1]) {
                let intOne = Int(args[0])!
                let intTwo = Int(args[2])!
                if args[1] == "+" {
                    ans = intOne + intTwo
                }
                if args[1] == "-" {
                    ans = intOne - intTwo
                }
                if args[1] == "/" {
                    ans = intOne / intTwo
                }
                if args[1] == "*" {
                    ans = intOne * intTwo
                }
                if args[1] == "%" {
                    ans = intOne % intTwo
                }
            }
        }
        let size = args.count
        if args[size - 1] == "count"{
            for arg in args{
                if Int(arg) != nil{
                    ans = ans + 1
                }
            }
        }
        if args[size - 1] == "avg"{
            if(size == 1){
                return 0
            }
            var counter = 0
            for arg in args{
                if Int(arg) != nil{
                    ans = ans + Int(arg)!
                    counter = counter + 1
                }
            }
            ans = ans / counter
        }
        if args[size - 1] == "fact"{
            if Int(args[0]) != nil {
                var fact = Int(args[0])!
                ans = 1
                while fact > 0 {
                    ans = ans * fact
                    fact = fact - 1
                }
            }
            
        }
        return ans
    }
    
    public func calculate(_ arg: String) -> Int {
        return calculate( arg.split(separator: " ").map({ substr in String(substr) }) )
    }
}

print("UW Calculator v1")
print("Enter an expression separated by returns:")
let line = readLine()!
print(Calculator().calculate(line))

