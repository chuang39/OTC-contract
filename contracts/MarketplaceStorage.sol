pragma solidity ^0.8.0;


/**
 * Interface for contracts conforming to ERC-20
 */
interface ERC20Interface {
  // Standard ERC-20 interface.
  function transfer(address to, uint256 value) external returns (bool);
  function approve(address spender, uint256 value) external returns (bool);
  function transferFrom(address from, address to, uint256 value) external returns (bool);
  function totalSupply() external view returns (uint256);
  function balanceOf(address who) external view returns (uint256);
  function allowance(address owner, address spender) external view returns (uint256);
}


contract MarketplaceStorage {
  // ERC20Interface public acceptedToken;

  struct Order {
    // Order ID
    bytes32 id;
    // Address which lists order
    address merchant;
    // Stable coin address
    address tokenAddress;
    bool isSplitable;
    // Buy or Sell
    uint8 orderType;
    uint8 currency;
    uint256 price;
    uint256 quantity;
    // Time when this order ends
    uint256 expiresAt;
  }

  // From StableCoin+OrderID to Order (to avoid asset collision)
  mapping (address => mapping(uint256 => Order)) public orderById;

  uint256 public ownerCutPerMillion;
  uint256 public publicationFeeInWei;

  bytes4 public constant InterfaceId_ValidateFingerprint = bytes4(
    keccak256("verifyFingerprint(uint256,bytes)")
  );

  // EVENTS
  event OrderCreated(
    bytes32 id,
    address indexed merchant,
    address tokenAddress,
    bool isSplitable,
    uint8 orderType,
    uint8 currency,
    uint256 price,
    uint256 quantity,
    uint256 expiresAt
  );
  event OrderSuccessful(
    bytes32 id,
    address indexed merchant,
    address tokenAddress,
    bool isSplitable,
    uint8 orderType,
    uint8 currency,
    uint256 price,
    uint256 quantity,
    uint256 expiresAt
  );
  event OrderCancelled(
    bytes32 id,
    address indexed merchant,
    address tokenAddress,
    uint8 orderType,
    uint8 currency,
    uint256 price,
    uint256 quantity
  );
  event OrderUpdated(
    bytes32 id,
    address indexed merchant,
    address tokenAddress,
    bool isSplitable,
    uint8 orderType,
    uint8 currency,
    uint256 price,
    uint256 quantity,
    uint256 expiresAt
  );


  event ChangedPublicationFee(uint256 publicationFee);
  event ChangedOwnerCutPerMillion(uint256 ownerCutPerMillion);
}