# Foundry Basics: Project Setup, Deployment & Interaction (L1 & L2)

## 📌 Overview

This lecture introduces **Foundry**, a professional Solidity development framework, and explains how smart contracts are developed, deployed, tested, and interacted with on both **Layer 1 (Ethereum)** and **Layer 2 (zkSync)** networks.

We explored how Foundry tools work together and how blockchain interactions happen through RPC URLs.

---

## 🧱 Foundry Project Structure

A standard Foundry project contains:

```

.
├── src/        # Smart contracts (production code)
├── test/       # Unit & integration tests (temporary deployments)
├── script/     # Deployment scripts (real deployments)
├── foundry.toml
└── .env        # Environment variables (NOT committed)

```

### Purpose of each folder

| Folder    | Purpose                                        |
| --------- | ---------------------------------------------- |
| `src/`    | Actual smart contracts                         |
| `test/`   | Testing contracts (no real gas spent)          |
| `script/` | Real deployments to local, testnet, or mainnet |

---

## 🛠 Foundry Core Tools

### Forge

- Compiles contracts
- Runs tests
- Deploys contracts using scripts

### Cast

- Interacts with contracts that are already deployed
- Sends transactions
- Reads on-chain state

### Anvil

- Local Ethereum blockchain
- Similar to Ganache
- Resets every time it restarts

---

## 🌐 Understanding RPC URLs & Transactions

Sending a transaction using **MetaMask** is equivalent to sending an **HTTP POST request** to a blockchain **RPC URL**.

Similarly:

- Foundry sends transactions through RPC URLs
- RPC URLs can be provided by:
  - Local nodes (`Anvil`)
  - Node providers (Alchemy, Infura)

---

## 🔐 Environment Variables & Security

We use an `.env` file to store sensitive data:

```env
RPC_URL=http://127.0.0.1:8545
PRIVATE_KEY=0xYOUR_PRIVATE_KEY
```

⚠️ **Security Notes**

- Never commit `.env` files
- Never expose private keys publicly
- Always use test wallets when learning

---

## 🧪 Testing Contracts (Temporary Deployment)

Tests deploy contracts **locally and temporarily**.

### Run all tests

```bash
forge test
```

### Run tests with verbose output

```bash
forge test -vv
```

### Show gas usage (measured, not paid)

```bash
forge test --gas-report
```

🧠 Gas is **measured** for optimization but **no ETH is spent** during tests.

---

## 🚀 Deploying Contracts (Real Deployment)

### Start a local blockchain

```bash
anvil
```

### Deploy using a script

```bash
forge script script/DeploySimpleStorage.s.sol \
  --rpc-url $RPC_URL \
  --broadcast
```

> `vm.startBroadcast()` enables real on-chain deployment.

---

## 🔄 Interacting with Deployed Contracts (Cast)

### Send a transaction (write)

```bash
cast send <CONTRACT_ADDRESS> \
"store(uint256)" 777 \
--rpc-url $RPC_URL \
--private-key $PRIVATE_KEY
```

### Read contract state (view)

```bash
cast call <CONTRACT_ADDRESS> \
"retrieve()" \
--rpc-url $RPC_URL
```

### Check deployed contract code

```bash
cast code <CONTRACT_ADDRESS> --rpc-url $RPC_URL
```

---

## ⚠️ Common Beginner Mistakes

- Running Foundry commands outside the project root
- Forgetting to pass `--rpc-url`
- Restarting Anvil (resets the blockchain)
- Mixing vanilla Foundry and Foundry zkSync in one project

---

## 🧠 Gas: Measured vs Paid

| Context                    | Gas Measured | Gas Paid |
| -------------------------- | ------------ | -------- |
| `forge test`               | ✅ Yes       | ❌ No    |
| `forge script --broadcast` | ✅ Yes       | ✅ Yes   |
| `cast send`                | ✅ Yes       | ✅ Yes   |

---

## 🧱 Layer 1 vs Layer 2

### Layer 1 (L1)

- Ethereum
- Provides security and final settlement

### Layer 2 (L2)

- zkSync Era
- Faster and cheaper execution
- Security inherited from Ethereum

> **Key rule:** L2 executes, L1 secures.

---

## 🧪 Foundry vs Foundry zkSync

| Feature    | Vanilla Foundry  | Foundry zkSync          |
| ---------- | ---------------- | ----------------------- |
| Target     | Ethereum (L1)    | zkSync Era (L2)         |
| EVM        | Fully equivalent | EVM-compatible          |
| Deployment | Standard CREATE  | zkSync system contracts |
| Accounts   | EOAs             | Account Abstraction     |
| Local Node | Anvil            | zkSync local node       |

### Switching between toolchains

```bash
foundryup          # Ethereum / L1
foundryup-zksync   # zkSync / L2
```

---

## 🧹 Formatting & Verification

### Auto-format contracts

```bash
forge fmt
```

### Manual contract verification

- Match compiler version
- Match constructor arguments
- Upload source code manually

---

## 🎯 Key Takeaways

- Foundry uses Solidity for contracts, tests, and scripts
- Tests simulate execution without spending ETH
- Scripts deploy contracts to real networks
- RPC URLs define which blockchain you are interacting with
- L2 chains rely on L1 for security
- Foundry zkSync exists because zkSync is not fully EVM-equivalent

---

## ✅ Final Mental Model

- `src/` → What the contract is
- `test/` → Does it work?
- `script/` → How do we deploy it?
- L1 → Security & settlement
- L2 → Speed & scale

---
