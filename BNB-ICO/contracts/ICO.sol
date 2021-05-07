// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {SafeMath} from "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "./BUSD.sol";
import "./Tenfi.sol";

contract ICO {
    using SafeMath for uint256;
    using SafeERC20 for BUSD;
    using SafeERC20 for Tenfi;

    BUSD public busdtoken;
    Tenfi public tenToken;
    address  public beneficiary;
    uint256 constant START_TIME = 1620621479;
    uint256 constant END_TIME = 1621917479;
    uint256 public bnbUSDRate;
    uint256 bonus;
    uint public _amountRaised;
    // How many token units a buyer gets per wei
    uint256 public rate;

    event ICOInitialized(address beneficiary, uint256 timestamp);

    event Buy(address indexed , uint256 amount, uint256 token );

    modifier onlyBeneficiary() {
        require(msg.sender == beneficiary, "Unauthorised access");
        _;
    }

    constructor(
        uint256 _rate,
        address _tokenBusdAddress,
        address _tokenTenfiAddress,
        address  _beneficiary
    
    ) public {
        require(_rate > 0);
        require(_beneficiary !=address(0));
        busdtoken = BUSD(_tokenBusdAddress);
        tenToken=Tenfi(_tokenTenfiAddress);
        beneficiary = _beneficiary;
        
        rate = _rate;

        emit ICOInitialized(_beneficiary, block.timestamp);
    }

  

    function buy(uint256 _amount) public {
        require(START_TIME <= block.timestamp);
        require(END_TIME >= block.timestamp);
        require(_amount>0);
        
        uint transferAmount;
        
        // calculate token amount to be created

        if (block.timestamp <= START_TIME.add(7 days)){
            transferAmount = _amount.mul(60).div(100).add(_amount);
        }
        else{
            transferAmount = _amount;
            
        }

        
 emit Buy(msg.sender, _amount, transferAmount);
        busdtoken.safeTransferFrom(msg.sender, address(this), _amount);
        tenToken.safeTransfer(msg.sender, transferAmount);
    update(_amount);
 }


 function update (uint256 _weiAmount) internal{
    _amountRaised=_amountRaised.add(_weiAmount); 

 }
 
 function fundTransfer(address _beneficiary,uint256 _amountTransfer) public onlyBeneficiary{
     require(_beneficiary !=address(0));
     require(_amountTransfer>0);
     
      busdtoken.safeTransfer(_beneficiary ,_amountTransfer);
 }


}

