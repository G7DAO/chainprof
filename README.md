<p align="center">
<a href="https://game7.io/"><svg width="40" height="40" viewBox="0 0 40 40" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M0 12.8C0 8.31958 0 6.07937 0.871948 4.36808C1.63893 2.86278 2.86278 1.63893 4.36808 0.871948C6.07937 0 8.31958 0 12.8 0H27.2C31.6804 0 33.9206 0 35.6319 0.871948C37.1372 1.63893 38.3611 2.86278 39.1281 4.36808C40 6.07937 40 8.31958 40 12.8V27.2C40 31.6804 40 33.9206 39.1281 35.6319C38.3611 37.1372 37.1372 38.3611 35.6319 39.1281C33.9206 40 31.6804 40 27.2 40H12.8C8.31958 40 6.07937 40 4.36808 39.1281C2.86278 38.3611 1.63893 37.1372 0.871948 35.6319C0 33.9206 0 31.6804 0 27.2V12.8Z" fill="#FE2C2E"></path><path d="M6.71875 11.0938L12.1477 19.3872H19.1812L17.5837 16.9457H22.6535L16.6019 26.193L20.1172 31.5625L33.5156 11.0938H6.71875Z" fill="white"></path></svg></a>
</p>
<h1 align="center">Chainprof Rollup Profiler</h1>

## Requirements

1. NodeJs >= 18 (use nvm)
2. Fill the .env file with the correct values(see .env.example)
3. Install dependencies
4. Build the project

```shell
npm install
```

```shell
make clean && make
```

# Setup chain profiling

This checklist describes how to setup chain profiling

## Environment variables

- [x] `export RPC=<rpc endpoint>`
- [x] `export NUM_ACCOUNTS=<number of accounts to create>`
- [x] `export ACCOUNTS_DIR=<directory containing generated accounts>`
- [x] `export ACCOUNTS_PASSWORD=<password to unlock accounts>`

## Create Accounts to be used for chain profiling

- [x] Create accounts for chain profiling

```bash
bin/chainprof chainprof accounts \
  --accounts-dir $ACCOUNTS_DIR \
  --num-accounts $NUM_ACCOUNTS \
  --password $ACCOUNTS_PASSWORD \
  --rpc $RPC
```

## Transfer Native tokens to Created Accounts

### Environment variables

- [x] `export KEY=<path to keyfile of account to fund>`
- [x] `export VALUE=<value to send to accounts>`

### Fund Accounts

- [x] Send Transaction to fund accounts with Native Token

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

- [x] `export RECIPIENT=<address to send funds to>`

### Drain Accounts

- [x] Send Transaction to Transfer all Native Token balance from created accounts to recipient

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

- [x] `export NUM_TRANSACTIONS=<number of transactions to send>`
- [x] `export CALLDATA=<calldata to send in transactions>`
- [x] `export OUTFILE=<output file to write results to>`
- [x] `export TO=<address to send transactions to>`
- [x] `export KEY=<path to keyfile of account to send transactions from>`

### Evaluate

- [x] Send Transactions to evaluate chain performance

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
