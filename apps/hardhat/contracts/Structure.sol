// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.27;

import "./Tools.sol";
import "solady/src/utils/FixedPointMathLib.sol";

event HighestBidIncreased(address bidder, uint amount);
error NotEnoughFunds(uint requested, uint available);

// 把 contract 看作面向对象的 class, 一切都一目了然了
contract Structure {
    using FixedPointMathLib for uint256;

    // 结构体, 跟 Rust 语法如出一辙
    struct Person {
        string name;
        uint256 age;
    }

    // 枚举类型
    enum State {
        Created,
        Locked,
        Inactive
    }

    // 如下这些叫做 State variable, 其实就是类里面的属性
    uint public a;
    string private b;
    Person internal person;
    State state;
    address public seller;

    // 构造器初始化 State variable
    constructor() {
        a = 1;
        b = "";
        person = Person("Alice", 30);
    }

    // 可以理解为装饰器, 该示例限制只有 owner 才能调用, 否则抛出异常
    // _ 指代实际函数的占位符
    modifier onlyOwner() {
        require(msg.sender == seller, "Only owner can call this function.");
        _;
    }

    // 相当于类里面的方法, 可以接收多个 modifier
    function changeOwner(address _newOwner) payable public onlyOwner {
        seller = _newOwner;

        // 调用其他函数
        helper(5);

        // 事件发射
        emit HighestBidIncreased(msg.sender, 10);

        // 错误处理
        if (a < 1){}
            revert NotEnoughFunds(a, 1);
        }   
}

function other() {}
