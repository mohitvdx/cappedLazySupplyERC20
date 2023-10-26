//SPDX-License identifier - MIT

pragma solidity ^0.8.0;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract ERC20Token is ERC20 {
    //uint256 private immutable i_cap;
    address[] private stakers;
    uint256 public constant totalSupply; 
    uint256 public constant decimals=18;

    error CapIsNegative();
    error NotEnoughFee();

    constructor(uint256 cap_) ERC20("NewToken", "NTK") {
        if (cap_ < 0) {
            revert CapIsNegative();
        }
        totalSupply = cap_* 10 ** uint256(decimals);
    }

    // take fee to add people to the staking array
    function addToStakers(address _staker) public payable{
        if (msg.value<= 0.02 ether)
        revert NotEnoughFee();
        stakers.push(_staker);
    }


    //make the logic to ditribute the tokens automatically 
    function tokenRelease() private {

    }
}
