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

