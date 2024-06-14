.PHONY: clean generate regenerate test docs redocs hardhat bindings

build: bin/chainprof

rebuild: clean generate build

bin/chainprof:
	mkdir -p bin
	go build -o bin/chainprof ./cmd/chainprof

clean:
	rm -rf bin/*