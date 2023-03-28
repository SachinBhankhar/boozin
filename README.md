# boozin

A new Flutter project.

## Setup

### Apple Health (iOS)

Open your Flutter project in Xcode by right clicking on the "ios" folder and selecting "Open in Xcode". Next, enable "HealthKit" by adding a capability inside the "Signing & Capabilities" tab of the Runner target's settings.

### Google Fit (Android)

Follow the guide at https://developers.google.com/fit/android/get-api-key

Below is an example of following the guide:

Change directory to your key-store directory (MacOS):
`cd ~/.android/`

Get your keystore SHA1 fingerprint:
`keytool -list -v -keystore ~/.android/debug.keystore -alias androiddebugkey -storepass android -keypass android`

Example output:

```
Alias name: androiddebugkey
Creation date: Jan 01, 2013
Entry type: PrivateKeyEntry
Certificate chain length: 1
Certificate[1]:
Owner: CN=Android Debug, O=Android, C=US
Issuer: CN=Android Debug, O=Android, C=US
Serial number: 4aa9b300
Valid from: Mon Jan 01 08:04:04 UTC 2013 until: Mon Jan 01 18:04:04 PST 2033
Certificate fingerprints:
     MD5:  AE:9F:95:D0:A6:86:89:BC:A8:70:BA:34:FF:6A:AC:F9
     SHA1: BB:0D:AC:74:D3:21:E1:43:07:71:9B:62:90:AF:A1:66:6E:44:5D:75
     Signature algorithm name: SHA1withRSA
     Version: 3
```

Follow the instructions at https://developers.google.com/fit/android/get-api-key for setting up an OAuth2 Client ID for a Google project, and adding the SHA1 fingerprint to that OAuth2 credential.

The client id will look something like `YOUR_CLIENT_ID.apps.googleusercontent.com`.

