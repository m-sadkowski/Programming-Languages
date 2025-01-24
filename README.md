# Programming Languages Projects

This repository contains several projects developed as part of the **Programming Languages** course. Each project showcases different aspects of programming in various languages. Below is a description of the tasks implemented in the code fragments.

## 1. Implementation of Polygons in Smalltalk

The Smalltalk code demonstrates the implementation of classes representing various geometric shapes:

- **Polygon**: A base class for storing the number of vertices and their coordinates, and for printing information about the shape.
- **Square**: A subclass of "Polygon" that adds methods to calculate the square's area, scale the shape, and compare congruency with other squares.
- **Equilateral Triangle**: A subclass of "Polygon" that allows calculation of the area and scaling of the shape.

The code also includes test examples, such as adding shapes, comparing their congruency, and scaling them.

## 2. Sorting Lists and Graph Checking in Prolog

The Prolog code performs the following tasks:

- **Building Binary Trees**: Functions to insert elements into a tree and build a tree from a list.
- **Sorting**: Implementation of tree-based sorting, including reverse sorting.
- **Havel-Hakimi Algorithm**: Checking if a given degree sequence is graphical (i.e., if a graph can be constructed from it).
- **Graph Connectivity**: Algorithms to check if a graph is connected.

## 3. Mathematical Operations in Haskell

The Haskell code includes implementations of various mathematical functions:

- **Hexadecimal Conversion**: A function to convert numbers from hexadecimal to decimal.
- **Binomial Coefficient**: Calculation of the binomial coefficient using logarithms.
- **Prime Factorization**: A function that returns the list of prime factors of a given number.
- **Abundant Numbers**: Calculation of abundant numbers and checking if a number is a sum of abundant numbers.
- **Special Tasks**: Functions for tasks such as conversions, sum of divisors calculations, and other number operations.

## 4. Buffer Simulation in Ada

The Ada code implements a simulation of a warehouse management system (buffer):

- **Production and Consumption**: The buffer task handles producers delivering products and consumers ordering ready sets.
- **Warehouse State Management**: Functions check if a product can be accepted or a set can be delivered based on the current state.
- **Set Delivery**: A procedure delivers sets, reducing warehouse stock and accounting for material usage.

The code demonstrates advanced use of tasks and synchronization in Ada.

## Execution Instructions

### Smalltalk
1. Open a Smalltalk environment.
2. Import the code and run tests in the interactive Transcript console.

### Prolog
1. Start the SWI-Prolog interpreter.
2. Load the code file.
3. Use predicates (e.g., `is_graphical/2`, `sort/2`) for testing.

### Haskell
1. Use the GHC compiler or GHCi interpreter.
2. Import the file and invoke functions (e.g., `task4`, `task50`) with appropriate arguments.

### Ada
1. Compile the code using GNAT.
2. Run the executable program.

## Authors
The code was developed as part of laboratory exercises for the Programming Languages course.

