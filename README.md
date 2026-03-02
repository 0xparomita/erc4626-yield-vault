# ERC-4626 Yield Vault

This repository implements the Ethereum Improvement Proposal 4626 (Tokenized Vault Standard). It provides a robust framework for users to deposit an underlying asset and receive yield-bearing "shares."

### Core Architecture
* **Standardized Interface:** Compatible with any DeFi aggregator (Yearn, Beefy, etc.) out of the box.
* **Share Calculation:** Precision-controlled math to prevent rounding errors during deposit/withdrawal.
* **Strategy Integration:** A dedicated `afterDeposit` hook allows for immediate deployment of capital into external protocols like Aave or Compound.
* **Flat Structure:** All logic contained in `Vault.sol` for simplified auditing.

### Use Cases
1.  Building a "Savings Account" for your native token.
2.  Creating an aggregator that shifts capital between different lending rates.
3.  Standardizing NFT liquidity pool rewards.
