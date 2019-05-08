
//storage

pragma solidity >=0.4.0 <0.6.0;

contract SimpleStorage {
    uint storedData;

    function set(uint x) public {
        storedData = x;
    }

    function get() public view returns (uint) {
        return storedData;
    }
}


//First line tells the source code what version it is written for

//unit storedData: delcares a state variable of type unit(unsigned int of 256 bits)
