.PHONY: test generate clean reset


help:
	@echo "usage: make [command]"
	@echo ""
	@echo "command can be one of the following"
	@echo ""
	@echo "help - show this message."
	@echo "generate - generate merge conflicts in this problem."
	@echo "test - compile the test program and run it."
	@echo "clean - remove artifacts from compilation."
	@echo "reset - delete all generated files. THIS WILL DELETE YOUR ANSWER AS WELL."

test: test_main
	./test_main

# begin: dyncmic content
include dynamic.mk
# end: dynamic content

test_main.o: test_main.cpp
	$(CXX) -c test_main.cpp

test_main: test_main.o $(LIB_OBJS) $(TEST_CASE_OBJS)
	$(CXX) $^ -o test_main

tests/%.o: tests/%.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

clean:
	-rm -f ./test_main
	-rm -f ./*.o
	-rm -f ./tests/*.o
