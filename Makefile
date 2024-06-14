.PHONY: build clean rebuild

build: bin/chainprof

rebuild: clean build

bin/chainprof:
	mkdir -p bin
	go build -o bin/chainprof ./cmd/chainprof

clean:
	rm -rf bin/*
