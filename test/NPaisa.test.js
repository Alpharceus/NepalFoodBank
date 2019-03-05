const NFB = artifacts.require("NepalFoodBank");
const NPaisa = artifacts.require("NPaisa");
// const NFBShare = artifacts.require("NFBShare");

let _npaisa, _nfb
contract("Nepal Bood Bank / NPaisa", (accounts) => {

    before('should put 10000 MetaCoin in the first account', () => {
        return NFB.deployed().then((nfb) => {
            _nfb = new web3.eth.Contract(NFB.abi, nfb.address)
            return nfb.nPaisa.call()
        }).then((npaisa) => {
            return _npaisa = new web3.eth.Contract(NPaisa.abi, npaisa);
        })
    })

    it('should call decimals Function of NPaisa Token', () => {
        _npaisa.methods.decimals.call((dec) => {
            assert.equal(dec.valueOf(), 18, "Decimals in ERC20 Token isn't 18")
        })
    })

    it('should call name Function of NPaisa Token', () => {
        _npaisa.methods.name.call((dat) => {
            assert.equal(dec.string(), "Nepal Food Bank Paisa", "Name of Token is incorrect")
        })
    })

    it('should call balanceOf Function of NPaisa Token', () => {
        _npaisa.methods.balanceOf.call(accounts[0], (dec) => {
            assert.equal(dec.valueOf(), 0, "Balance of test user isn't ZERO")
        })
    })

    it('should call totalSupply Function of NPaisa Token', () => {
        _npaisa.methods.name.call((dat) => {
            assert.equal(dec.valueOf(), 0, "Total Supply of NPaisa isn't ZERO")
        })
    })

    it('should call totalSupply Function of NPaisa Token', () => {
        _npaisa.methods.name.call((dat) => {
            assert.equal(dec.valueOf(), 0, "Total Supply of NPaisa isn't ZERO")
        })
    })
});