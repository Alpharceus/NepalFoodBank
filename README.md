## Nepal Food Bank 

 Work in Progress

### Contract Files Description Table


|  File Name  |  SHA-1 Hash  |
|-------------|--------------|
| ./contracts/FoodBank/NepalFoodBank.sol | 9e7f3dc68fe47f64a4874a8f94bf5bf06e1dc0f9 |
| ./contracts/FoodBank/Roles.sol | 538ce2d7a3a144bd88e0c4779fcd573c1bd4bff7 |
| ./contracts/Token/NFBShare.sol | f9dab4a7642bf130c6b24916d4556e08d4ca99d1 |
| ./contracts/Token/NPaisa.sol | db9caa25e0571c20aa33b660857064c83c96385c |
| ./contracts/Token/SafeERC20.sol | 3e75740cccfb874763dd681f293e84eb5b8a665b |
| ./contracts/Token/Token.sol | 42e40a69705c51e77ee6d90f33e54414481c6f71 |
| ./contracts/Token/XERC20.sol | beca1402cbd6a66af8443b21353d041ccc9f1d03 |


### Contracts Description Table


|  Contract  |         Type        |       Bases      |                  |                 |
|:----------:|:-------------------:|:----------------:|:----------------:|:---------------:|
|     └      |  **Function Name**  |  **Visibility**  |  **Mutability**  |  **Modifiers**  |
||||||
| **NFBLib** | Library |  |||
| └ | hazRole | Internal 🔒 |   | |
| └ | hazKYC | Internal 🔒 |   | |
||||||
| **NepalFoodBank** | Implementation |  |||
| └ | \<Constructor\> | Public ❗️ | 🛑  | |
||||||
| **Roles** | Library |  |||
||||||
| **NFBShare** | Implementation | Token |||
||||||
| **NPaisa** | Implementation | Token |||
||||||
| **SafeERC20** | Library |  |||
| └ | safeTransfer | Internal 🔒 | 🛑  | |
| └ | safeTransferFrom | Internal 🔒 | 🛑  | |
| └ | safeApprove | Internal 🔒 | 🛑  | |
| └ | safeIncreaseAllowance | Internal 🔒 | 🛑  | |
| └ | safeDecreaseAllowance | Internal 🔒 | 🛑  | |
||||||
| **Token** | Implementation | IERC20 |||
| └ | \<Constructor\> | Public ❗️ | 🛑  | |
| └ | switchNFB | External ❗️ | 🛑  |NO❗️ |
| └ | totalSupply | External ❗️ |   |NO❗️ |
| └ | balanceOf | External ❗️ |   |NO❗️ |
| └ | allowance | External ❗️ |   |NO❗️ |
| └ | message | External ❗️ | 🛑  | outMsg |
| └ | transfer | External ❗️ | 🛑  |NO❗️ |
| └ | transfer | External ❗️ | 🛑  | outMsg |
| └ | approve | External ❗️ | 🛑  |NO❗️ |
| └ | approve | External ❗️ | 🛑  | outMsg |
| └ | transferFrom | External ❗️ | 🛑  |NO❗️ |
| └ | transferFrom | External ❗️ | 🛑  | outMsg |
| └ | mint | External ❗️ | 🛑  |NO❗️ |
| └ | mint | External ❗️ | 🛑  | outMsg |
| └ | burnFrom | External ❗️ | 🛑  |NO❗️ |
| └ | burnFrom | External ❗️ | 🛑  | outMsg |
||||||
| **XERC20** | Library |  |||
| └ | switchNFB | Internal 🔒 | 🛑  | isNFB |
| └ | transfer | Internal 🔒 | 🛑  | |
| └ | approve | Internal 🔒 | 🛑  | checkpoint |
| └ | transferFrom | Internal 🔒 | 🛑  | checkpoint |
| └ | increaseAllowance | Internal 🔒 | 🛑  | checkpoint |
| └ | decreaseAllowance | Internal 🔒 | 🛑  | |
| └ | _transfer | Private 🔐 | 🛑  | checkpoint checkLimit |
| └ | mint | Internal 🔒 | 🛑  | isNFB checkpoint |
| └ | burnFrom | Internal 🔒 | 🛑  | isNFB checkpoint |


### Legend

|  Symbol  |  Meaning  |
|:--------:|-----------|
|    🛑    | Function can modify state |
|    💵    | Function is payable |
