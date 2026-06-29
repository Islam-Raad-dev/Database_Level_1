# Karate Club Database Requirements

## 1. Membership Management
Manages member profiles and subscription periods.
* **Profile Data:** Name, Address, Contact Information, Emergency Contact.
* **Subscription Periods:** Start Date, End Date, Fees, Paid Status (IsPaid).
* **Operations:** Enroll, renew memberships, update personal information.
* **Status Tracking:** Tracks active/inactive status and membership dates.

## 2. Instructor Management
Manages instructor profiles and qualifications.
* **Profile Data:** Name, Address, Contact Information, Qualifications.
* **Training Relationships:** Supports a many-to-many structure where a member can have multiple instructors, and an instructor can train multiple members.

## 3. Belt Rank and Testing
Manages progression tests and current belt ranks.
* **Testing Records:** Tracks test dates, results, and the conducting instructors.
* **Rank Progression:** Records and updates each member's current belt rank upon passing tests.
* **Fixed Belt Ranks:**
  1. White Belt
  2. Yellow Belt
  3. Orange Belt
  4. Green Belt
  5. Blue Belt
  6. Purple Belt
  7. Brown Belt
  8. Black Belt (1st Dan)
  9. Black Belt (2nd Dan)
  10. Black Belt (3rd Dan)
  11. Black Belt (4th Dan)
  12. Black Belt (5th Dan)
  13. Black Belt (6th Dan)
  14. Black Belt (7th Dan)
  15. Black Belt (8th Dan)
  16. Black Belt (9th Dan)
  17. Black Belt (10th Dan)
* **Test Fees:** Each belt rank requires a specific test fee.

## 4. Payment and Fee Management
Manages financial transactions for subscriptions and tests.
* **Transaction Types:** Handles payments for membership subscriptions and belt rank tests.
* **Payment Records:** Tracks payment amount, date, and payment status.
* **User Access:** Allows members to view payment history and execute new payments.