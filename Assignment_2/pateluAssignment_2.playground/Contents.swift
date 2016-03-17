//: Playground - noun: a place where people can play

import UIKit

//Urvi Patel
//CSC 471 - Assignment #2
//Due Date: 1/20/2016

func rank(nums: [Int], key: Int, inout lo: Int, inout hi: Int) -> Int {
    let  mid = (lo + hi) / 2;
    if(key == nums[mid]) {
        return mid;
    }
    
    if(lo > hi) {
        return -1;
    }
    
    if(key < nums[mid]) {
        hi = mid - 1;
        return rank(nums, key: key, lo: &lo, hi: &hi);
    }
    else {
        lo = mid + 1;
        return rank(nums, key:key, lo: &lo, hi: &hi);
    }
}



class Fraction {
    var numerator: Int = 0;
    var denominator: Int = 1;
    
    init(numerator: Int, denominator: Int) {
        self.numerator = numerator;
        self.denominator = denominator;
    }
    
    init(_ numerator: Int, over denominator: Int) {
        self.numerator = numerator;
        self.denominator = denominator;
    }
    
    init() {}
    
    func setTo(numerator: Int, denominator: Int) {
        self.numerator = numerator;
        self.denominator = denominator;
    }
    
    func setTo(numerator:Int, over denominator: Int) {
        self.numerator = numerator;
        self.denominator = denominator;
    }
    
    func setTo(numerator: Int, _ denominator: Int) {
        self.numerator = numerator;
        self.denominator = denominator;
    }
    func toDouble() -> Double {
        return Double(numerator) / Double(denominator);
    }
    

    func printFraction(terminator term: String = "\n") {
        print("\(numerator)/\(denominator)", terminator: term);
    }
    

    func add(f: Fraction) -> Fraction {
        let result: Fraction = Fraction();
        result.numerator = numerator * f.denominator + denominator * f.numerator;
        result.denominator = denominator * f.denominator;
        print("Unsimplified result of addition is ", terminator: "");
        result.printFraction();
        result.reduce();
        print("Reduced result of addition is ", terminator: "");
        return result;
    }
    
    func substract(f:Fraction) -> Fraction {
        let result: Fraction = Fraction();
        result.numerator = (numerator * f.denominator) - (denominator * f.numerator);
        result.denominator = denominator * f.denominator;
        print("Unsimplified result of subtraction is ", terminator: "");
        result.printFraction();
        result.reduce();
        print("Reduced result of subtraction is ", terminator: "");
        return result;
    }

    func multiply(f:Fraction) -> Fraction {
        let result: Fraction = Fraction();
        result.numerator = numerator * f.numerator;
        result.denominator = denominator * f.denominator;
        print("Unsimplified result of multiplication is ", terminator: "");
        result.printFraction();
        result.reduce();
        print("Reduced result of multiplication is ", terminator: "");
        return result;
    }

    func divide(f:Fraction) -> Fraction {
        let result: Fraction = Fraction();
        result.numerator = numerator * f.denominator;
        result.denominator = denominator * f.numerator;
        print("Unsimplified result of division is ", terminator: "");
        result.printFraction();
        result.reduce();
        print("Reduced result of division is ", terminator: "");
        return result;
    }
    
    func reduce() {
        let sign = numerator >= 0 ? 1 : -1;
        var u = numerator * sign;
        var v = denominator;
        var r: Int;
        while(v != 0) {
            r = u % v;
            u = v;
            v = r;
        }
        numerator /= u;
        denominator /= u;
    }
}


var numbers: [Int] = [10, 23, 35, 48, 51, 66, 73, 81, 93, 198];
var high = numbers.count - 1;
var lo = 0;

print("****** Part I: Binary Search ******");
print("\n\nArray to search:", terminator:"\t");

for i in 0...numbers.count - 1 {
    print("\(numbers[i])", terminator:"\t");
}


