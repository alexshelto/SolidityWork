pragma solidity >=0.4.0 <0.6.0;


contract MyContract {
    //people array:
    Person[] public people;// people is an array of type "people"
    uint256 public peopleCount;

    struct Person {
        string _firstname;
        string _lastname;
    }

    function addPerson(string memory _firstname, string memory _lastname) public {
        people.push(Person(_firstname, _lastname));
        peopleCount += 1;
    }
}
