# merge-conflict-exercises
A problem set for merge conflict resolution practice.

## Specification

### Experiences

#### End-user Experience

Fix and test one problem at a time.

```console
$ git clone this-repo-url
$ cd merge-conflict-exercises
$ cd problems/problem-1
$ # fixing the merge conflict(s)
$ make test
```

#### CI/CD Experience

Test all problems.

```console
$ cd problems && make testAll
```

Testing arbitrary set of problems.

```console
$ cd problems && make p1 p2 p5
```

#### TA Experience

```console
$ # fixing / creating new problem
$ python generator.py p1
```

### Limitations

- Helper program, if needed, have to be written in C++ only. Python would be ideal but studets will have to install Python runtime.
- Build system is limited to only Make. This is because class content only cover Make.

### Problem's Schema

```plain
generator.py
problems/
problems/Makefile
problems/common/
problems/common/vendors/
problems/common/vendors/catch2/catch.hpp # from https://raw.githubusercontent.com/catchorg/Catch2/v2.x/single_include/catch2/catch.hpp
problems/p1/
problems/p1/Makefile
problems/p1/.template/
problems/p1/.template/filename.common.suffix
problems/p1/.template/filename.ours.suffix
problems/p1/.template/filename.theirs.suffix
problems/p1/.template/Makefile.common  # support for generating merge conflicts in Makefile ?
problems/p1/.template/Makefile.ours
problems/p1/.template/Makefile.theirs
problems/p1/test_cases.cpp
```

```makefile
# problem-1/Makefile
help:
  @echo "usage: make [command]"
 
generate:
  @echo "generate merge conflcit(s)"
  
test:
  @echo "test"
  # Steps
  # 1. Compile source files.
  # 1. Compile test cases under tests/
  # 2. Run test
```

#### generator.py Behavior

1. List files under `pN/.template`
2. Group file by their name. Expecting name format `{name}.{tpye}.{suffix}` or `{name}.{tpye}`
3. Run `git-merge-file -p filename.ours.suffix filename.common.suffix filename.theirs.suffix` and save result to problem root directory. Overwrite is forced.
