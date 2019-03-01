# Nepal Food Bank
Work in progress

### Contracts Files Description Table

|  File Name  |  SHA-1 Hash  |
|-------------|--------------|
| ./contracts/NepalFoodBank.sol | b480d818684cf20749e186cc7207fcabc3974651 |
| ./contracts/NPaisa.sol | db9caa25e0571c20aa33b660857064c83c96385c |
| ./contracts/NFBShare.sol | 997c16b4661aa8ca06129e5a72d6e807211282ef |
| ./contracts/Token.sol | 54f3ab17de20e76ced75c8bc87ac530628b97348 |

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
| **NPaisa** | Implementation | Token |||
||||||
| **NFBShare** | Implementation | Token |||
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