# where's@

## Group Members
- Kyle Peiman
- Kaedon Hamm
- Joseph Zilonka
- Lucas Albano
- Chelsea Berger
- Marshall Richardson

## Motivation and Description
Due to the current pandemic circumnavigating the globe, essential items such as toilet paper, hand sanitizer, face masks, and Nintendo Switches are hot commodities for consumers. Our product will allow users to find these essential items without having to go to visit multiple stores to view their stock. 

The where’s@ app is a user-driven product locating service that helps people in the community locate requested items in stores near them. Users who enter a store and see specific products can take a picture and upload a listing to the service. Users can then search for the item in where’s@ and find a list of the closest stores with that item in stock, as well as a picture of the item for verification.

## Requirements
The phone this application runs on must have an up-to-date version of Google Play Services. For some emulators, the pre-installed version of Google Play Services is out-of-date, so the application might not run properly. Also, for emulators, you need to grab the phone's location first using Google Maps before using our app so the location is set properly. For a demonstration of how to fix these issues, watch the video presentation we submitted. Note that these issues do not appear on actual Android devices: they are only present on emulators. The application will run properly when emulating the following phone types: Pixel 3a, Pixel 3, Pixel 2, Pixel, Nexus 5X, and Nexus 5. 

## Usage
### Login
Our application requires a login, so either create a new account using the "Create Account" button on the main activity, or login using the following credentials:

- Email: test@gmail.com
- Password: password

Note that the login may not respond right away, especially on emulators. This is a Firebase issue and after waiting for a few seconds it should log you in.

## Known Bugs
- The "View on Map" function does not display a map on the emulators, but it does display a map on actual devices
- On some API's, the Top 10 searches list has white text instead of black text.
- On some phones, pictures will upload rotated. This was happening previously and we implemented a fix for it. The fix worked on the vast majority of devices, but not all.
- When you open the camera for the first time it will ask for permissions. This opens the camera app itself, so you have to hit the back button and then click "Take a Picture" again. This only needs to be done when giving permissions. Otherwise is works normally.
