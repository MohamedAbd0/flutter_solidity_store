# Flutter Solidity Store

A Flutter DApp that connects to an Ethereum smart contract deployed on **Sepolia Testnet** using **INFURA**, interacts with IPFS files hosted via **PINATA**, manages state with **Cubit**, and routes pages with **GoRouter**.  
It also fetches live crypto prices to convert **ETH to AED**.

---

## 📦 Tech Stack

| Area             | Tools/Libraries                                                                                            |
| ---------------- | ---------------------------------------------------------------------------------------------------------- |
| Smart Contract   | Solidity, Hardhat, Remix                                                                                   |
| Blockchain       | Sepolia Testnet via INFURA RPC/WebSocket                                                                   |
| Storage (Assets) | IPFS via Pinata                                                                                            |
| Flutter Packages | web3dart, flutter_bloc (Cubit), go_router, http, web_socket_channel, dartz, injectable, get_it, collection |

---

## 📄 Smart Contract Details

- **Network:** Sepolia (Ethereum Testnet)
- **Provider:** INFURA
- **Contract Name:** `FlutterSolidityStore`
- **Main Functions Used:**
  - `storeInfo()`
  - `getAllProducts()`
  - `getProduct(string id)`
  - `getProductsByOwner(address owner)`

---

## 🧠 State Management

- **Cubit (flutter_bloc + bloc)**
  - Manages UI states for store info, product listing, and product details.
  - Ensures a clean separation between UI and business logic.
  - `SmartContractCubit` used to fetch and manage blockchain data.

---

## 🚀 Routing

- **GoRouter**
  - Handles navigation between screens (e.g., Home, Product Details).
  - Supports deep linking and parameter passing easily.

---

## 🌐 Network Communication

- **web3dart**
  - Connects to Ethereum blockchain (read/write smart contracts).
- **http**
  - Makes REST API calls (for crypto price conversion and external APIs).
- **web_socket_channel**
  - Handles WebSocket communication with INFURA for real-time blockchain updates.

---

## ⚙️ Dependency Injection & Helpers

- **injectable**
  - Auto-generates dependency injection boilerplate.
- **get_it**
  - A simple service locator to manage dependencies across the app.
- **collection**
  - Extends Dart’s collection classes for easier manipulation (e.g., advanced list operations).

---

## ➗ Functional Programming Helpers

- **dartz**
  - Used for functional error handling (e.g., `Either`, `Option`).
  - Helps cleanly manage success/failure results from blockchain/API calls.

---

## 📈 Live Crypto Price Integration

- **API:** Free cryptocurrency price API
- **Usage:** Fetches the latest ETH price in USD and AED for product price conversion.

---

## 📂 Project Structure Highlights

| File                          | Purpose                                                              |
| ----------------------------- | -------------------------------------------------------------------- |
| `smart_contract_service.dart` | Handles blockchain connection, contract loading, and function calls. |
| `config.dart`                 | Holds URLs for INFURA RPC/WS, ABI path, and contract address.        |
| `export.dart`                 | Centralized exports for easier imports across the app.               |

---

## ⚙️ Configuration

Before running the app, make sure to update the `Config` class located at:

```dart
class Config {
  /// Contract Details (SEPOLIA)
  static String CONTRACT_ADDRESS = "YOUR_DEPLOYED_CONTRACT_ADDRESS";
  static String CONTRACT_ABI = "assets/abis/FlutterSolidityStore.json";

  /// Network Details (INFURA)
  static int CHAIN_ID = YOUR_CHAIN_ID; // usually 11155111 for Sepolia
  static String RPC_HTTPS_URL = "https://sepolia.infura.io/v3/YOUR_INFURA_PROJECT_ID";
  static String PRC_SOCKET_URL = "wss://sepolia.infura.io/ws/v3/YOUR_INFURA_PROJECT_ID";

  /// IPFS Details (PINATA)
  static String PINATA_API_KEY = "YOUR_PINATA_API_KEY";
  static String PINATA_API_SECRET = "YOUR_PINATA_API_SECRET";
  static String PINATA_JWT = "YOUR_PINATA_JWT_TOKEN";
  static String PINATA_GATEWAY_URL = "https://gateway.pinata.cloud/ipfs/";
}
```

## 📋 Setup Instructions

### 1. Clone the repository

```bash
git clone https://github.com/mohamedabdo95/flutter_solidity_store.git
cd flutter_solidity_store
```

### 2. Install Flutter Dependencies

Make sure you have Flutter SDK installed. Then, run:

```bash
flutter pub get
```

### 3. Generate Dependency Injection Code

Since the project uses Injectable for dependency injection, you must generate the related files by running:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### 4. Deploy Your Smart Contract

Before running the Flutter app, you must deploy your Solidity smart contract:

- Use Remix IDE or Hardhat to deploy FlutterSolidityStore.sol to Sepolia Testnet.
- After deployment, copy the following: Contract Address - Contract ABI JSON (export it from Remix or your build artifacts)

Update these details in your Flutter project’s Config class.

### 5. Adding New Products via Remix and MetaMask

In addition to reading data from the blockchain, you can also **add new products** directly to the smart contract.

Here’s how the process works:

1. **Use Remix IDE**:

   - Open your deployed `FlutterSolidityStore` smart contract in **Remix**.
   - Call the `addProduct` function (or the corresponding function for adding a new product).
   - Enter the required parameters (e.g., product name, description, price).

2. **Confirm the Transaction via MetaMask**:

   - When you submit the transaction, **MetaMask** will prompt you to **confirm** the request.
   - Once confirmed, the transaction will be mined and included in the blockchain.

3. **Read the New Product from the Flutter App**:
   - The Flutter application automatically reads from the blockchain.
   - Newly added products will be fetched and displayed in the app the next time you fetch all products or refresh the screen.

> 🔥 This flow demonstrates the real power of DApps — the frontend (Flutter) is **always in sync** with the latest blockchain data without needing a traditional centralized database.

---
