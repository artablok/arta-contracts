// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/*
ART20 Token Standard
Arta Blockchain Ecosystem

Experimental token standard for modular digital assets
and cross-chain infrastructure.
*/

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

abstract contract ART20 is ERC20 {

    string public standard = "ART20";

    constructor(string memory name_, string memory symbol_)
        ERC20(name_, symbol_) {}

}
