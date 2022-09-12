all: release

build:
	nim c tt.nim

release:
	nim c -d:release tt.nim
