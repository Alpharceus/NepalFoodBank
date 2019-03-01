const NFB = artifacts.require("NepalFoodBank")
const NPaisa = artifacts.require("NPaisa")
// const NFBShare = artifacts.require("NFBShare")
const SafeMath = artifacts.require("SafeMath")
const ERC20 = artifacts.require("ERC20")

module.exports = function (deployer) {
    //deployer.deploy(SafeMath)
    //deployer.link(SafeMath, ERC20)
    //deployer.deploy(ERC20)
    //deployer.link(ERC20, NPaisa)
    //deployer.link(ERC20, NFBShare)
    deployer.deploy(NFB, {
        gasPrice: 5000000000
    }).then(async (nfb) => {
        console.log("   > Nepal Food Bank:    ", await nfb.address)
        console.log("   > NPaisa :            ", await nfb.nPaisa())
        // console.log("   > NFB Share :         ", await nfb.nfbShare())
    })
}