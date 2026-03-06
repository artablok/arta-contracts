// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/*
Arta Blockchain Ecosystem
Token: TINERTIA
Standard: ERC20
Repository: https://github.com/artablok/arta-contracts
*/

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract TINERTIA is ERC20, Ownable {

    uint256 public constant MAX_SUPPLY = 150000000000 * 10**18;

    constructor() ERC20("TINERTIA", "TINERTIA") {
        _mint(msg.sender, MAX_SUPPLY);
    }

    function burn(uint256 amount) public {
        _burn(msg.sender, amount);
    }

}
