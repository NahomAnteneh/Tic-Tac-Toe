# Compiler
CC := gcc

# Compiler flags
CFLAGS := -Wall -Wextra -std=c11 -lSDL2_gfx

# SDL flags and libraries
SDL_CFLAGS := $(shell sdl2-config --cflags)
SDL_LIBS := $(shell sdl2-config --libs)

# Directories
SRCDIR := src
BUILDDIR := build

# Source files
SRCS := $(wildcard $(SRCDIR)/*.c)

# Object files
OBJS := $(patsubst $(SRCDIR)/%.c,$(BUILDDIR)/%.o,$(SRCS))

# Executable name
TARGET := $(BUILDDIR)/tictac

# Targets
all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $@ $^ $(SDL_LIBS)

$(BUILDDIR)/%.o: $(SRCDIR)/%.c
	@mkdir -p $(BUILDDIR)
	$(CC) $(CFLAGS) $(SDL_CFLAGS) -c -o $@ $<

clean:
	rm -rf $(BUILDDIR)

