CC = gcc
CFLAGS = -Wall -Werror

SRCDIR = ./
BUILDDIR = ./build

SRC = $(wildcard $(SRCDIR)/*.c)
OBJECTS = $(addprefix build/, $(notdir $(SRC:.c=.o)))
TARGET = $(BUILDDIR)/clox

all: build $(TARGET)

build:
	@mkdir -p build

$(TARGET): $(OBJECTS)
	$(CC) -o $@ $^

build/%.o: $(SRCDIR)/%.c
	$(CC) $(CFLAGS) -c -o $@ $<

.phony: run clean build

run:
	./$(TARGET)

clean:
	rm -rf $(BUILDDIR)