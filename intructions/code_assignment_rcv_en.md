# Assignment: Toy Car Simulation

Write a Ruby program that implements the following task.

## Objective

The goal of this assignment is to demonstrate your programming style and expertise in object-oriented programming.
The assignment is _not_ intended as a "test": we will use it as a topic for the technical interview.

## Specifications

The program simulates a toy car moving over a floor with obstacles.
The input of the program is a series of comma-separated instructions from `STDIN`.
The output of the program is a series of descriptions of the car's position and direction after each instruction, to `STDOUT`.

### Properties

- The toy car moves over a rectangular floor. We define the floor as a grid with width `x` and height `y`. The bottom-left coordinate is (1,1), the top-left coordinate is (1,y), and the bottom-right coordinate is (x,1).
- The car can drive in four directions: left (`L`), right (`R`), up (`U`), and down (`D`).

- The car can process the following instructions:

  - `Fn`: move `n` positions forward (Forward)
  - `Bn`: move `n` positions backward (Backward)
  - `L`: Turn 90 degrees to the left
  - `R`: Turn 90 degrees to the right

- The floor contains 'obstacles':
  - Any coordinate on the grid can contain an obstacle
  - A 'wall' is a group of obstacles: a contiguous row of obstacles from coordinate A to coordinate B. For example, from (1,1) to (10,1).
  - The car cannot move to or through a coordinate on the floor where there is an obstacle
  - The car cannot drive off the edge of the floor

### Configuration

- For this assignment, you may hardcode the following properties:
  - Grid size: 15 (width) by 10 (height)
  - Car starting position: (5,5), facing up (`U`)
  - Obstacles on the floor:
    - Walls: (3,8)-(5,8), (6,8)-(8,8), (4,10)-(2,10)
    - Obstacles: (4,6), (5,12)

### Input

- The input to the program is a comma-separated series of the above instructions. For example: `F2, L, B1, R, F3, R, B2`

### Output

- The output consists of:
  - A list of the _position and direction_ of the car after each instruction, comma-separated. Format: `(x,y,d)` where `d` is the direction of the car (`L`, `R`, `U`, `D`). For example: `(5,5,R), (8,5,R), (8,5,U), (8,6,U)`
  - If a collision has occurred, the coordinates are followed by an asterisk: `(x,y,d)*`. For example: `(5,5,R), (8,5,R)*, (8,5,U)`

### Example Input and Output

- Input: `F3, R, F4, R, F2, F1, L, B1, F2, R, R, R, F1, R, F2, R, F4, F1`
- Output: `(5,7,U)*, (5,7,R), (7,7,R)*, (7,7,D), (7,5,D), (7,4,D), (7,4,R), (7,4,R)*, (9,4,R), (9,4,D), (9,4,L), (9,4,U), (9,5,U), (9,5,R), (11,5,R), (11,5,D), (11,1,D), (11,1,D)*`

## Tips

- Write code that is readable and maintainable
- Indicate approximately how much time you spent on the assignment.
