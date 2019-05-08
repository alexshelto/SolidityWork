pragma solidity >=0.5.0 <0.6.0;

contract myContract {

    mapping(address => uint256) public balances;
    address payable wallet; //payable is a type needed

    event Purchase(
        address _buyer,
        uint256 amount
        );

    constructor(address payable _wallet) public {
        wallet = _wallet;
    }


    function buyToken() public payable{
        //buy a token, send ether to wallet
        balances[msg.sender] += 1;
        wallet.transfer(msg.value);
        emit Purchase(msg.sender, 1);
    }
}
