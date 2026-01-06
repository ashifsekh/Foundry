# 📦 Foundry Basics & Smart Contract Deployment

## 🧭 Overview

In this lecture, we explored **Foundry**, a powerful Ethereum development toolkit, and learned how to create, compile, deploy, and interact with smart contracts using a professional workflow.

We set up a new Foundry project, understood the purpose of each core tool, deployed contracts to a local blockchain, and interacted with them using command-line utilities. We also discussed best practices for key management and contract verification.

---

## 🛠 Tools Introduced

### 🔨 Forge
- Creates Foundry projects
- Compiles Solidity contracts
- Runs scripts and tests
- Deploys contracts

### 🔗 Cast
- Interacts with deployed contracts
- Sends transactions (`cast send`)
- Reads contract state (`cast call`)

### ⛓ Anvil
- Runs a local Ethereum blockchain
- Similar to Ganache
- Provides test accounts and ETH

---

## 📁 Project Structure

Creating a Foundry project gives us a clean and professional structure:

```

simpleStorage/
├── src/          # Solidity contracts
├── script/       # Deployment scripts
├── test/         # Tests
├── lib/          # Dependencies
├── foundry.toml  # Foundry configuration
└── .env          # Environment variables

````

---

## 🚀 Creating a New Foundry Project

```bash
forge init simpleStorage
cd simpleStorage
````

---

## 🧠 Understanding RPC & Transactions

* Sending a transaction via **MetaMask** is equivalent to making an **HTTP POST request** to an **RPC URL**
* RPC URLs are provided by node services like:

  * Alchemy
  * Infura
* Foundry can use these RPC URLs to send transactions programmatically

---

## 🔐 Environment Variables & Security

We use an `.env` file to store sensitive information:

```env
PRIVATE_KEY=your_private_key_here
RPC_URL=https://eth-sepolia.g.alchemy.com/v2/your_api_key
```

Load environment variables:

```bash
source .env
```

> ⚠️ **Warning**
> Storing private keys in plain text is **not safe for real funds**.
> This setup is strictly for learning and development purposes.

---

## 🧪 Compiling Contracts

```bash
forge build
```

---

## 📜 Writing & Running Deployment Scripts

Deployment scripts are written in Solidity and stored in the `script/` directory.

```bash
forge script script/Deploy.s.sol \
  --rpc-url $RPC_URL \
  --private-key $PRIVATE_KEY \
  --broadcast
```

---

## ⛓ Running a Local Blockchain (Anvil)

```bash
anvil
```

Anvil provides:

* Local RPC URL
* Test accounts
* Private keys
* Free ETH for testing

---

## 🔄 Interacting With Contracts Using Cast

### 📤 Sending a Transaction

```bash
cast send <CONTRACT_ADDRESS> "set(uint256)" 42 \
  --private-key $PRIVATE_KEY \
  --rpc-url $RPC_URL
```

### 📥 Reading Contract State

```bash
cast call <CONTRACT_ADDRESS> "get()"
```

---

## 🧹 Formatting Solidity Code

Automatically format all contracts:

```bash
forge fmt
```

---

## ✅ Contract Verification (Manual)

We learned the manual process of verifying contracts on a blockchain explorer by ensuring:

* Compiler version matches
* Optimization settings match
* Exact source code is uploaded

Although time-consuming, this process is essential for transparency and trust.

---

## 🧩 zkSync Foundry Setup Issue & Fix (macOS)

While installing **foundry-zksync**, we encountered this error:

```
Library not loaded: libusb-1.0.0.dylib
```

### ✅ Solution

Install the missing dependency using Homebrew:

```bash
brew install libusb
```

If already installed:

```bash
brew reinstall libusb
brew link libusb
```

Restart the terminal and verify:

```bash
forge --version
cast --version
anvil-zksync --version
```

---

## 📌 Useful Foundry Commands (Quick Reference)

```bash
forge init
forge build
forge test
forge fmt
forge clean
forge script
forge --version

cast call
cast send
cast balance

anvil
anvil-zksync

foundryup
foundryup-zksync
```

---

## 🎯 Key Takeaways

* Foundry provides a professional smart contract development environment
* RPC URLs power all blockchain interactions
* Contract deployment can be fully automated
* Protecting private keys is critical
* CLI tools offer speed and precision
* Debugging setup issues is part of real-world development

---

## 🚀 Next Steps

* Write tests using `forge test`
* Deploy contracts to public testnets (e.g., Sepolia)
* Explore zkSync smart contract development
* Learn automated contract verification

```

---
