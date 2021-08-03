# HOW TO integrate PPK-Flutter

## Introduction

`ppk_flutter` is not fully-fledged PDF-Viewer. The PDF-viewing and all other functionality is based
on [PSPDFKit](https://pspdfkit.com/).

You absolutely, definitely need a license to run this in production environment, unless you are
ok with having "PSPDFKit Trial License" written all over your PDF-pages (joking, even this is
probably not allowed to be distributed as you **absolutely, positively need a license to
distribute your app with PSPDFKit**).

I wrote this plugin because:
- Flutter is becoming more and more widely used and is actually a great framework
- There is no feasible, nice, fully-fledge integration of PSPSFKit for Flutter
- On anything other than iOS/macOS, previewing PDFs is just a f****ng nightmare and the previews look really, really horrible
- ... I happen to start liking PSPDFKit ...*


*: On that, I used PSPDFKit a long time ago once and it was not too bad. I basically like
the small-ish company in Austria that they are. I also convinced at least one of my clients
to license PSPDFKit for their product. Even though, the documentation is sometimes "difficult" and "not clear", it is still probably
the best library out there.

## Integration

There are two approaches on displaying and handling PDFs using PPK-Flutter:

### 1. Global

In this case, the whole screen is taken over by the native view. You can configure how it should be displayed and such, but you
can't interact with the native view.

It is good if you just want to display something and leave everything else up to PSPDFKit

You use this functionality via the singleton instance of the `PPKProxy`-Class, e.g.:

``` dart

   PPKProxy.instance.presentGlobal(fullPathToPdfFile);

```

This call will use default configuration. Please check the default configuration in the PSPDFKit-Documentation for the platform in
question.

If you want to configure the presentation and what functionality is available, you can pass a parameter:

``` dart

   PPKProxy.instance.presentGlobal(fullPathToPdfFile, configuration: PPKConfiguration( ... ));

```

Please check `PPKConfiguration` for all the configuration options. They are enormous.

### 2. Native Widget

This is actually where the music plays: a native view (iOS, Android) is integrate within a flutter widget. You can then nicely
interact with the native view.

You will use a `PPKWidget` to create widget that displays your PDF and with which you can interact.

``` dart

   void viewProxyCreated(PPKViewProxy viewProxy) {
   }

   @override
   Widget build(BuildContext context) {
      return Scaffold(
         appBar: AppBar(title: Text("Some Scaffold Title")),
         body: SafeArea(
            bottom: false,
            child: PPKWidget(documentPath: fullPathToPdfFile, configuration: PPKConfiguration(...), onProxyCreated: viewProxyCreated),
         ),
      );
   }
```

`PPKWidget` will call you back once the view is created and ready to be managed.

Don't let the term "proxy" confuse you. You can use the "proxy" as if it were a flutter native widget. I named it "proxy" because it
handles the translation between flutter-code and native code; it is a 100% representation of what is possible on the native side
of `ppk-flutter`.

You can use the passed `viewProxy` to perform actions on the pdf-file or rather: to control the PSPDFKit-View shown there. E.g. you
could fill out form-fields, add redaction and many more things directly (WiP).

You can find all actions you can do in the `PPKViewProxy`- and `PPKProxy`-APIs.

Remember: `PPKProxy` and `PPKViewProxy` are nearly the same except the former uses **GLOBAL** and the latter **integrated**
presentation.

## Configuration

In order to configure your view, regardless of whether it is global or integrated, you use an instance of `PPKConfiguration` class.

The configuration options are numerous. I tried to reflect as much as possible from the iOS-version of PSPDFKit because that
seems to be the one with the most features.

Any features, configuration oder  config-options that are not present on other platforms are silently ignored. I personally don't
like saying *these are Android options and those are iOS-options*.

In order to see if a configuration OR configuration option has any effect, you need to read the PSPDFKit native developer
documentation.

In some cases I used both options, e.g. `settingsOptions` can have `theme` as well as `appearance`. The former is used on
android and the latter on iOS, but they both mean exactly the same stuff. Thus, you can use either of them on any platform.

... More documentation to follow ...
