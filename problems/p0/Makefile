.PHONY: test generate clean reset

bobcat_math.o: bobcat_math.cpp bobcat_math.h
	$(CXX) -c bobcat_math.cpp

test: test_main
	./test_main

test_main: bobcat_math.o test_main.o tests/test_bobcat_math.o
	$(CXX) test_main.o bobcat_math.o tests/test_bobcat_math.o -o test_main

test_main.o: test_main.cpp
	$(CXX) -c test_main.cpp

tests/test_bobcat_math.o: tests/test_bobcat_math.cpp
	$(CXX) -c tests/test_bobcat_math.cpp -o tests/test_bobcat_math.o

generate:
	cp ../common/vendors/catch2/catch.hpp ./catch.hpp
	cp .template/bobcat_math.h ./
	-git merge-file -p .template/bobcat_math.ours.cpp .template/bobcat_math.common.cpp .template/bobcat_math.theirs.cpp > bobcat_math.cpp

clean:
	-rm -f ./test_main
	-rm -f ./*.o
	-rm -f ./tests/*.o

reset:
	-rm -f ./*.o
	-rm -f ./tests/*.o
	-rm -f ./catch.hpp
	-rm -f ./bobcat_math.h
	-rm -f ./bobcat_math.cpp
