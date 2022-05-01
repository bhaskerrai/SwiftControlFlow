import UIKit

var greeting = "Hello, playground"

let a = "This file is not in iCloud/Documents but in /Users/bhaskerrai/GitHub/SwiftControlFlow"

//for-in loop

//“If you don’t need each value from a sequence, you can ignore the values by using an underscore in place of a variable name.”

let base = 2
let power = 4
var ans = 1

for _ in 1...power{
    ans *= base
}
print("\(base) to the power of \(power) is \(ans).")

//“The example above calculates the value of one number to the power of another (in this case, 2 to the power of 4). It multiplies a starting value of 1 (that is, 2 to the power of 0) by 2, ten times, using a closed range that starts with 1 and ends with 4. For this calculation, the individual counter values each time through the loop are unnecessary—the code simply executes the loop the correct number of times. The underscore character (_) used in place of a loop variable causes the individual values to be ignored and doesn’t provide access to the current value during each iteration of the loop.”

//“Closed ranges are also available, by using stride(from:through:by:) instead:”
//“ Use the stride(from:to:by:) function to skip the unwanted marks.”

let minute = 60
let minInterval = 5

//for tickMark in stride(from: 0, to: minute, by: minInterval){
//    print(tickMark)
//}

for i in stride(from: 1, to: 10, by: 2){
    print(i, terminator: " ")
}

//“While Loops
//A while loop performs a set of statements until a condition becomes false. These kinds of loops are best used when the number of iterations isn’t known before the first iteration begins. Swift provides two kinds of while loops:

//while evaluates its condition at the start of each pass through the loop.

//repeat-while evaluates its condition at the end of each pass through the loop.”


/* “This example plays a simple game of Snakes and Ladders (also known as Chutes and Ladders):”
 
 “The rules of the game are as follows:

 The board has 25 squares, and the aim is to land on or beyond square 25.

 The player’s starting square is “square zero”, which is just off the bottom-left corner of the board.

 Each turn, you roll a six-sided dice and move by that number of squares, following the horizontal path indicated by the dotted arrow above.

 If your turn ends at the bottom of a ladder, you move up that ladder.

 If your turn ends at the head of a snake, you move down that snake.

 The game board is represented by an array of Int values. Its size is based on a constant called finalSquare, which is used to initialize the array and also to check for a win condition later in the example. Because the players start off the board, on “square zero”, the board is initialized with 26 zero Int values, not 25.”
*/
print("\n")
var finalSquare = 25
var board = [Int](repeating: 0, count: finalSquare+1)

//“Some squares are then set to have more specific values for the snakes and ladders. Squares with a ladder base have a positive number to move you up the board, whereas squares with a snake head have a negative number to move you back down the board.”

board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08


var square = 0
var diceRoll = 0
while square < finalSquare {
    // roll the dice
    diceRoll += 1
    if diceRoll == 7 { diceRoll = 1 }
    // move by the rolled amount
    square += diceRoll
    if square < board.count {
        // if we're still on the board, move up or down for a snake or a ladder
        square += board[square]
    }
}
print("Game over!")

//“A while loop is appropriate in this case, because the length of the game isn’t clear at the start of the while loop. Instead, the loop is executed until a particular condition is satisfied.”

//“Repeat-While
//The other variation of the while loop, known as the repeat-while loop, performs a single pass through the loop block first, before considering the loop’s condition. It then continues to repeat the loop until the condition is false.

var a1 = 28
var a2 = 30

while a1 < a2{
    print("Less")
    a1 += 1
}


repeat{
    var c = 1
    print("Loop executed \(c) times")
    print("Less")
    c += 1
} while a2 < a1

//“Swift provides two ways to add conditional branches to your code: the if statement and the switch statement. ”

a1 = 10
a2 = 20


if a1 == a2{
    print("\(a1) is equal to \(a2)")
}
else if a1 < a2{
    print("\(a1) is less than \(a2)")
}
else{
    print("\(a1) is greater than \(a2)")
}

//Switch
switch a1<a2{

case a1 == a2:
    print("\(a1) is equal to \(a2)")
    
case a1 < a2:
    print("\(a1) is less than \(a2)")
 
case a1 > a2:
    print("\(a1) is greater than \(a2)")
    
default:
    print("error")
}

//“No Implicit Fallthrough

//In contrast with switch statements in C and Objective-C, switch statements in Swift don’t fall through the bottom of each case and into the next one by default. Instead, the entire switch statement finishes its execution as soon as the first matching switch case is completed, without requiring an explicit break statement. This makes the switch statement safer and easier to use than the one in C and avoids executing more than one switch case by mistake.

