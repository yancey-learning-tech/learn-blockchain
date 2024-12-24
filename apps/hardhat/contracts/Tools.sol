// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.27;

// 工具函数放在合约之外, 最好统一放一个文件里
function helper(uint x) pure returns (uint) {
    return x * 2;
}
