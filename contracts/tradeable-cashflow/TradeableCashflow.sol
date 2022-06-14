pragma solidity ^0.8.0;

// import {RedirectAll, ISuperToken, ISuperfluid} from "./RedirectAll.sol";
 import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract TradeableCashflow is ERC721 {

  constructor (
    address owner,
    string memory _name,
    string memory _symbol
    //ISuperfluid host,
    //ISuperToken acceptedToken
  )
    ERC721 ( _name, _symbol )
      {

      _mint(owner, 1);
  }
}