var c: Character = "a"

switch c{
case "a":
    print("It's letter A")
    
default:
    print("some other letter")
}

//“To make a switch with a single case that matches both "a" and "A", combine the two values into a compound case, separating the values with commas.
c = "A"
switch c{
case "a","A":
    print("It's letter A")
    
default:
    print("some other letter")
}

//“Tuples

//You can use tuples to test multiple values in the same switch statement. Each element of the tuple can be tested against a different value or interval of values. Alternatively, use the underscore character (_), also known as the wildcard pattern, to match any possible value.

//The example below takes an (x, y) point, expressed as a simple tuple of type (Int, Int), and categorizes it on the graph that follows the example.”
let somePoint = (1, 1)
switch somePoint {
case (0, 0):
    print("\(somePoint) is at the origin")
case (_, 0):
    print("\(somePoint) is on the x-axis")
case (0, _):
    print("\(somePoint) is on the y-axis")
case (-2...2, -2...2):
    print("\(somePoint) is inside the box")
default:
    print("\(somePoint) is outside of the box")
}

//“Unlike C, Swift allows multiple switch cases to consider the same value or values. In fact, the point (0, 0) could match all four of the cases in this example. However, if multiple matches are possible, the first matching case is always used. The point (0, 0) would match case (0, 0) first, and so all other matching cases would be ignored.”


//Value Binding
//“A switch case can name the value or values it matches to temporary constants or variables, for use in the body of the case. This behavior is known as value binding, because the values are bound to temporary constants or variables within the case’s body.”

let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with a y value of \(y)")
case let (x, y):
    print("somewhere else at (\(x), \(y))")
}


//Where
//“A switch case can use a where clause to check for additional conditions.”
var ab = 33

switch ab{
case var h where ab % 2 == 0:
    h = 2
    print("The number is even is divible by \(h)")

case _ where ab % 2 != 0:
    print("The number is odd not divisible by 2.")
default:
    print("illegal")
}

//“Compound Cases

//Multiple switch cases that share the same body can be combined by writing several patterns after case, with a comma between each of the patterns. If any of the patterns match, then the case is considered to match. The patterns can be written over multiple lines if the list is long. For example:

let someCharacter: Character = "e"
switch someCharacter {
case "a", "e", "i", "o", "u":
    print("\(someCharacter) is a vowel")
case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m",
     "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
    print("\(someCharacter) is a consonant")
default:
    print("\(someCharacter) isn't a vowel or a consonant")
}


let car = "BMW"
switch car{
case "BMW","Rolls Royes","Lumbergeni","Ferrari":
    print("Your GST is 30%")
case "Honda","Toyota","Nissan","Swizikui":
    print("Your GST is 10%")
default:
    print("Your GST is 5%")
}


//“Compound cases can also include value bindings. All of the patterns of a compound case have to include the same set of value bindings, and each binding has to get a value of the same type from all of the patterns in the compound case. ”
let stillAnotherPoint = (9, 0)
switch stillAnotherPoint {
case (let distance, 0), (0, let distance):
    print("On an axis, \(distance) from the origin")
default:
    print("Not on an axis")
}
// Prints "On an axis, 9 from the origin”


/*
 Control Transfer Statements:
 Control transfer statements change the order in which your code is executed, by transferring control from one piece of code to another. Swift has five control transfer statements:

 continue

 break

 fallthrough

 return

 throw
 */

var text = "hjsdkalaj sjadkjladja"
let arr: [Character] = ["a","e","i","o","u"," "]
print("The text has following consonants:")

for i in text{
    if arr.contains(i){
        continue
    }
    print(i, terminator: " ")
}

//fallthrough
//“In Swift, switch statements don’t fall through the bottom of each case and into the next one. That is, the entire switch statement completes its execution as soon as the first matching case is completed. By contrast, C requires you to insert an explicit break statement at the end of every switch case to prevent fallthrough. Avoiding default fallthrough means that Swift switch statements are much more concise and predictable than their counterparts in C, and thus they avoid executing multiple switch cases by mistake.
//“If you need C-style fallthrough behavior, you can opt in to this behavior on a case-by-case basis with the fallthrough keyword. The example below uses fallthrough to create a textual description of a number.”

print("\n")
let c1 = "BMW"

