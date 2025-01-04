# add-localization-to-your-application-Task
# overview 
This code uses the easy_localization package to enable localization support in a Flutter app. Localization allows the app to dynamically switch between languages, providing a more personalized user experience depending on the user's language preference. In this code, the app supports two languages: English and Arabic.
# what this code does ?
1. Localization with easy_localization:
- The app is set up to support multiple languages, and the language can be switched dynamically between English and Arabic.
- Translations for various texts, such as button labels, page titles, and messages, are stored in language-specific JSON files.
- The tr() function is used to fetch the correct translation for the app's UI text based on the currently selected language.
2. Language Switching:
- A language change button in the app bar allows the user to toggle between English (en-US) and Arabic (ar-EG) at any time.
- The language change is handled by the chagelang function, which checks the current locale and switches it.
# How the code works ?
1. Setup:
- The easy_localization package is imported, and the MaterialApp is wrapped with the EasyLocalization widget in the main.dart file (this is assumed, though not shown in the code).
- The assets/translations directory contains JSON files for each supported language, such as en-US.json for English and ar-EG.json for Arabic.
2. Displaying Translated Text:
- In the UI, text is displayed using the tr() function to fetch the appropriate translation. For example: title: Text(tr("SignUp_page")),
- This ensures that the text is dynamically updated based on the selected language.
3. Language Switcher:
- The chagelang function allows the user to toggle between English and Arabic by setting the locale using context.setLocale():
- void chagelang() {
    if (context.locale == Locale('en', 'US')) {
        context.setLocale(Locale('ar', 'EG'));
    } else {
        context.setLocale(Locale('en', 'US'));
    }
}
- This function checks the current locale and updates it accordingly.
