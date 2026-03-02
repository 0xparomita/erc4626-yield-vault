const hre = require("hardhat");

async function main() {
  const ASSET_ADDRESS = "0x..."; // Address of the token to be deposited (e.g., USDC)
  
  const Vault = await hre.ethers.getContractFactory("YieldVault");
  const vault = await Vault.deploy(ASSET_ADDRESS, "Yield Vault USDC", "yvUSDC");

  console.log("ERC-4626 Vault deployed to:", vault.target);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
