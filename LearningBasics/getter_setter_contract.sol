pragma solidity >=0.4.22 <0.6.0;

contract myFirstContract{
  string private name;
  //integar, signed and unsigned vars | using unsigned integar
  uint private age;

  //setters
  function set_name(string newName) {
    name = newName;
  }

  function set_age(uint new_age) {
    age = new_age;
  }

  //function getter
  function get_name() returns (string) {
    return name;
  }

  function get_age() returns (uint) {
    return age;
  }




}
