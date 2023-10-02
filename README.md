# Nonstop IO Flutter Assignment

## Overview

This app integrates with the Punk API and uses the BLoC pattern for best Flutter practices. It includes screens for user authentication, product listings, product details, and user profile management.

## Features

- **User Authentication:**
   - Implemented Google login.The Login screen is shown only if the user is not logged in.

- **Home Screen:**
  - Display a list of products from the backend using Punk API
  - Clicking on a product navigates to the Product Detail screen
  - Supports pull-to-refresh and scroll-to-load for pagination

- **Product Detail:**
   - Displays detailed information about a selected product from the API

- **Profile Screen:**
   - Allows users to view their profile picture, basic information and logout

## Tech Stack

- **Flutter:** The front-end framework.
- **BLoC:** For state management.
- **Go Router:** Used for routing and navigation between screens.
- **HTTP:** For making API requests.
- **Firebase:** for user authentication
- **Firestore:** for data storage

## Screenshots

<div style="display: flex; justify-content: space-between;">
    <img src="https://github.com/lohith-hg/nonstopio_assignment/assets/83159677/85550092-365c-4da2-a817-823c9990d8d0" alt="Login Screen" width="200" />
    <img src="https://github.com/lohith-hg/nonstopio_assignment/assets/83159677/21642e04-5f33-439d-86f1-eaf1b1a818c3" alt="Products Screen" width="200" />
    <img src="https://github.com/lohith-hg/nonstopio_assignment/assets/83159677/e30cd449-fecb-4c12-9cef-94573ee71935" alt="Product Detail Screen" width="200" />
    <img src="https://github.com/lohith-hg/nonstopio_assignment/assets/83159677/3f875d40-eec0-4cd7-9a2e-336eca4506ca" alt="Profile Screen" width="200" />
</div>

## Setup Instructions

- Clone the repository and ensure you have Flutter and Dart SDKs installed. Please note that while developing this application, Flutter SDK version 3.7.1 and Dart SDK version 2.19.1 were used.


## Test Cases

Unit tests for the Products module have been implemented to cover all possible scenarios.

To run the unit tests and check code coverage:

1. Navigate to the project directory in your terminal.
2. Run `flutter test` to execute unit tests.
3. View code coverage using `flutter test --coverage`.

### Fonts

SF Pro Text font, have been downloaded and used in the app

## Dependencies and Versions

This application relies on the following third-party libraries:

- **flutter_bloc:** (version 8.1.3).
- **flutter_svg:**  (version 2.0.5).
- **json_annotation:** (version 4.8.0).
- **json_serializable:** (version 6.6.1).
- **build_runner:** (version 2.3.3).
- **http:** (version 0.13.6).
- **go_router:** (version 10.1.2).
- **firebase_auth:** (version 4.3.0).
- **firebase_core:** (version 2.8.0).
- **cloud_firestore:** (version 4.4.5).
- **equatable:** (version 2.0.5).
- **google_sign_in:** (version 6.1.5).
- **bloc_test:** (version 9.1.4).
- **mockito:** (version 5.4.0).
