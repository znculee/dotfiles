compiler = g++
standard = -std=c++20
target = build/a.out
include_dir = -I. -I/another/path/to/inlcude
src_files = main.cpp utils.cpp

${target}: ${src_files}
	@mkdir -p build
	${compiler} ${standard} ${include_dir} ${src_files} -o${target}

.PHONY: clean
clean:
	@rm -rf build
