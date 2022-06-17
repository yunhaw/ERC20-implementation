// contracts/GLDToken.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
// 使用 openzeppelin smart contract library

contract RaheemToken is ERC20 {
    // is 為繼承 ERC20.sol 這份合約內容
    constructor(uint256 initialSupply) ERC20("RaheemToken", "RHC") {
        // 初始化
        /*
            // 於 ERC20.sol 可得知要放入的參數為（代幣名稱, 代幣代號）
            constructor(string memory name_, string memory symbol_) {
                _name = name_;
                _symbol = symbol_;
            }
        */
        _mint(msg.sender, initialSupply);
        // 鑄造代幣
        /*
            function _mint(address account, uint256 amount) internal virtual {
                // 參數為（地址, 顆數）
                // internal：繼承此合約就能調用
                require(account != address(0), "ERC20: mint to the zero address");

                _beforeTokenTransfer(address(0), account, amount);

                _totalSupply += amount;
                _balances[account] += amount;
                emit Transfer(address(0), account, amount);

                _afterTokenTransfer(address(0), account, amount);
            }
        */
    }
}