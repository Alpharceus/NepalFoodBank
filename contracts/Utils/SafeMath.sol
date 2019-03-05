pragma solidity >0.4.99 <0.6.0;

/**
 * @title SafeMath
 * @dev Unsigned math operations with safety checks that revert on error
 */
library SafeMath {
    /**
     * @dev Multiplies two unsigned integers, reverts on overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns(uint256 c) {
        // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
        // benefit is lost if 'b' is also tested.
        // See: https://github.com/OpenZeppelin/openzeppelin-solidity/pull/522
        if (a == 0) {
            return 0;
        }
        c = a * b;
        require(c / a == b, "SAFEMATH_OVERFLOW");
    }

    /**
     * @dev Integer division of two unsigned integers truncating the quotient, reverts on division by zero.
     */
    function div(uint256 a, uint256 b) internal pure returns(uint256 c) {
        // Solidity only automatically asserts when dividing by 0
        require(b > 0, "SAFEMATH_OVERFLOW");
        c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold
    }

    /**
     * @dev Subtracts two unsigned integers, reverts on overflow (i.e. if subtrahend is greater than minuend).
     */
    function sub(uint256 a, uint256 b) internal pure returns(uint256 c) {
        require(b <= a, "SAFEMATH_OVERFLOW");
        c = a - b;
    }

    /**
     * @dev Adds two unsigned integers, reverts on overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns(uint256 c) {
        c = a + b;
        require(c >= a, "SAFEMATH_OVERFLOW");
    }

    /**
     * @dev Divides two unsigned integers and returns the remainder (unsigned integer modulo),
     * reverts when dividing by zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns(uint256 c) {
        require(b != 0, "SAFEMATH_OVERFLOW");
        c = a % b;
    }
}
