// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/extensions/ERC4626.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract YieldVault is ERC4626, Ownable {
    
    constructor(
        IERC20 _asset,
        string memory _name,
        string memory _symbol
    ) ERC4626(_asset) ERC20(_name, _symbol) Ownable(msg.sender) {}

    /**
     * @dev Hook that is called after a deposit is made. 
     * This is where you would trigger logic to supply assets to a DEX or Lending Market.
     */
    function afterDeposit(uint256 assets, uint256 shares) internal override {
        // Example: ExternalProtocol.deposit(assets);
        super.afterDeposit(assets, shares);
    }

    /**
     * @dev Calculates the total assets managed by the vault.
     */
    function totalAssets() public view override returns (uint256) {
        return super.totalAssets();
    }

    /**
     * @dev Emergency function to rescue tokens (excluding the underlying asset).
     */
    function rescueToken(address _token) external onlyOwner {
        require(_token != address(asset()), "Cannot rescue underlying asset");
        uint256 balance = IERC20(_token).balanceOf(address(this));
        IERC20(_token).transfer(owner(), balance);
    }
}
