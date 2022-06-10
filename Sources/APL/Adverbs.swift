//
//  Adverbs.swift
//  APL
//
//  Created by Robert Widmann on 7/23/14.
//  Copyright (c) 2014 Robert Widmann. All rights reserved.
//

import Foundation

infix operator /
infix operator ⧵

public typealias DoubleFunc<A> = A -> A
public typealias TripleFunc<A> = A -> A -> A

public func /<A>(f: TripleFunc<A>, xs0: [A]) -> A {
	let hd = xs0[0]
	let tl = Array<A>(xs0[1..<xs0.count])
	return foldl(f)(initial: hd)(xss: tl)
}

public func ⧵<A>(f: TripleFunc<A>, xs0: [A]) -> [A] {
	return f ⧵ xs0.map({ (let x) in
		return [x]
	})
}

public func ⧵<A>(f: TripleFunc<A>, xs0: [[A]]) -> [A] {
	let arr = ⍉xs0
	return arr.map({ (xs) in
		let hd = xs[0]
		let tl = xs[1..<xs.count]
		return foldl(f, initial: hd, xss: Array<A>(tl))
	})
}

infix operator •

public func •<A>(var f : DoubleFunc<A>, times: UInt) -> DoubleFunc<A> {
	return { (let x) in
		var acc = x
		for _ in 0...times {
			acc = f(acc)
		}
		return acc
	}
}

/// Swap | Applies w and a to a verb on the left.
infix operator ⊂ : RightPrecedence

public func ⊂<T, U>(f : U -> T, w : U) -> T {
	return f(w)
}

public func ⊂<T>(f : T -> T -> T, w : T) -> T {
	return f(w)(w)
}


//infix operator ¨ : RightPrecedence

public func ¨<T, U>(_ x : T, _ f : T -> U -> T) -> U -> T {
    return f(x)
}

public typealias FodlFunc<A, B> = B -> A -> B
public func foldl<A, B>(_ f: FodlFunc<A,B>, initial: B, xss: [A]) -> B {
	var xs = initial
	for x in xss {
		xs = f(xs)(x)
	}
	return xs
}
