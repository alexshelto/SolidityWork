pragma solidity >=0.4.0 <0.6.0;


contract MyContract {
    //people array:
    uint256 public peopleCount = 0;
    //hash table:
    mapping(uint => Person) public people; //person reccord names people



    struct Person {
        uint _id;
        string _firstname;
        string _lastname;
    }

    function addPerson(string memory _firstname, string memory _lastname) public {
        peopleCount += 1;
        people[peopleCount] = Person(peopleCount, _firstname, _lastname)
;    }
}
