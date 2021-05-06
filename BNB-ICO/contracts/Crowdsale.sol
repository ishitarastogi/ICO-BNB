// SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.0;

import { SafeMath } from "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@chainlink/contracts/src/v0.6/interfaces/AggregatorV3Interface.sol";
import "./BUSD.sol";
 contract ICO {
      using SafeMath for uint256;
        BUSD private token;
        address payable public beneficiary; 
        uint256 constant START_TIME =	1620621479;
        uint256 constant END_TIME=	1621917479;
         uint256 public bnbUSDRate;
         uint256 bonus;
 
      event ICOInitialized(address beneficiary, uint256 timestamp);
    
    event Buy(address indexed investor, uint256 amount, uint256 timestamp);
    event EthReturned(address indexed investor, uint256 amount, uint256 timestamp);

     modifier onlyBeneficiary() 
    {
        require(msg.sender == beneficiary, "Unauthorised access");
        _;
    }
    
    constructor(
        address _tokenAddress, 
        address _whitelistAddress,
        address payable _beneficiary,
        uint256 _bnbUSDRate 
    ) public 
    {
        
        token = BUSD(_tokenAddress);
        beneficiary = _beneficiary;
        bnbUSDRate = _baseEthUSDRate;
       

        emit ICOInitialized(_beneficiary, block.timestamp);
    }
    receive() external payable
    {
        buy();
    }

 function buy() public payable {
     
 }


 }