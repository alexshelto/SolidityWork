//Alexander Shelton

pragma solidity >=0.4.0 <0.6.0;


contract Bank {
  uint private value; //internal can be accessed by payment contract

  function deposit(uint amount)public {
    value += amount;
  }

  function withdraw(uint amount)public {
    value -= amount;
  }

  function balance() public view returns(uint){
    return value;
  }
}

//'is' is the  inheritance keyword
contract payment is Bank {
    string private userName;
    uint private age;

    //getters
    function get_name() public view returns (string memory) {
      return userName;
    }

    function get_age() public view returns(uint) {
      return age;
    }
/*
    function get_balance() public returns(uint) {
      return balance;
    } */

    //setters:

    function setName(string memory newName) public {
      userName = newName;
    }

    function setAge(uint newAge) public {
      age = newAge;
    }
/*
    function setBalance(uint newB) public {
      balance = newB;
    } */

}