print("\n\nSearch for each number in numbers array:\n");
for i in 0...numbers.count - 1 {
    var index = rank(numbers, key: numbers[i], lo: &lo, hi: &high);
    high = numbers.count - 1;
    lo = 0;
    print("index of \(numbers[i]) is \(index)");
}

print("\nSearch for random numbers in numbers array\n")

var keysToSearch: [Int] = [11, 23, 81, 45, 93, 66, 74, 10, 87, 100]
for i in 0...keysToSearch.count - 1 {
    var index = rank(numbers, key: keysToSearch[i], lo: &lo, hi: &high);
    high = numbers.count - 1;
    lo = 0;
    print("index of \(keysToSearch[i]) is \(index)");
}

print("\n\n****** Part II: Enhancement of Fraction Class ******");

print("\n\nAddition\n");
var f1 = Fraction(numerator: 1, denominator: 2);
var f2 = Fraction(numerator: 1, denominator: 4);
f1.printFraction(terminator: "\t")
print("+", terminator: " ");
f2.printFraction()
var addition = f1.add(f2);
addition.printFraction();

print("");

f1 = Fraction(2, over: 3);
f2 = Fraction(5, over: 12);
f1.printFraction(terminator: "\t")
print("+", terminator: " ");
f2.printFraction()
addition = f1.add(f2);
addition.printFraction();

print("");

f1 = Fraction(7, over: 8);
f2 = Fraction(3, over: 15);
f1.printFraction(terminator: "\t")
print("+", terminator: " ");
f2.printFraction()
addition = f1.add(f2);
addition.printFraction();


print("\nSubtraction\n");


f1 = Fraction(4, over: 5);
f2 = Fraction(12, over: 15);
f1.printFraction(terminator: "\t")
print("-", terminator: " ");
f2.printFraction()
var subtraction = f1.substract(f2);
subtraction.printFraction();

print("");

f1 = Fraction(7, over: 32);
f2 = Fraction(12, over: 16);
f1.printFraction(terminator: " ")
print("-", terminator: " ");
f2.printFraction()
subtraction = f1.substract(f2);
subtraction.printFraction();

print("");

f1 = Fraction(15, over: 16);
f2 = Fraction(22, over: 64);
f1.printFraction(terminator: " ")
print("-", terminator: " ");
f2.printFraction()
subtraction = f1.substract(f2);
subtraction.printFraction();

print("\nMultiplication\n");

f1 = Fraction(15, over: 16);
f2 = Fraction(22, over: 64);
f1.printFraction(terminator: " ")
print("*", terminator: " ");
f2.printFraction()
var multiplication = f1.multiply(f2);
multiplication.printFraction();

print("");

f1 = Fraction(8, over: 10);
f2 = Fraction(5, over: 6);
f1.printFraction(terminator: " ")
print("*", terminator: " ");
f2.printFraction()
multiplication = f1.multiply(f2);
multiplication.printFraction();

print("");

f1 = Fraction(9, over: 22);
f2 = Fraction(8, over: 11);
f1.printFraction(terminator: " ")
print("*", terminator: " ");
f2.printFraction()
multiplication = f1.multiply(f2);
multiplication.printFraction();

print("\nDivision\n");

f1 = Fraction(7, over: 10);
f2 = Fraction(21, over: 22);
f1.printFraction(terminator: " ")
print("divided by ", terminator: " ");
f2.printFraction()
var division = f1.divide(f2);
division.printFraction()

print("");

f1 = Fraction(14, over: 24);
f2 = Fraction(6, over: 12);
f1.printFraction(terminator: " ")
print("divided by ", terminator: " ");
f2.printFraction()
division = f1.divide(f2);
division.printFraction()

print("");

f1 = Fraction(1, over: 11);
f2 = Fraction(13, over: 15);
f1.printFraction(terminator: " ")
print("divided by ", terminator: " ");
f2.printFraction()
division = f1.divide(f2);
division.printFraction()

