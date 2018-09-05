//
//  Spoon.swift
//  Hungry Developers
//
//  Created by Lambda-School-Loaner-11 on 9/5/18.
//  Copyright © 2018 David Doswell. All rights reserved.
//

import Foundation

private let threadWill = NSLock()

let firstSpoon = Spoon()
let secondSpoon = Spoon()
let thirdSpoon = Spoon()
let fourthSpoon = Spoon()
let fifthSpoon = Spoon()

class Spoon {
    
    func pickUp() {
        threadWill.lock()
    }
    
    func putDown() {
        Developer().run()
        threadWill.unlock()
    }
    
}

let firstDeveloper = Developer()
let secondDeveloper = Developer()
let thirdDeveloper = Developer()
let fourthDeveloper = Developer()
let fifthDeveloper = Developer()

DispatchQueue.concurrentPerform(iterations: 5) {
    developers[$0].run()
}

class Developer {
    
    let developers : [Developer] = []
    
    var leftSpoon: Spoon!
    var rightSpoon: Spoon!

    func think() {
        Spoon().pickUp()
    }
    
    func eat() {
        usleep(1)
        self.leftSpoon.putDown()
        self.rightSpoon.putDown()
    }
    
    func run() {
        
        while true {
            think()
            eat()
        }
    }
    
    
}










