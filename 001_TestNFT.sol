//SPDX-License-Identifier:  MIT
pragma solidity 0.8.17;

//as per recommendations, it should ave erc165
interface IERC165{
    function supportsInterface(bytes4 interfaceID) external view returns (bool);
}

interface IERC721 is IERC165{
    function balanceOf(address owner) external view returns(uint balance);

    function ownerOf(uint tokenId) external view returns(address owner);

    function safeTransferFrom(address from, address to, uint tokenId, bytes calldata data) external ;

    function transferFrom(address from, address to, uint tokenId) external;

    function approve(address spender, uint tokenId) external;
    
    function getApproved(uint tokenId) external view returns (address operator);

    function setApprovalForAll(address operator, bool _approved) external;

    function isApprovedForAll(
        address owner,
        address operator
    ) external view returns (bool);
}


contract ERC721 is IERC721{
    //TO BE EMITTED EVENTS
    event Transfer(address indexed _from, address indexed _to, uint256 indexed _tokenId);
    event Approval(address indexed _owner, address indexed _spender, uint256 indexed _tokenId);
    event ApprovalForAll(address indexed _owner, address indexed _spender, bool _approved);

    //Mapping of tokens to users
    mapping(uint => address) public ownerOf;

    //mapping owner address to token count
    mapping(address => uint) public balanceOf;

    // Mapping from token ID to approved address
    mapping(uint => address) public getApproved;

    // mapping from owner to address to bool that knows whether or not the spender has been approved to spend all
    mapping(address =>mapping(address => bool)) public isApprovedForAll;

    function supportsInterface(bytes4 interfaceId) external pure returns (bool) {
        return
            interfaceId == type(IERC721).interfaceId ||
            interfaceId == type(IERC165).interfaceId;
    }

    //pass in a bool to allow revoke and allow spending 
    function setApprovalForAll(address _spender, bool _approved) external {
        //update the isApprovedForAll mapping
        isApprovedForAll[msg.sender][_spender]  = _approved;

        emit ApprovalForAll(msg.sender, _spender, _approved);
    }

    function approve(address _spender, uint _tokenId) external{
        //get the owner of the token 
        address _owner = ownerOf[_tokenId];


        //check to ensure owner of token is the msg.sender
        require(_owner == msg.sender, "NOT YOUR TOKEN");

        //update the getApproved mapping
        getApproved[_tokenId] = _spender;

        //emit the approval event
        emit Approval(_owner, _spender, _tokenId);
    }

     function _isApprovedOrOwner(
        address owner,
        address spender,
        uint id
    ) internal view returns (bool) {
        return (spender == owner ||
            isApprovedForAll[owner][spender] ||
            spender == getApproved[id]);
    }

    function transferFrom(address _from,  address _to, uint _tokenId) public {

        //ensure that the person transferring is allowed to spend
        //check if person transfering is allowed all
        bool isAllowedToSpend = _isApprovedOrOwner(_from, msg.sender, _tokenId);
        require(isAllowedToSpend , "NOT APPROVED");
        
        //UPDATE THE OWNER oF mapping
        ownerOf[_tokenId] = _to;
        //deduct token count
        balanceOf[_from] -= 1;
        //update receivers token 
        balanceOf[_to] += 1;

        //update approval mapping for the token
        getApproved[_tokenId] = address(0);


        emit Transfer(_from, _to, _tokenId);
    }

    function safeTransferFrom(
        address from,
        address to,
        uint id,
        bytes calldata data
    ) external {
        transferFrom(from, to, id);

        // require(
        //     to.code.length == 0 ||
        //         IERC721Receiver(to).onERC721Received(msg.sender, from, id, data) ==
        //         IERC721Receiver.onERC721Received.selector,
        //     "unsafe recipient"
        // );


    }

    function _mint(address _to, uint _id) internal{

        // check it isnt minted to address 0 and check that the id hasnt been mapped to an address 
        require(_to != address(0), "CANT MINT TO ZERO ADDRESS");
        if(ownerOf[_id] != address(0)){
            revert("TOKEN ALREADY MINTED");
        }
        //minting process 
        ownerOf[_id] = _to;
        balanceOf[_to] += 1;

        emit Transfer(address(0), _to, _id);
    }

    function _burn(uint id) internal{
        address owner = ownerOf[id];
        //ensure token has been minted and owner is the one burning
        require(owner != address(0), "NOT MINTED");
        require(msg.sender == owner, "NOT OWNER");

        //reduce owners balance
        balanceOf[owner] -= 1;
        //delete token existence
        ownerOf[id] = address(0);
        //clear approvals mapping
        getApproved[id] = address(0);

        emit Transfer(owner, address(0), id);

    }
}

contract Web3NFT is ERC721{


    function mint(address to, uint id) external{
        _mint(to, id);
    }

    function burn( uint id) external{
        _burn(id);
    }
}