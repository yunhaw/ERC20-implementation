# 部署 ERC-20 並鑄造代幣之實作

###### tags: `Notes`
###### Title: 部署 ERC-20 並鑄造代幣之實作 
###### Date: 2022.06.15 
###### Update: 2022.06.15
###### Link: https://hackmd.io/@Raheem/rkehCEvKq
###### GitHub：https://github.com/yunhaw/ERC20-implementation
###### Author: Raheem
---

## Outline
> 1. 簡介
> 2. 實作
> 2-1. 事前準備
> 2-2. 部署 ERC-20 合約 
> 2-3. mint 代幣
> 2-4. 檢查結果

## 1. 簡介
- 可以透過 ERC-20 智能合約發行自己的代幣
- Token: ERC-20 合約解析
    - [GitHub](https://github.com/ethereum/EIPs/issues/20)
        - totalSupply
            - 最大供給量
            - constant是舊語法，新語法已改成 pure 或 view
        - balanceOf
            - 查該地址有多少代幣(ERC-20)
        - transfer
            - 轉帳，參數（給地址, 多少）
        - transferFrom
            - 授權給別人協助轉帳
            - approve 搭配使用
            - allowance
                - 查詢可以用多少錢
        - event 
            - 在 etherscan 顯示事件

## 2. 實作
### 2-1. 事前準備
> 1. 區塊鏈與[以太坊](https://ethereum.org/zh-tw/)基礎概念（[以太坊教科書](https://cypherpunks-core.github.io/products/MasteringEthereum/)）
> 1. 對 Solidity 撰寫的 Smart contract 有初步理解
> 1. 熟悉 [RemixIDE](https://remix.ethereum.org) 
> 1. 熟悉 [Etherscan](https://etherscan.io/)
> 1. 準備好 Metamask，並且有足夠的測試幣(Rinkeby)，並連結 [Opensea Testnets](https://testnets.opensea.io/)

### 2-2. 部署 ERC-20 合約

- 新增一個 ERC-20 合約，並透過 RemixIDE 開啟
    - [OpenZeppelin ERC-20 合約範本](https://docs.openzeppelin.com/contracts/4.x/erc20)
    - ERC-20 完整的合約內容在 OpenZeppelin 的 [GitHub](https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol)

- 將 OpenZeppelin 的 ERC-20 範本貼到 [RemixIDE](https://remix.ethereum.org/) 上
- ERC-20 合約內容如下
```solidity=
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
```
![](https://i.imgur.com/6u4w151.png)

- 編譯完成後，準備部署
- 記得選擇 Injected Web3 連結 Metamask 以及此份合約 

![](https://i.imgur.com/mTSqlhl.png)

## 2-3. mint 代幣
- 輸入代幣的最大供應量，這邊輸入 1000000000000000000000，1000顆代幣
    - 單位與 ether 相同，所以十進位數字要 * 10^18 = 1顆代幣

![](https://i.imgur.com/grU1L45.png)

- 成功部署上鏈後，可以自行操作此合約的功能

![](https://i.imgur.com/U9XE0PC.png)

## 2-4. 檢查結果
> 此份合約地址： [0xf78040f27f17c63742b69b03bc4e0a3f05733dda](https://rinkeby.etherscan.io/token/0xf78040f27f17c63742b69b03bc4e0a3f05733dda)

- 在 etherscan 確認此代幣發行成功後，打開 Metamask 錢包匯入自己鑄造的代幣，即可完成

![](https://i.imgur.com/1EvSAQ5.png)
![](https://i.imgur.com/vmcBZxU.png)
![](https://i.imgur.com/c3weA0I.png)
![](https://i.imgur.com/CAjvrjd.png)
![](https://i.imgur.com/XK9YH4W.png)
