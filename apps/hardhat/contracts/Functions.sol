// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.27;

// function (<parameter types>) {internal|external} [pure|view|payable] [returns (<return types>)]
contract Function {
    address public seller;

    /// 函数的可见性:
    // public: 函数可以从合约内部, 外部以及继承合约中调用. 这是默认的可见性.
    // private: 函数只能从定义它的合约内部调用.
    // internal: 函数可以从定义它的合约内部以及继承合约中调用.
    // external: 函数只能从合约外部调用. external 函数比 public 函数更节省 Gas, 因为它们的参数数据存储在 calldata 中, 而不是 memory 中.
    function getValue() public pure returns (uint256) {
        return 1;
    }

    /// 函数的类型:
    // view: 函数不修改合约的状态变量.
    // pure: 函数不读取或修改合约的状态变量.
    // payable`: 函数可以接收以太币.
    function deposit() public payable {
        // 接收以太币
    }

    // 可以理解为装饰器, 该示例限制只有 owner 才能调用, 否则抛出异常
    // _ 指代实际函数的占位符
    modifier onlyOwner() {
        require(msg.sender == seller, "Only owner can call this function.");
        _;
    }

    function changeOwner(address _newOwner) public payable onlyOwner {
        seller = _newOwner;
    }

    // 异常处理, 支持 require, revert, assert
    function transfer(
        address recipient,
        uint256 amount
    ) public payable returns (uint256) {
        require(recipient.balance >= amount, "Insufficient balance.");
        if (recipient.balance >= amount) revert("");
        assert(recipient.balance >= amount);

        return recipient.balance;
    }
}
