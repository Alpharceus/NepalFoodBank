pragma solidity > 0.4 .99 < 0.6 .0;

import "./SafeMath.sol";

library ERC20 {
    using SafeMath
    for uint256;
    address constant Zerone = address(0);
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
    struct DATA {
        address NFB;
        uint256 totalSupply;
        mapping(address => mapping(address => uint256)) balance;
        mapping(address => uint256) limit;
    }
    // Data.balance[0x0][addr] = user balance
    // Data.balance[owner][spender] = allowance balance

    function switchNFB(DATA storage data, address _NFB) internal isNFB(data) {
        data.NFB = _NFB;
    }

    modifier validAddr(address addr) {
        require(addr != Zerone, "INVALID_ADDRESS");
        _;
    }

    function transfer(DATA storage data, address to, uint256 value) internal returns(bool) {
        _transfer(data, msg.sender, to, value);
        return true;
    }

    function approve(
        DATA storage data,
        address spender,
        uint256 value
    ) internal validAddr(spender) returns(bool) {
        data.balance[msg.sender][spender] = value;
        emit Approval(msg.sender, spender, value);
        return true;
    }

    function transferFrom(
        DATA storage data,
        address from,
        address to,
        uint256 value
    ) internal validAddr(to) returns(bool) {
        data.balance[from][msg.sender] = (data.balance[from][msg.sender]).sub(value);
        emit Approval(from, msg.sender, data.balance[from][msg.sender]);
        return _transfer(data, from, to, value);
    }

    function increaseAllowance(
        DATA storage data,
        address spender,
        uint256 addedValue
    ) internal validAddr(spender) returns(bool) {
        data.balance[msg.sender][spender] = (data.balance[msg.sender][spender]).add(addedValue);
        emit Approval(msg.sender, spender, data.balance[msg.sender][spender]);
        return true;
    }

    function decreaseAllowance(
        DATA storage data,
        address spender,
        uint256 subtractedValue
    ) internal returns(bool) {
        data.balance[msg.sender][spender] = (data.balance[msg.sender][spender]).sub(subtractedValue);
        emit Approval(msg.sender, spender, data.balance[msg.sender][spender]);
        return true;
    }

    function _transfer(
        DATA storage data,
        address from,
        address to,
        uint256 value
    ) private validAddr(to) returns(bool) {
        data.balance[Zerone][from] = (data.balance[Zerone][from]).sub(value);
        data.balance[Zerone][to] = (data.balance[Zerone][to]).add(value);
        emit Transfer(from, to, value);
    }

    modifier isNFB(DATA storage data) {
        require(msg.sender == data.NFB, "ACCESS_DENIED");
        _;
    }

    function mint(
        DATA storage data,
        address account,
        uint256 value
    ) internal isNFB(data) validAddr(account) returns(bool) {
        data.totalSupply = (data.totalSupply).add(value); // add to total supply
        data.balance[Zerone][account] = (data.balance[Zerone][account]).add(value); // transfer funds to account
        emit Transfer(Zerone, account, value); // transfer event
        return true;
    }

    function burnFrom(
        DATA storage data,
        address account,
        uint256 value
    ) internal isNFB(data) validAddr(account) returns(bool) {
        data.balance[Zerone][account] = (data.balance[Zerone][account]).sub(value); // sub from user
        data.balance[account][msg.sender] = (data.balance[account][msg.sender]).sub(value); // sub from allowance
        data.totalSupply = (data.totalSupply).sub(value); // sub from total supply
        emit Approval(account, msg.sender, data.balance[account][msg.sender]);
        emit Transfer(account, msg.sender, value); // transfer event
        emit Transfer(msg.sender, Zerone, value); // burn event
        return true;
    }
}