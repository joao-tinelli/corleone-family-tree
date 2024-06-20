# Corleone Family Tree in Prolog

This repository contains Prolog code that represents the family tree of the Corleone family from the famous "The Godfather" series. The code includes facts about family members, their relationships, and various predicates to query and explore these relationships.

## Table of Contents

- [Introduction](#introduction)
- [Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Running the Code](#running-the-code)
- [Usage](#usage)
  - [Queries](#queries)
- [Predicates](#predicates)
- [Examples](#examples)
- [Contributing](#contributing)
- [License](#license)

## Introduction

The Corleone Family Tree project in Prolog is designed to help users understand the complex relationships within the Corleone family. The family tree includes information about parents, children, siblings, and extended family members, as well as various predicates to determine specific familial relationships.

## Getting Started

### Prerequisites

To run this Prolog code, you need to have SWI-Prolog installed on your machine. You can download and install it from the [SWI-Prolog website](https://www.swi-prolog.org/Download.html).

### Running the Code

1. Clone this repository to your local machine:
   ```sh
   git clone https://github.com/joao-tinelli/corleone-family-tree.git
   cd corleone-family-tree
   ```

2. Open SWI-Prolog:
   ```sh
   swipl
   ```

3. Load the family tree file:
   ```prolog
   ?- [corleone_family_tree].
   ```

## Usage

Once the Prolog file is loaded, you can use various predicates to query the family tree.

### Queries

Here are some example queries you can run:

1. **Find Parents:**
   ```prolog
   ?- parents(michael, Parents).
   ```

2. **Find Children:**
   ```prolog
   ?- children(vito, Children).
   ```

3. **Find Siblings:**
   ```prolog
   ?- list_siblings(michael, Siblings).
   ```

4. **Find Gender:**
   ```prolog
   ?- male(michael).
   ```

5. **Find Grandparents:**
   ```prolog
   ?- grandfather(Grandfather, anthony).
   ```

6. **Find Cousins:**
   ```prolog
   ?- cousin(anthony, Cousins).
   ```

7. **Find Uncles and Aunts:**
   ```prolog
   ?- uncle(Uncle, michael).
   ?- aunt(Aunt, michael).
   ```

8. **Find Ancestors and Descendants:**
   ```prolog
   ?- ancestors(michael, Ancestors).
   ?- descendants(vito, Descendants).
   ```

9. **General Relationship Query:**
   ```prolog
   ?- relationship(vito, michael).
   ```

## Predicates

The following predicates are available for querying the family tree:

- `parent(X, Y)`: X is the parent of Y.
- `male(X)`: X is male.
- `female(X)`: X is female.
- `child(X, Y)`: X is the child of Y.
- `daughter(X, Y)`: X is the daughter of Y.
- `son(X, Y)`: X is the son of Y.
- `children(X, Children)`: Children are the children of X.
- `mother(X, Y)`: X is the mother of Y.
- `father(X, Y)`: X is the father of Y.
- `parents(X, Parents)`: Parents are the parents of X.
- `sibling(X, Y)`: X and Y are siblings.
- `list_siblings(X, Siblings)`: Siblings are the siblings of X.
- `brother(X, Y)`: X is the brother of Y.
- `sister(X, Y)`: X is the sister of Y.
- `cousin(X, Y)`: X and Y are cousins.
- `uncle(X, Y)`: X is the uncle of Y.
- `aunt(X, Y)`: X is the aunt of Y.
- `grandfather(X, Y)`: X is the grandfather of Y.
- `grandmother(X, Y)`: X is the grandmother of Y.
- `ancestor(X, Y)`: X is an ancestor of Y.
- `ancestors(X, Ancestor_of)`: Ancestor_of are the ancestors of X.
- `descendant(X, Y)`: X is a descendant of Y.
- `descendants(X, Descendant_of)`: Descendant_of are the descendants of X.
- `relationship(X, Y)`: Determines the relationship between X and Y.

## Examples

Here are some example queries and their expected outputs:

1. **Who are Michael's parents?**
   ```prolog
   ?- parents(michael, Parents).
   Parents = [vito, carmella].
   ```

2. **Who are Vito's children?**
   ```prolog
   ?- children(vito, Children).
   Children = [michael, sonny, connie, fredo, tom].
   ```

3. **Who are Michael's siblings?**
   ```prolog
   ?- list_siblings(michael, Siblings).
   Siblings = [sonny, connie, fredo, tom].
   ```

## Contributing

Contributions are welcome! Please fork the repository and create a pull request with your changes. For major changes, please open an issue first to discuss what you would like to change.

## License

This project is licensed under the Apache License. See the [LICENSE](LICENSE) file for details.