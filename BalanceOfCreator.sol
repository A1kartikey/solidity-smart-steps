pragma solidity ^0.4.19;

contract creatorBalanceChecker {

    address creator;
    uint creatorbalance; 		// TIP: uint is an alias for uint256. Ditto int and int256.

    function creatorBalanceChecker() public 
    {
        creator = msg.sender; 								 // msg.sender is current address
        creatorbalance = creator.balance;
    }

	function getContractAddress() constant returns (address) 
	{
		return this;
	}

	function getCreatorBalance() constant returns (uint)     // Will return the creator's balance AT THE TIME THIS CONTRACT WAS CREATED
	{
        return creatorbalance;
    }
    
    function getCreatorDotBalance() constant returns (uint)  // Will return creator's balance NOW
    {
        return creator.balance;
    }
    
    /**********
     Standard kill() function to recover funds 
     **********/
    
    function kill()
    { 
        if (msg.sender == creator)
            suicide(creator);  // kills this contract and sends remaining funds back to creator
    }
        
}
