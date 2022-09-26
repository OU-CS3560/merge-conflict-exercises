# Specifications

## User Stories

### End-users / Students

Fix and test one problem at a time.

```console
$ git clone this-repo-url
$ cd merge-conflict-exercises
$ cd problems/problem-1
$ make generate  # generate merge conflicts
$ # fixing the merge conflict(s)
$ make test  # build test cases and run them.
```

### CI/CD

Test all problems.

```console
$ cd problems && make testAll
```

Testing arbitrary set of problems.

```console
$ cd problems && make p1 p2 p5
```

### TA

Only manually crafting each problem is possible.

## Limitations

- Helper program, if needed, have to be written in C++ only. Python would be ideal but students will have to install Python runtime.
- Build system is limited to only Make. This is because class content only cover Make. Using cmake will also require students to install it.

## Project Structure

```plain
problems/
problems/Makefile
problems/common/
problems/common/vendors/
problems/common/vendors/catch2/catch.hpp # from https://raw.githubusercontent.com/catchorg/Catch2/v2.x/single_include/catch2/catch.hpp
problems/p1/
problems/p1/Makefile
problems/p1/dynamic.mk
problems/p1/.template/
problems/p1/.template/filename.common.suffix
problems/p1/.template/filename.ours.suffix
problems/p1/.template/filename.theirs.suffix
problems/p1/test_main.cpp
```

### Makefile

Central Makefile. This should allow test to be selectively run.

### Files in a Problem

#### Makefile

The `Makefile` contains only code that is common to all problem. It should not be modified directly.
Instead put targets that are specific to this problem in `dynamic.mk`. The `dynamic.mk` will be
included into the main Makefile.

#### dynamic.mk

Contain targets that are unique to this problem only. This includes variables like `LIB_OBJS`, `TEST_CASE_OBJS`.
The definition of the target `generate`, and `reset` also goes here.

#### .template/

This folder is used to store file that `git merge-file` will run against. It also used to store
file that will be copy over to the working directory.

#### test_main.cpp

Standard file that only have two lines.
