###############################################################################
#
# to call this makefile, run './build.sh' or 'mingw32-make.exe --file=Makefile all'
#
###############################################################################

# $(print_hline)
define print_hline
	@printf "~%.0s" {1..80}; echo " "
endef

GLFW_PATH := "${HOME}/Downloads/glfw-3.3.8.bin.WIN32/glfw-3.3.8.bin.WIN32"

SRCS := *.cpp

INCS := \
-I./ \
-I$(GLFW_PATH)/include

LIBS := -L$(GLFW_PATH)/lib-mingw -lglfw3dll -lopengl32

# exe
MAIN_TARGET := main.exe

all: $(MAIN_TARGET)
	$(print_hline)
	@echo "Building target '$@', deps '$^'"

$(MAIN_TARGET): $(SRCS) Makefile
	$(print_hline)
	@echo "Building target '$@', deps '$^'"
	g++ -fdiagnostics-color=always -std=c++17 -g $(INCS) $(SRCS) -o $@ $(LIBS)

run: $(MAIN_TARGET)
	$(print_hline)
	@echo "running $(MAIN_TARGET):"
	@./$(MAIN_TARGET)

clean:
	rm -f $(MAIN_TARGET) imgui.ini

.PHONY: all run clean
