# iOS Alexa Voice Service

This is an Alexa Voice Service example using Swift specifically for the iOS. It requires Swift 2 from XCode 7 or later.

You will need to fill out the following three items found in Config.swift before running:

```
struct LoginWithAmazon {
    static let ClientId = "<< Client ID Here >>"
    static let ProductId = "<< Product ID Here >>"
    static let DeviceSerialNumber = "<< Device Serial Number Here >>"
}
```

You will need to fill out the following items found in LoginViewController.m before running:

```

#define SCOPE_DATA @"{\"alexa:all\":{\"productID\":\"<< Product ID Here >>\",""\"productInstanceAttributes\":{\"deviceSerialNumber\":\"<< Device Serial Number Here >>\"}}}"

```

You will also need to change "APIKey" (This API Key needs to be generated from developer.amazon.com > Amazon Voice Service > Your Product > Security Profile > iOS Settings) & URL Scheme in Info.plist


Special Thanks to https://github.com/carsonmcdonald/AVSExample-Swift
