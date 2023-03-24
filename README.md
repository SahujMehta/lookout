# LookOut

LookOut is an application that will allow users to set a time to check-in. Upon a failed check-in, selected contacts are notified of the user's location.

## Main Program

Source files can be found in the lib folder. main.dart establishes the opening screen and connections to the different pages. my_home_page.dart contains the source code for the main page of the application and includes the code for the navigation bar.

Then each page has its own additional file as follows:
- collapsible_list.dart adds the ability to make collapsible info cards which are used in the help page
- help.dart is where these cards appear to create an FAQ page
- settings.dart is where all the apps settings will be in the future
- contacts.dart is a page that lists all the contacts
- add_contacts_page.dart allows the user to make contact groups
- splash_screen.dart provides a landing page for when the app is opened

## Testing

Test files are located in the test folder and are separated by page. These files are run through flutter to test the layout and functionality of the app. Some functions within the source code may need to be made public for the test files to access them.


## TODO
- [ ] Keep contacts persistent in memory
- [ ] Stop add contacts from crashing app
- [ ] Add location feature
- [ ] Add the ability to create lookouts
- [ ] Add a settings page for configuration
- [ ] Test on ios
