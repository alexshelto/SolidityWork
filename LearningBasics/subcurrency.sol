pragma solidity >=0.4.0 <0.6.0;

contract Coin {
    // The keyword "public" makes those variables
    // easily readable from outside.
    address public minter;
    mapping (address => uint) public balances;

    // Events allow light clients to react to
    // changes efficiently.
    event Sent(address from, address to, uint amount);

    // This is the constructor whose code is
    // run only when the contract is created.
    constructor() public {
        minter = msg.sender;
    }

    function mint(address receiver, uint amount) public {
        require(msg.sender == minter);
        require(amount < 1e60);
        balances[receiver] += amount;
    }

    function send(address receiver, uint amount) public {
        require(amount <= balances[msg.sender], "Insufficient balance.");
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit Sent(msg.sender, receiver, amount);
    }
}

/*Contract Concepts:
1.) address public minter: declares a state variale of type address that is public
-The address is a type 160-bit value that does not allow any arithmetic operations

2.) The keyword public automatically generates a function that allows you to access
the current value of the state variable from outside of the contract
--Without a public keyword, other contracts have no way to access the variable

3.)mapping (address => uint) public balances; also creates a public state
variable, but it is a more complex datatype. The type maps addresses to unsigned integers



*/
