<p align="center">
<a href="https://game7.io/">
<img width="4335" alt="GAME7_LOGO_RED" src="https://github.com/G7DAO/chainprof/assets/38267570/600f533f-782d-49ef-97f5-11c096c2e13b">
</a>
</p>

<h1 align="center">Chainprof Rollup Profiler</h1>

# What

You can use **Chainprof Rollup Profiler** to evaluate which rollup suits your project better. It's a stress test for the most commonly used functions: funds transfer. 

It will check how many calls an RPC can handle at once without failing.

# Why

This is a public goods open source tool to help builders evaluate chain performance and assess the resilience of rollup providers' infrastructure.

It is made public to help advance the web3 ecosystem.

# How

## Requirements

1. Build the project

```shell
make build
```

# Setup chain profiling

This checklist describes how to setup chain profiling

## Environment variables

- [ ] `export RPC=<rpc endpoint>`
- [ ] `export NUM_ACCOUNTS=<number of accounts to create>`
- [ ] `export ACCOUNTS_DIR=<directory containing generated accounts>`
- [ ] `export ACCOUNTS_PASSWORD=<password to unlock accounts>`

## Create Accounts to be used for chain profiling

- [ ] Create accounts for chain profiling

```bash
bin/chainprof chainprof accounts \
  --accounts-dir $ACCOUNTS_DIR \
  --num-accounts $NUM_ACCOUNTS \
  --password $ACCOUNTS_PASSWORD \
  --rpc $RPC
```

## Transfer Native tokens to Created Accounts

### Environment variables

- [ ] `export KEY=<path to keyfile of account to fund>`
- [ ] `export VALUE=<value to send to accounts>`

### Fund Accounts

- [ ] Send Transaction to fund accounts with Native Token

```bash
bin/chainprof account fund \
    --rpc $RPC \
    --keyfile $KEY \
    --accounts-dir $ACCOUNTS_DIR \
    --value $VALUE
```

Output: Transaction Hashes

## Transfer Balances from Created Accounts

### Environment variables

- [ ] `export RECIPIENT=<address to send funds to>`

### Drain Accounts

- [ ] Send Transaction to Transfer all Native Token balance from created accounts to recipient

```bash
bin/chainprof account drain \
    --rpc $RPC \
    --send-to $RECIPIENT \
    --accounts-dir $ACCOUNTS_DIR \
    --password $ACCOUNTS_PASSWORD 
```

Output: Transaction Hashes

## Evaluate Chain Performance

### Environment variables

- [ ] `export NUM_TRANSACTIONS=<number of transactions to send>`
- [ ] `export CALLDATA=<calldata to send in transactions>`
- [ ] `export OUTFILE=<output file to write results to>`
- [ ] `export TO=<address to send transactions to>`
- [ ] `export KEY=<path to keyfile of account to send transactions from>`

### Evaluate

- [ ] Send Transactions to evaluate chain performance

```bash
bin/chainprof chainprof evaluate \
    --rpc $RPC \
    --accounts-dir $ACCOUNTS_DIR \
    --password $ACCOUNTS_PASSWORD \
    --value $VALUE \
    --transactions-per-account $NUM_TRANSACTIONS \
    --calldata $CALLDATA \
    --outfile $OUTFILE \
    --to $TO
```

Output: Results written to file