var type = "\(car) is a"
switch c1{
case "BMW","Honda","Ferrari":
    type += " luxurary car."
    fallthrough
    
default:
    type += "It is also expensive."
}

print(type)

//“The fallthrough keyword doesn’t check the case conditions for the switch case that it causes execution to fall into. The fallthrough keyword simply causes code execution to move directly to the statements inside the next case (or default case) block, as in C’s standard switch statement behavior.”




//Labeled Statements:
//When using nested loops, we can terminate the outer loop with a labeled break statement or we can skip the current iteration of the outer loop with a labeled continue statement.

//Swift’s labeled statements allow us to name certain parts of our code, and it’s most commonly used for breaking out of nested loops.


//To demonstrate them, let’s look at an example where we’re trying to figure out the correct combination of movements to unlock a safe. We might start by defining an array of all possible movements:

let options = ["up", "down", "left", "right"]
//For testing purposes, here’s the secret combination we’re trying to guess:

let secretCombination = ["up", "up", "right"]
//To find that combination, we need to make arrays containing all possible three-color variables:

//up, up, up
//up, up, down
//up, up, left
//up, up, right
//up, down, left
//up, down, right
//…you get the idea.

//To make that happen, we can write three loops, one nested inside the other, like this:

for option1 in options {
    for option2 in options {
        for option3 in options {
            print("In loop")
            let attempt = [option1, option2, option3]

            if attempt == secretCombination {
                print("The combination is \(attempt)!")
            }
        }
    }
}
//That goes over the same items multiple times to create an attempt array, and prints out a message if its attempt matches the secret combination.

//But that code has a problem: as soon as we find the combination we’re done with the loops, so why do they carry on running? What we really want to say is “as soon as the combination is found, exit all the loops at once” – and that’s where labeled statements come in. They let us write this:

print("\n")
outerLoop: for option1 in options {
    for option2 in options {
        for option3 in options {
            print("In loop")
            let attempt = [option1, option2, option3]

            if attempt == secretCombination {
                print("The combination is \(attempt)!")
                break outerLoop
            }
        }
    }
}


//without labeled loop:

for i in 1...3{
    for j in 1...3{
        
        if i == 2{
            break
        }
        print("i = \(i), j = \(j)")
        
    }
}

// labeled loop:

print("\n")
myLabelForOuterLoop: for i in 1...3{
    for j in 1...3{

        if i == 2{
            break myLabelForOuterLoop
        }
        print("i = \(i), j = \(j)")

    }
}

//using continue instead of break
print("\n")
myLabelForOuterLoop: for i in 1...3{
    for j in 1...3{

        if i == 2{
            continue myLabelForOuterLoop
        }
        print("i = \(i), j = \(j)")

    }
}




//Early Exit
//A guard statement, like an if statement, executes statements depending on the Boolean value of an expression. You use a guard statement to require that a condition must be true in order for the code after the guard statement to be executed. Unlike an if statement, a guard statement always has an else clause—the code inside the else clause is executed if the condition isn’t true.

func myFunc(movie: [String:String]){
    
    guard let movieName = movie["name"], let movieYear = movie["year"] else{
        print("No fucking movie was given to me.")
        return
    }
    
    print("\nThe \(movieName) was released in \(movieYear).")
    
}

myFunc(movie: ["name":"Tenet","year":"2020"])

//“If the guard statement’s condition is met, code execution continues after the guard statement’s closing brace. Any variables or constants that were assigned values using an optional binding as part of the condition are available for the rest of the code block that the guard statement appears in.

//If that condition isn’t met, the code inside the else branch is executed. That branch must transfer control to exit the code block in which the guard statement appears. It can do this with a control transfer statement such as return, break, continue, or throw, or it can call a function or method that doesn’t return, such as fatalError(_:file:line:).”




//Checking API Availability

//“You use an availability condition in an if or guard statement to conditionally execute a block of code, depending on whether the APIs you want to use are available at runtime. The compiler uses the information from the availability condition when it verifies that the APIs in that block of code are available.

if #available(iOS 10, macOS 10.12, *) {
    print("\ncondition satisfied")
    // Use iOS 10 APIs on iOS, and use macOS 10.12 APIs on macOS
} else {
    // Fall back to earlier iOS and macOS APIs
    print("\ncondition not satisfied")
}
//The availability condition above specifies that in iOS, the body of the if statement executes only in iOS 10 and later; in macOS, only in macOS 10.12 and later. The last argument, *, is required and specifies that on any other platform, the body of the if executes on the minimum deployment target specified by your target.”

