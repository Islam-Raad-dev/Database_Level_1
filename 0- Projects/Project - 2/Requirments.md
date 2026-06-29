# Library Database Requirements

## 1. Book Management
Stores and manages information about library books and their specific copies.
* **Book Details:** Title, author(s), ISBN, publication date, genre, and additional details.
* **Copy Tracking:** Manages multiple copies of a book, each with a unique **Copy ID**.
* **Availability Status:** Tracks whether specific copies are available for borrowing or currently checked out.

## 2. User Management
Maintains records of registered library patrons.
* **Name**
* **Contact Information**
* **Library Card Number**

## 3. Borrowing and Returns
Handles the primary circulation processes.
* **Borrowing Records:** Logs the specific book copy borrowed, user information, borrowing date, and due date.
* **Returns:** Processes returned items and automatically updates the availability status of the book copies.
* **Condition & Time Tracking:** Flags events triggering fines or penalties, such as late returns or damaged copies.

## 4. Holds and Reservations
Manages the waitlist for unavailable materials.
* **Reservations:** Enables users to place holds on book copies currently checked out by others.
* **Queue Management:** Manages the chronological order of reservations to guarantee fairness.

## 5. Fine Management
Calculates and tracks financial penalties.
* **Calculation:** Determines the exact fines or penalties for late returns or damaged materials.
* **User Balances:** Tracks the total fine amount owed by each specific user.
* **Payment Status:** Records whether individual fines are classified as paid or pending.