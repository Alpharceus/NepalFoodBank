pragma solidity >0.4.99 <0.6.0;

import "./SafeMath.sol";

library ERC20 {
    using SafeMath
    for uint256;
    address private constant ZEROADDR = address(0);
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    struct USER {
        uint256 balance;
        uint256 shares; //new issue internal logic or ERC721?
        uint256 dayTx;
        uint256 monthTx;
        uint256 monthTimer;
        uint256 dayTimer;
        mapping(address => uint256) allowance;
    }

    struct DATA {
        address NFB;
        uint256 totalSupply;
        mapping(address => USER) user;
        mapping(address => bool) service; // extra / emergency use without limits. 
        uint256 dailyLimit;
        uint256 monthlyLimit;
    }

    function switchNFB(DATA storage data, address _NFB) internal isNFB(data) {
        data.NFB = _NFB;
    }

    modifier checkpoint(address addr) {
        require(addr != ZEROADDR, "INVALID_ADDRESS");
        _;
    }

    modifier checkLimit(DATA storage data, address from, uint256 value) {
        if (data.user[from].dayTimer < (now - 24 hours)) {
            data.user[from].dayTimer = now;
            data.user[from].dayTx = value;
        } else {
            require(data.user[from].dayTx <= data.dailyLimit, "OVER_DAILY_LIMIT");
            data.user[from].dayTx = (data.user[from].dayTx).add(value);
        }

        if (data.user[from].monthTimer < (now - 30 days)) {
            data.user[from].monthTimer = now;
            data.user[from].monthTx = value;
        } else {
            require(data.user[from].monthTx <= data.monthlyLimit, "OVER_MONTHLY_LIMIT");
            data.user[from].monthTx = (data.user[from].monthTx).add(value);
        }
        _;
    }

    modifier isNFB(DATA storage data) {
        require(msg.sender == data.NFB, "ACCESS_DENIED");
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
    ) internal checkpoint(spender) returns(bool) {
        data.user[msg.sender].balance = value;
        emit Approval(msg.sender, spender, value);
        return true;
    }

    function transferFrom(
        DATA storage data,
        address from,
        address to,
        uint256 value
    ) internal checkpoint(to) returns(bool) {
        data.user[from].allowance[msg.sender] = (data.user[from].allowance[msg.sender]).sub(value);
        emit Approval(from, msg.sender, data.user[from].allowance[msg.sender]);
        return _transfer(data, from, to, value);
    }

    function increaseAllowance(
        DATA storage data,
        address spender,
        uint256 addedValue
    ) internal checkpoint(spender) returns(bool) {
        data.user[msg.sender].allowance[spender] = (data.user[msg.sender].allowance[spender]).add(addedValue);
        emit Approval(msg.sender, spender, data.user[msg.sender].allowance[spender]);
        return true;
    }

    function decreaseAllowance(
        DATA storage data,
        address spender,
        uint256 subtractedValue
    ) internal returns(bool) {
        data.user[msg.sender].allowance[spender] = (data.user[msg.sender].allowance[spender]).sub(subtractedValue);
        emit Approval(msg.sender, spender, data.user[msg.sender].allowance[spender]);
        return true;
    }

    function _transfer(
        DATA storage data,
        address from,
        address to,
        uint256 value
    ) private checkpoint(to) checkLimit(data, from, value) returns(bool) {
        data.user[from].balance = (data.user[from].balance).sub(value);
        data.user[to].balance = (data.user[to].balance).add(value);
        emit Transfer(from, to, value);
    }

    function mint(
        DATA storage data,
        address account,
        uint256 value
    ) internal isNFB(data) checkpoint(account) returns(bool) {
        data.totalSupply = (data.totalSupply).add(value); // add to total supply
        data.user[account].balance = (data.user[account].balance).add(value); // transfer funds to account
        emit Transfer(ZEROADDR, account, value); // transfer event
        return true;
    }

    function burnFrom(
        DATA storage data,
        address account,
        uint256 value
    ) internal isNFB(data) checkpoint(account) returns(bool) {
        data.user[account].allowance[msg.sender] = (data.user[account].allowance[msg.sender]).sub(value); // sub from allowance
        // data.user[account].balance = (data.user[account].balance).sub(value); // sub from user
        data.totalSupply = (data.totalSupply).sub(value); // sub from total supply
        emit Approval(account, msg.sender, data.user[account].allowance[msg.sender]);
        // emit Transfer(account, msg.sender, value); // transfer event
        _transfer(data, account, ZEROADDR, value);
        // emit Transfer(msg.sender, ZEROADDR, value); // burn event
        return true;
    }
}