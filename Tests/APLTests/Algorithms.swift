//
//  ArithmeticSpec.swift
//  APL
//
//  Created by Joseph Mattiello on 6/10/22.
//  Copyright (c) 2022 Joseph Mattiello. All rights reserved.
//

import APL
import XCTest

public class ArithmeticSpec: XCTestCase {
	public func testGameOfLife() {
      life ← {⊃1 ⍵ ∨.∧ 3 4 = +/ +⌿ ¯1 0 1 ∘.⊖ ¯1 0 1 ⌽¨ ⊂⍵}
	}
}
