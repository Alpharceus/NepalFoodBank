# Nepal Food Bank
Work in progress

### Contracts Files Description Table

|  File Name  |  SHA-1 Hash  |
|-------------|--------------|
| ./contracts/NepalFoodBank.sol | ccb95ccc48326bb7fa7a077dc211f1bd5369de28 |
| ./contracts/NPaisa.sol | db9caa25e0571c20aa33b660857064c83c96385c |
| ./contracts/Token.sol | 39745a5b18c8b4385d54c8c4bf0e5e8dd0d1c313 |


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
| **NPaisa** | Implementation | Token |||
||||||
| **Token** | Implementation | IERC20 |||
| └ | \<Constructor\> | Public ❗️ | 🛑  | |
| └ | switchNFB | External ❗️ | 🛑  | |
| └ | totalSupply | External ❗️ |   | |
| └ | balanceOf | External ❗️ |   | |
| └ | allowance | External ❗️ |   | |
| └ | message | External ❗️ | 🛑  | outMsg |
| └ | transfer | External ❗️ | 🛑  | |
| └ | transfer | External ❗️ | 🛑  | outMsg |
| └ | approve | External ❗️ | 🛑  | |
| └ | approve | External ❗️ | 🛑  | outMsg |
| └ | transferFrom | External ❗️ | 🛑  | |
| └ | transferFrom | External ❗️ | 🛑  | outMsg |
| └ | mint | External ❗️ | 🛑  | |
| └ | mint | External ❗️ | 🛑  | outMsg |
| └ | burnFrom | External ❗️ | 🛑  | |
| └ | burnFrom | External ❗️ | 🛑  | outMsg |


### Legend

|  Symbol  |  Meaning  |
|:--------:|-----------|
|    🛑    | Function can modify state |
|    💵    | Function is payable |


Generated using Surya (Solidity Inspector)