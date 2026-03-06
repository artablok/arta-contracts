// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/*
Arta Blockchain Ecosystem
Token: USDC.a
Standard: ART20 / ERC20 compatible
Repository: https://github.com/artablok/arta-contracts
*/

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract USDCA is ERC20, Ownable {

    uint256 public constant MAX_SUPPLY = 10000000000 * 10**18;

    constructor() ERC20("USDC.a", "USDC.a") {
        _mint(msg.sender, MAX_SUPPLY);
    }

}
