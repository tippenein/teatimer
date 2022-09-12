all: run

run:
	nim r tt.nim

build:
	nim c tt.nim

release:
	nim c -d:release tt.nim
