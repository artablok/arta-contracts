// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/*
Arta Blockchain Ecosystem
Token: USDT.a
Standard: ART20 / ERC20 compatible
Repository: https://github.com/artablok/arta-contracts
*/

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract USDTA is ERC20, Ownable {

    uint256 public constant MAX_SUPPLY = 10000000000 * 10**18;
constructor() ERC20("USDT Arta", "USDT.a") Ownable(msg.sender) {
    _mint(msg.sender, MAX_SUPPLY);
}

}
