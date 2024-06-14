.PHONY: clean generate regenerate test docs redocs hardhat bindings

build: hardhat bindings bin/chainprof

rebuild: clean generate build

bin/chainprof:
	mkdir -p bin
	go build -o bin/chainprof ./cmd/chainprof

bindings: bindings/ERC20/ERC20.go

test:
	npx hardhat test

clean:
	rm -rf bin/*

docs:
	forge doc

redocs: clean docs
