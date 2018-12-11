export CC = gcc
export CXX = g++
export CFLAGS = -w -O3 -pthread

INSTALL_PATH=bin/
BIN = bi_ratm
OBJ = inference.o learn.o
.PHONY: clean all

all: $(BIN)

bi_ratm:bi_ratm.cpp bi_ratm.h inference.o learn.o utils.h
inference.o: inference.cpp utils.h inference.h bi_ratm.h
learn.o: learn.cpp utils.h learn.h bi_ratm.h

$(BIN) : 
	$(CXX) $(CFLAGS) -o $@ $(filter %.cpp %.o %.c, $^)

$(OBJ) :
	$(CXX) -c $(CFLAGS) -o $@ $(filter %.cpp %.c, $^)

install:
	cp -f -r $(BIN) $(INSTALL_PATH)

clean:
	$(RM) $(OBJ) $(BIN) *~
