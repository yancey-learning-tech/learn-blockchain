// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.27;

contract Types {
    // 布尔类型
    bool a = true;

    // 无符号整型
    // 支持从 uint8 / uint16 / ... / uint256, 按 8 步进, 其中 uint 是 uint256 的别名
    uint b = 1;

    // 有符号整型
    // 支持从 int8 / int16 / ... / int256, 按 8 步进, 其中 int 是 int256 的别名
    int c = -1;

    // 获取整型边界
    uint uint_max = type(uint).max;
    uint uint_min = type(uint).min;
    int int_max = type(int).max;
    int int_min = type(int).min;

    // 加 / 减 / 乘 / 除 / 取余 / 指数 / 位运算 / 位移运算
    uint addition = 1 + 2;
    int subtraction = 1 - 2;
    uint multiplication = 1 * 2;
    uint division = 2 / 1;
    uint modulo = 2 % 1;
    uint exponentiation = 2 ** 2;
    int bit = ~int256(0);
    int shift = 1 << 2;

    // 固定小数点数, 注意 0.8.x 可以声明, 但不可使用, 目前可以通过定点数表示法来处理
    fixed256x2 f = 89.64;

    // 以太坊地址
    address g = 0x1234567890123456789012345678901234567890;
    address payable h = payable(0x1234567890123456789012345678901234567890); // 附带 transfer 和 send 两个方法

    uint i = g.balance; // 以 Wei 为单位的地址类型的余额
    bytes j = g.code; // 在地址类型的代码 (可以是空的)
    bytes32 k = g.codehash; // 地址类型的代码哈希值

    function transfer() public {
        /// call, delegatecall, staticcall
        // bytes memory payload = abi.encodeWithSignature(
        //     "register(string)",
        //     "MyName"
        // );
        // (bool success, bytes memory returnData) = g.call(
        //     payload
        // );
        // require(success);

        h.transfer(1);

        bool failed = h.send(1);
        if (failed) {
            // ...
        }
    }

    // 定长字节数组, 支持从 bytes1 / bytes2 / ... / bytes32, 按 1 步进
    bytes1 l = 0x01;
    bytes32 m =
        0x1234567890123456789012345678901234567890123456789012345678901234;
    uint n = m.length; // 通过 .length 获取长度

    // 字符串
    string o = "Hello, World!";
    string p = unicode"Hello 😃";

    // 枚举类型
    enum State {
        Created,
        Locked,
        Inactive
    }
    State q = State.Created;
}
