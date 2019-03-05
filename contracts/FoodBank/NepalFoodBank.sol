pragma solidity >0.4.99 <0.6.0;

// import "./NFBShare.sol";
import "../Token/NPaisa.sol";
/** 
 * L1-L3 and everything can be dapps managing their own underlying roles.
 * NOT looking into DSA verification @ KYC for now, so've KYC bool.
 * Instead of buidling exactly what we want, we buidl parts by parts
 * Evolution as in PFR model "Performance Feedback Revision"
 * Final DATA store will be one ENS infosphere, contracts upgrade but use same data store
 *
 * Make KYC hop 1 non kyc'd user to make it digital cash instead of cashless 1984
 * Store KYC on paper or cold^cold storage, moar private/secure than sql/blockchain.
 */

library NFBLib {
    enum ROLES {
        ZERO, // blank/default
        BOT, // for bots IOT sensors, external dapps to manage internal stuffs, or for reg'd public markets, 
        HUMAN, // basic human with KYC & EOA with token balance
        MARKET, // Food Market DApps. lending, futures, contracts
        MERCHANT, // verified merchants
        FARMER, // verified Farmers
        SHAREHODLER, // hodlers, Share Token hodlers, KYC'd ?voters if > x shares?
        OFFICEL1, // L1 technical agri office, support for farmers  
        OFFICEL2, // L2 Payment Gateway mamagement
        OFFICEL3, // L3 Shares Management 
        BOARD, // Triggers for L1-L4
        DEVS // L4 onchain governance
    } // Multi roles?

    struct USERDATA {
        mapping(uint8 => bool) roles; //allow multi roles
        bool kyc; 
    }

    struct NFBDATA {
        mapping(address => USERDATA) user;
    }

    function hazRole(NFBDATA storage _data, ROLES _role) internal view returns(bool) {
        return (_data.user[msg.sender].roles[uint8(_role)]);
    }

    function hazKYC(NFBDATA storage _data) internal view returns(bool) {
        return (_data.user[msg.sender].kyc);
    }

}

contract NepalFoodBank {
    NPaisa public nPaisa; // ERC20 Token
    // NFBShare public nfbShare; //? try ERC721, 100 NPaisa = 1 share? NFT
    // follow Company RULES better
    constructor() public {
        nPaisa = new NPaisa(); // we'll init token from here, next
        // nfbShare = new NFBShare();
    }

}
