# MeterCIU
MeterCIU is a mobile and web application designed for managing electric meter CIUs (Customer Interface Units). Built with Flutter and Dart for the frontend and Firebase for the backend, MeterCIU provides an easy-to-use, secure solution for monitoring and controlling electric meters, viewing consumption data, and receiving real-time notifications. The app is designed for utility companies and end-users to interact with their electric meters, access data, and ensure efficient energy usage.

# Features
Real-Time Meter Data: View live consumption data from electric meters.
Usage History: Access past data on electricity consumption.
Push Notifications: Receive alerts for abnormal consumption, low battery, or maintenance updates.
User Authentication: Secure login and registration using Firebase Authentication.
Device Management: Add and manage multiple electric meters for different locations.
Cloud Database: Store and access meter data securely using Firebase Firestore.
Responsive Design: Optimized for mobile devices, tablets, and web platforms using Flutter.
# Tech Stack
MeterCIU is built using the following technologies:

Frontend: Flutter, Dart
Backend: Firebase
Firebase Authentication (for secure user login/registration)
Firebase Firestore (for real-time storage of meter data)
Firebase Cloud Messaging (for push notifications)
Real-Time Data: Firebase Firestore for syncing and displaying consumption data
Authentication: Firebase Authentication
# Installation
To run MeterCIU locally, follow the steps below:

Clone the repository:

git clone https://github.com/your-username/meterciu.git
Navigate to the project directory:

cd meterciu
Install Flutter dependencies for the frontend:


cd frontend
flutter pub get
Set up Firebase for the project:

Go to Firebase Console.
Create a new project or use an existing one.
Add Firebase to your Flutter app by following the official instructions for FlutterFire setup.
Download the google-services.json (for Android) and/or GoogleService-Info.plist (for iOS) and place them in the respective directories of your Flutter project.
Configure Firebase in your Flutter app by following the Firebase setup steps, ensuring you enable:

Firebase Authentication
Firestore Database
Firebase Cloud Messaging (for push notifications)
Run the Flutter app on your preferred device:

# For Android/iOS:

flutter run
# For web:

flutter run -d chrome
Open your app and start using MeterCIU to monitor electric meter data.
# ui 
![1](https://github.com/user-attachments/assets/c2023b3e-457b-48cf-819a-8c0d0b729cfc)
![2](https://github.com/user-attachments/assets/a5fa178c-0e70-4540-bb47-f6b1cbb10b4f)
![3](https://github.com/user-attachments/assets/87fd0c7e-bafa-4262-bc97-fbc2007dbb6a)
![4](https://github.com/user-attachments/assets/3fc6c494-c09a-45b6-b816-e33ad647b5b8)
![5](https://github.com/user-attachments/assets/4626cfeb-f221-4868-9678-8a4b88a8020d)
![6](https://github.com/user-attachments/assets/c278f87f-83bb-40ee-b53d-abc86377bb32)
![7](https://github.com/user-attachments/assets/0f92d9fc-6b95-4e1b-867e-b5288dc7b843)

# Contributing
We welcome contributions to MeterCIU! If you would like to contribute:

Fork the repository.
Create a new branch for your feature or fix.
Commit your changes.
Push your changes and create a pull request.
Please follow the existing coding conventions and ensure your code is well-documented.
