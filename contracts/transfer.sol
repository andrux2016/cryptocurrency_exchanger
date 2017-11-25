pragma solidity ^0.4.0;

contract Transfer {
    address public ownerAddress;
    event CoinTransfer(address sender, uint amount);
    
    function Transfer(address _ownerAddress) public {
        ownerAddress = _ownerAddress;
    }
    
    function () payable public {
        uint amount = msg.value;
        if (amount <= 0) return;
        
        ownerAddress.transfer(amount);
        CoinTransfer(this, amount);
    }
}
