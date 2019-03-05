pragma solidity >0.4.99 <0.6.0;

import "../Utils/IERC20.sol";
import "./XERC20.sol";
/*
 * 100 Paisa = 1e18 sub-NPaisa
 * 1 NPR = 1e18 sub NPaisa
 * 1 NPR = 1 NPaisa, pegged with 99% NPR hodling  
 */
contract Token is IERC20 {
    using XERC20 for XERC20.DATA;
    XERC20.DATA private data;

    event Message(bytes32 indexed fromTo, bytes extraData); // KEC(RLP(FROM, TO)), BYTES(MESSAGE/IPFS)
    // KEC(RLP(FROM, 0x0)) is public message, add charge back to make sybill proof
    // E2EE: MESSAGE => Encrypt => IPFS => this event => IPFS => Decrypt
    // thinking messages with #hashtag channels for next buidl.
    // it'll be useful for future COUNTERFACTUAL contracts on side/offchain.
    
    constructor() public {
        data.NFB = msg.sender; // deploy from NFB
        data.dailyLimit = 100000*1e18;
        data.monthlyLimit = 500000*1e18;
    }

    modifier outMsg(address from, address to, bytes memory extraData) {
        if (extraData.length > 0) {
            emit Message(keccak256(abi.encodePacked(from, to)), extraData);
        }
        _;
    }

    function switchNFB(address _NFB) external {
        data.switchNFB(_NFB);
        // in case NFB is upgraded
    }

    function totalSupply() external view returns(uint256) {
        return data.totalSupply;
    }

    function balanceOf(address owner) external view returns(uint256) {
        return data.user[owner].balance;
    }

    function allowance(address owner, address spender) external view returns(uint256) {
        return data.user[owner].allowance[spender];
    }

    function message(
        address to, // 0x0 for public
        bytes calldata extraData // direct text or IPFS hash to json with moar IPFS hashes + extradata like, counterfactual contract source &or bytecodes
    ) external outMsg(msg.sender, to, extraData) returns(bool) {
        return true;
    }

    function transfer(address to, uint256 value) external returns(bool) {
        return data.transfer(to, value);
    }

    function transfer(
        address to,
        uint256 value,
        bytes calldata extraData
    ) external outMsg(msg.sender, to, extraData) returns(bool) {
        return data.transfer(to, value);
    }

    function approve(address spender, uint256 value) external returns(bool) {
        data.approve(spender, value);
    }

    function approve(
        address spender,
        uint256 value,
        bytes calldata extraData
    ) external outMsg(msg.sender, spender, extraData) returns(bool) {
        data.approve(spender, value);
    }

    function transferFrom(address from, address to, uint256 value) external returns(bool) {
        data.transferFrom(from, to, value);
    }

    function transferFrom(
        address from,
        address to,
        uint256 value,
        bytes calldata extraData
    ) external outMsg(msg.sender, to, extraData) returns(bool) {
        data.transferFrom(from, to, value);
    }

    function mint(address to, uint256 value) external returns(bool) {
        return data.mint(to, value);
    }

    function mint(
        address to,
        uint256 value,
        bytes calldata extraData
    ) external outMsg(msg.sender, to, extraData) returns(bool) {
        return data.mint(to, value);
    }

    function burnFrom(address from, uint256 value) external returns(bool) {
        return data.burnFrom(from, value);
    }

    function burnFrom(
        address from,
        uint256 value,
        bytes calldata extraData
    ) external outMsg(msg.sender, from, extraData) returns(bool) {
        return data.burnFrom(from, value);
    }
}