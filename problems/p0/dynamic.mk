# Dynamic content of this problem.

LIB_OBJS=bobcat_math.o
TEST_CASE_OBJS=tests/test_bobcat_math.o

bobcat_math.o: bobcat_math.cpp bobcat_math.h
	$(CXX) -c bobcat_math.cpp

generate:
	cp .template/bobcat_math.h ./
	-git merge-file -p .template/bobcat_math.ours.cpp .template/bobcat_math.common.cpp .template/bobcat_math.theirs.cpp > bobcat_math.cpp

# confirmation from https://stackoverflow.com/a/47839479
reset:
	@echo -n "This will delete your answer as well! Are you sure? [y/N] " && read ans && [ $${ans:-N} = y ]
	-rm -f ./test_main
	-rm -f ./*.o
	-rm -f ./tests/*.o
	-rm -f ./bobcat_math.h
	-rm -f ./bobcat_math.cpp
