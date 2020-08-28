//
//  enumCalculation.swift
//  firstCalculator
//
//  Created by Developer 1 on 28/08/2020.
//  Copyright © 2020 Developer 1. All rights reserved.
//

import Foundation
public class enumCalculation {
    
    
    public enum Operation {
        case addition
        case subtraction
        case multiplication
        case division
        case none
    }
    

    static public let shared = enumCalculation()
    
    private(set) public var result: Double?

    public  var operation: Operation = .none
    
    var op1: Double?
    
    var op2: Double?
    
    
    
    init() {
        
    }
    
    
    
    public func keep(_ value: Double) {
        if op1 == nil {
            op1 = value
        } else {
            op2 = value
        }
    }
    
    
    public func calculateResult() {
        guard let op1 = op1, let op2 = op2 else { return }
        
        switch operation {
        case .addition: result = op1 + op2
        case .subtraction: result = op1 - op2
        case .multiplication: result = op1 * op2
        case .division: result = op1 / op2
        case .none: break
        }
        
        self.op1 = result
    }
    
    
    public func clear() {
        op1 = nil
        op2 = nil
        result = nil
        operation = .none
    }
    
    
    public func getFormattedResult() -> String? {
        guard let result = result else { return nil }
        return result.truncatingRemainder(dividingBy: 1.0) == 0.0 ? "\(Int(result))" : "\(result)"
    }
}
