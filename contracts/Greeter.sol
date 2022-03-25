//SPDX-License-Identifier: MIT

pragma solidity^0.8.0;

contract Whitelist{

    constructor(){
        admin = msg.sender;
    }

address private admin;
uint8 public maxList;
mapping (address => bool) internal whitelistedAddress;
uint8 public number;
modifier Onlyowner{
    require ( msg.sender == admin);
    _;
}
    


function setMax(uint8 _max) public Onlyowner {
    maxList = _max;
}



function join() public {
    require(!whitelistedAddress[msg.sender], "you have already been whitelisted");
    require(number < maxList, "max number reached,sorry boss");

    whitelistedAddress[msg.sender] = true;

    number+=1;

}
}