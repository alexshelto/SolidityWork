pragma solidity >=0.5.0 <0.6.0;

//define functions and store variable
//no storage or inheritence
//meant to be used inside smart contract not ment to be used in itself

library Math {
    function divide(uint256 a, uint256 b)internal pure returns (uint256) {
        require(b > 0);
        uint256 c = a / b;
        return c;
    }
}
