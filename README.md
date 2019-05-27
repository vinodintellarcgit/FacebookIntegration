# FacebookIntegration

After creat your project open your project path on terminal and run below mentioned commands for Set up your CocoaPods dependencies

1.) for create pod file: pod init
2.) for open pod file: open podfile

Copy and paste following 
pod 'FBSDKLoginKit' 

and then pod install.


Login in your Facebook developer Account using  https://developers.facebook.com/docs/facebook-login/ios/

Create New App
Add Your Bundle identifiers.

After that you get FbId then copy that

and paste this code in your plist file

```
<key>CFBundleURLTypes</key>
<array>
  <dict>
  <key>CFBundleURLSchemes</key>
  <array>
    <string>Paste our fb Id here</string>
  </array>
  </dict>
</array>
<key>FacebookAppID</key>
<string>Paste our fb Id here</string>
<key>FacebookDisplayName</key>
<string>IntSocialFLogin</string>

```
```
<key>LSApplicationQueriesSchemes</key>
<array>
  <string>fbapi</string>
  <string>fb-messenger-share-api</string>
  <string>fbauth2</string>
  <string>fbshareextension</string>
</array>
```

Thanks have a nice day.
