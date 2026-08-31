// SPDX-License-Identifier: MIT
pragma solidity 0.8.34;

/*
Arta Blockchain Ecosystem
Token: USDC.a
Network: Ethereum
Official Contract: 0xd5581C172980ea599F4d75FD3B5e858e565c4895
Repository: https://github.com/artablok/arta-contracts
*/

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract USDCA is ERC20, ERC20Permit {
    using SafeERC20 for IERC20;

    uint256 public constant INITIAL_SUPPLY =
        200_000_000_000 * 10 ** 18;

    address public immutable recoveryWallet;

    event RecoveredERC20(
        address indexed token,
        address indexed recipient,
        uint256 amount
    );

    event RecoveredETH(
        address indexed recipient,
        uint256 amount
    );

    error Unauthorized();
    error NothingToRecover();
    error ETHTransferFailed();

    constructor()
        ERC20("USDC.a", "USDC.a")
        ERC20Permit("USDC.a")
    {
        recoveryWallet = msg.sender;
        _mint(msg.sender, INITIAL_SUPPLY);
    }

    function recoverERC20(address token) external {
        if (msg.sender != recoveryWallet) {
            revert Unauthorized();
        }

        uint256 amount = IERC20(token).balanceOf(address(this));

        if (amount == 0) {
            revert NothingToRecover();
        }

        IERC20(token).safeTransfer(recoveryWallet, amount);

        emit RecoveredERC20(
            token,
            recoveryWallet,
            amount
        );
    }

    function recoverETH() external {
        if (msg.sender != recoveryWallet) {
            revert Unauthorized();
        }

        uint256 amount = address(this).balance;

        if (amount == 0) {
            revert NothingToRecover();
        }

        (bool success, ) =
            payable(recoveryWallet).call{value: amount}("");

        if (!success) {
            revert ETHTransferFailed();
        }

        emit RecoveredETH(
            recoveryWallet,
            amount
        );
    }

    receive() external payable {}
}
