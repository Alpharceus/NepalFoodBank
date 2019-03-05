pragma solidity >0.4.99 <0.6.0;

import "./Token.sol";
/*
 * 100 Paisa = 1e18 sub-NPaisa
 * 1 NPR = 1e18 sub NPaisa
 * 1 NPR = 1 NPaisa, pegged with 99% NPR hodling  
 */
contract NPaisa is Token {
    string public name = "Nepal Food Bank Paisa"; // check name
    string public symbol = "NPSA"; // find a better symbol
    uint8 public decimals = 18; // using 2 as decimal is same as Rs. 1 = 100 paisa.. 
    // but WE want to go micro/nano transactions. Rs. 1 = 1e18 nano paisa (1 followed by 18 zeros)
    // moar over don't steal dust % paisa as 2 decimal rounded up value from our users's funds
}