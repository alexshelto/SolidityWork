/*
Alex Shelton
Program uses inheritence and 2 smart contracts to make purchases

*/
pragma solidity >=0.5.0 <0.6.0;


//token smart contract simple erc20 mock
contract erc20token {
    string public name;
    mapping(address => uint256) public balances;

    constructor(string memory _name) public {
        name = _name;
    }


    function mint() public {
        balances[tx.origin] += 1;
    }


}


contract myToken is erc20token {
    string public symbol;
    address [] public owners;
    uint256 ownerCount;

    constructor(
        string memory _name,
        string memory _symbol)
        erc20token(_name) public {
            symbol = _symbol;
            name = _name;
        }

    function mint() public { //ovhttps://solidity.readthedocs.io/en/v0.5.3/contracts.htmleriding mint function
        super.mint(); //super carriess out the derived smart contracts function
        ownerCount++;
        owners.push(msg.sender);
    }
}
