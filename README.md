# PPK Flutter

A Flutter plugin to provide an expanded interface to the PDF-library from [PSPDFKit](https://pspdfkit.com).

## Usage

Detailed usage documentation will be made available in [the How-To Document](HOW-TO.md) as soon as possible.

## Roadmap

I don't really have a roadmap, but the first thing I want to do is get this working on iOS, Android and
Windows - ASAP.

I have a few major goals here:

1. provide as rich an interface as technically possible for all the features of PSPDFKit native libraries on all platforms.
2. Try to standardize all features across platforms for Flutter-use. This will not always work probably because I can't add features that are missing in the original, native libraries.
3. Standardize configurations: you should not need to worry on the Flutter-side whether a configuration-key is available on a platform or not. If the configuration-key is not available or doesn't make sense on the platform, it shall be ignored
4. Provide Native View-Integration for all platforms within Flutter-Widgets: you could then decide to use the `global` version
   (where your PDF is shown in a native controller/activity/etc, ) or integrate the PDF-View in your Flutter-Widget directly (where
   you would hav emore control of your the View).
5. Don't use arbitrary strings as configuration-keys, but use (e.g.) `enums` so that a static analysis of your code is possible -
   even for configuration options :-)

More goals may be added.

## STATUS
This repository has just begun, I hope to have a first working version available soon.

Some of the code is still based on the code from PSPDFKit GmhH's flutter repo, which I intend to replace ASAP.

## COPYRIGHT & LICENSE

UNLESS EXPRESSED OTHERWISE IN A SPECIFIC SOURCE CODE FILE THE
REPOSITORY IS LICENSED UNDER THE TERMS OF THE LICENSE AS EXPRESSED IN
[The Licence File](LICENSE.txt).

## NOTICE

THIS PLUGIN AND ITS AUTHOR IS IN NO WAY AFFILIATED WITH THE COMPANY [PSPDFKit GmbH](https://pspdfkit.com/). THIS IS
A PUBLIC PLUGIN WRITTEN BECAUSE THERE WAS A NEED FOR IT and IT IS A PRIVATE PROJECT.

ALL USE OF PSPDFKit NAME, CODE, AND SUCH IS ASSUMED TO BE IN ACCORDANCE WITH THE LICENCING,
COPYRIGHT AND TRADEMARK RULES.

IN ORDER TO USE THIS PLUGIN IN A PRODUCTION ENVIRONMENT, YOU **MUST** OBTAIN A PRODUCTION
LICENSE FROM THE COMPANY PSPDFKit GmbH in AUSTRIA.

AS OF WRITING OF THIS DOCUMENT, YOU NEEDED TO OBTAIN A LICENSE FOR EACH PLATFORM YOUR
FLUTTER APPLICATION IS TO RUN ON.

FOR FURTHER DETAILS PLEASE CHECK THEIR WEBSITE.

