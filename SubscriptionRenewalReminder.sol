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
