# Subscription Renewal Reminder Smart Contract

This project is a simple Solidity-based smart contract designed to manage and remind users of their on-chain subscription renewals. It is deployed on the Edu Chain network and can be used to track subscription end dates and notify users when their subscription is due for renewal.

## Features

1. **Renewal Reminder**: The contract emits an event (`RenewalReminder`) to notify users when their subscription is due for renewal.
2. **Fixed Subscription Period**: The subscription period is fixed (e.g., 30 days) and can be easily modified in the contract.
3. **On-Chain Storage**: Subscription end dates are stored on-chain using a mapping, ensuring transparency and immutability.
4. **No Input During Deployment**: The contract does not require any input during deployment, making it simple to deploy and use.
5. **Test Functionality**: Includes a `startSubscription` function to simulate the start of a subscription for testing purposes.

## Contract Details

- **Solidity Version**: `0.8.0`
- **Deployed Address**: [`0x00cd2CfE78aFe53E352AcBA1B15F14aE71Bf0169`](https://educhain-explorer.example.com/address/0x00cd2CfE78aFe53E352AcBA1B15F14aE71Bf0169) (Edu Chain Network)
- **License**: MIT

## How It Works

1. **Subscription Period**: The contract uses a fixed subscription period of 30 days (can be modified).
2. **Subscription End Date**: Each subscriber's subscription end date is stored in a mapping (`subscriptionEndDate`).
3. **Renewal Check**: The `checkRenewal` function checks if the current time is greater than or equal to the subscription end date. If so, it emits a `RenewalReminder` event and updates the subscription end date for the next period.
4. **Start Subscription**: The `startSubscription` function is provided for testing purposes to simulate the start of a subscription.

## Usage

### Deploying the Contract
1. Compile the contract using a Solidity compiler (e.g., Remix, Hardhat, or Truffle).
2. Deploy the contract to the Edu Chain network.
3. No input is required during deployment.

### Interacting with the Contract
1. **Start a Subscription**: Call the `startSubscription` function with the subscriber's address to set an initial subscription end date.
   ```solidity
   startSubscription(0xSubscriberAddress);
   ```
2. **Check for Renewal**: Call the `checkRenewal` function with the subscriber's address to check if the subscription is due for renewal.
   ```solidity
   checkRenewal(0xSubscriberAddress);
   ```
   - If the subscription is due, the contract will emit a `RenewalReminder` event and update the subscription end date.

### Example Workflow
1. Deploy the contract.
2. Call `startSubscription` to initialize a subscription for a user.
3. Periodically call `checkRenewal` to check if the subscription is due for renewal.
4. Listen for the `RenewalReminder` event to notify users.

## Contract Code

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SubscriptionRenewalReminder {
    // Event to notify when a subscription is due for renewal
    event RenewalReminder(address subscriber, uint256 dueDate);

    // Fixed subscription period (e.g., 30 days in seconds)
    uint256 public constant SUBSCRIPTION_PERIOD = 30 days;

    // Mapping to store the subscription end date for each subscriber
    mapping(address => uint256) public subscriptionEndDate;

    // Function to check if a subscription is due for renewal
    function checkRenewal(address subscriber) public {
        require(block.timestamp >= subscriptionEndDate[subscriber], "Subscription is still active");

        // Emit a renewal reminder event
        emit RenewalReminder(subscriber, subscriptionEndDate[subscriber]);

        // Update the subscription end date for the next period
        subscriptionEndDate[subscriber] = block.timestamp + SUBSCRIPTION_PERIOD;
    }

    // Function to simulate a new subscription (for testing purposes)
    function startSubscription(address subscriber) public {
        subscriptionEndDate[subscriber] = block.timestamp + SUBSCRIPTION_PERIOD;
    }
}
```

## Links
- **Deployed Contract Address**: [`0x00cd2CfE78aFe53E352AcBA1B15F14aE71Bf0169`](https://educhain-explorer.example.com/address/0x00cd2CfE78aFe53E352AcBA1B15F14aE71Bf0169) (Edu Chain Network)
- **Edu Chain Explorer**: [Edu Chain Explorer](https://educhain-explorer.example.com)

