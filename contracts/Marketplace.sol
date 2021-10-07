pragma solidity ^0.8.0;

// import "@openzeppelin/contracts/math/SafeMath.sol";
// import "@openzeppelin/contracts/utils/Address.sol";

import "./MarketplaceStorage.sol";
// import "./Ownable.sol";
// import "./Pausable.sol";
// import "./ContextMixin.sol";
// import "./NativeMetaTransaction.sol";


contract Marketplace is Ownable, Pausable, MarketplaceStorage, NativeMetaTransaction {

  constructor (
    address _acceptedToken,
    uint256 _ownerCutPerMillion,
    address _owner
  )
    public
  {
  }

  function createOrder() public whenNotPaused {
  }

  function cancelOrder() public whenNotPaused {
  }

  function executeOrder() public whenNotPaused {
  }

}