# star-wars

## Description

This sample application was developed in Swift and SwiftUI, aiming to display a list of Star Wars characters and provide details about each one. The app follows the Model-View-ViewModel (MVVM) architecture to separate the presentation logic from the data, ensuring a more modular and maintainable codebase. Additionally, SOLID principles and best practices, such as Dependency Injection, have been applied to establish a solid and scalable foundation.

## Features

- Displays a list of Star Wars characters.
- Allows viewing specific details of each character.

## MVVM Architecture

The Model-View-ViewModel (MVVM) architecture is a way to structure the application that allows separating responsibilities and improving code organization. Here's how it's applied in this application:

- **Model:** Represents the data and business logic. In this case, Star Wars character data is obtained through the networking layer and appropriately modeled for use in the user interface.

- **View:** Is responsible for presenting the user interface. In this project, SwiftUI views are used to display the list of characters and details of each one.

- **ViewModel:** Acts as an intermediary between the model and the view. It handles obtaining data from the model and providing it in a suitable format for display. It also manages presentation logic and view interactions.

## Networking Layer and Dependency Injection

For the networking layer, the Combine framework is used, which is a Swift framework for working with asynchronous operations. This allows making network requests to fetch Star Wars character data efficiently and in the background.

As for Dependency Injection, it's implemented to provide a clean and flexible way of supplying important dependencies, such as the networking layer, to relevant parts of the application. This way, we can isolate dependencies and facilitate unit testing.

## SOLID Principles

The application follows SOLID principles, which are a set of design rules that promote clean and high-quality code. Here's a brief description of how these principles are applied:

- **SRP (Single Responsibility Principle):** Each class has a single responsibility. For example, the ViewModel is only concerned with presentation and handling of view-related logic.

- **OCP (Open/Closed Principle):** The code is open for extension but closed for modification. Classes are designed to be extended without modifying existing code, promoting flexibility.

- **LSP (Liskov Substitution Principle):** Objects can be substituted with instances of their subtypes without affecting desired behavior. For example, we can swap different networking implementations without affecting the ViewModel.

- **ISP (Interface Segregation Principle):** Interfaces should be designed so that clients are not forced to depend on methods they do not use. This helps avoid unnecessary couplings.

- **DIP (Dependency Inversion Principle):** High-level classes should not depend on low-level classes. Instead, both should depend on abstractions. The use of Dependency Injection follows this principle.

## Installation

1. Clone this repository on your local machine.
2. Open the project in Xcode 16 or higher.
3. Build and run the application on a compatible iOS simulator or device.

