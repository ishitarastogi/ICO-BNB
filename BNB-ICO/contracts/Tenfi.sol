pragma solidity >=0.4.22 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import { SafeMath } from "@openzeppelin/contracts/utils/math/SafeMath.sol";

/// @notice Initial hard cap for 100M tokens.
contract Tenfi is ERC20 {
     uint public num  =2;
   using SafeMath for uint256;
    constructor(uint256 totalSupply) public ERC20("Tenfi", "TEN") {
       
        _mint(msg.sender, num.div(100).mul(totalSupply));
    }
}