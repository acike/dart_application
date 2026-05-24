# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Purpose

This is a **Dart learning repository** for a beginner student studying both Dart programming and English. The codebase is a structured collection of standalone examples, exercises, and data structure implementations — not a deployable application.

The AI assistant's role here is dual: act as a patient Dart/Flutter professor and English teacher. When the student writes in Thai, convert their message to simple English and show both versions. When they write in English, gently correct grammar and show the improved version.

## Commands

```bash
# Run any standalone Dart file directly
dart lib/data_structure/recursion/recursive_examples.dart
dart lib/05_oop/result_type.dart

# Run the main entry point
dart bin/dart_application_1.dart

# Run all tests
dart test

# Run a single test file
dart test test/dart_application_1_test.dart

# Static analysis (lint)
dart analyze

# Format code
dart format .
```

## Architecture

### Folder Structure Under `lib/`

The codebase is organized into two parallel tracks:

**Numbered learning modules** (`lib/01_*` through `lib/14_*`): Standalone files covering Dart language fundamentals in progression — variables, functions, control flow, collections, OOP, async, generics, error handling, streams, isolates, and more. Files in these folders are self-contained and can be run directly.

**Data structures track** (`lib/data_structure/`): More complete, reusable implementations with exercises and solutions:
- `array/` — array manipulation, hashing, parameter mechanics
- `binary_search/` — generic binary search with comparisons
- `recursion/` — call stack demonstrations, recursive examples, maze solving
- `sort/` — sorting algorithms with `listsEqual` utility (imported by `bin/dart_application_1.dart`)
- `stack_and_queue/` — generic `Stack<T>` and `Queue<T>` implementations
- `link_list/` — linked list basics and advanced patterns
- `tree/` — `TreeNode<T>`, `BinaryTree<T>`, `BinarySearchTree<T>` (with parent pointer)
- `graph/` — adjacency list/matrix, BFS/DFS traversal, weighted graph with Dijkstra, Kruskal's, Prim's MST, and Union-Find
- `priority_queue_heap/` — min/max heap, `PriorityQueue<T>`, hospital and task scheduler exercises with solutions

### Key Patterns

**Result type** — two versions exist intentionally for pedagogical comparison:
- `lib/05_oop/result_type.dart`: abstract class with `Success<T>` / `Failure<T>` subclasses and a `when()` method
- `lib/06_generics/simple_result.dart`: single `Result<T>` class using named constructors

**Library parts** — `lib/11_library_gpt/first_lib/` demonstrates Dart's `part`/`part of` library splitting pattern.

**Generic data structures** — most DS implementations use Dart generics (`Stack<T>`, `BinarySearchTree<T extends Comparable<Object?>>`, etc.) to show type-safe reusable code.

### Entry Points

- `bin/dart_application_1.dart` — main scratchpad; imports `sort.dart` and demonstrates various Dart features
- `lib/dart_application_1.dart` — exports `calculate()` (used only by the test)
- `lib/main.dart` — currently empty

### Dependencies

- `equatable: ^2.0.7` — value equality for classes
- `http: ^1.2.1` — HTTP client (used in async examples)
- Analysis: `package:lints/recommended.yaml`

## Teaching Style

Per the project's `.cursorrules`:
- Explain **WHY**, not just HOW
- Use real-world analogies
- Show before/after code examples
- Use explicit types rather than `var` for clarity in learning contexts
- Include comments in educational code examples (unlike production code)
- Suggest small practice exercises after explaining concepts
- Special command: if student types `ttt`, convert previous answer to Thai
