CC = gcc
CFLAGS = -Wall -Werror -g

SRCDIR = ./
INCLUDEDIR = ./
BUILDDIR = ./build

SRCS = $(wildcard $(SRCDIR)/*.c)
HEADERS = $(wildcard $(INCLUDEDIR)/*.h)
OBJECTS = $(addprefix build/, $(notdir $(SRCS:.c=.o)))
TARGET = $(BUILDDIR)/clox

all: build $(TARGET)

build:
	@mkdir -p build

$(TARGET): $(OBJECTS)
	$(CC) -o $@ $^

build/%.o: $(SRCDIR)/%.c $(HEADERS)
	$(CC) $(CFLAGS) -c -o $@ $<

.phony: run clean build

run:
	./$(TARGET)

clean:
	rm -rf $(BUILDDIR)