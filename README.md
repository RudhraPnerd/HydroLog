# HydroLog

![](HydroLog/HydroLog/Assets.xcassets/AppIcon.appiconset/100.png)

HydroLog is a very minimalistic app to log and track your water intake. It has many features like history, your own goal and it can even track how many times you've
achieved your goal from the start.

## How to Download

> [!WARNING]
> A Mac with Xcode installed is required

> [!WARNING]
> A iPad with iOS 16 or newer is required

To learn more about the requirements, you can visit the [Requirements file](REQIUREMENTS.md)
---

### Step 1: Download the Project
1. At the top right of this GitHub repository page, click the green **`<> Code`** button.
2. Select **Download ZIP** from the dropdown menu.
3. Open your Mac's **Downloads** folder and double-click the downloaded `.zip` file to extract it.
4. Open the extracted folder and double-click the blue **`YourProjectName.xcodeproj`** file to launch Xcode.

---

### Step 2: Configure Xcode Signing Settings
Before Apple allows you to run apps on a physical device, you must sign it with your own Apple ID.

1. In the left-hand sidebar of Xcode, click on the **Project Name** at the very top of the list.
2. Click on the **Signing & Capabilities** tab in the main window.
3. Under the **Team** dropdown menu, select your personal Apple ID account. *(If your account isn't listed, click "Add an Account..." and sign in with your Apple ID for free).*
4. If you see a red error regarding the Bundle Identifier, look for the **Bundle Identifier** text box and slightly modify the text (e.g., change `com.developer.AppName` to `com.yourname.AppName`) to make it globally unique.

> [!IMPORTANT]  
> Changing the Bundle Identifier is required. Apple will block the installation if the identifier matches an existing app on their servers.

---

### Step 3: Install onto your iPad
1. Connect your iPad to your Mac using your cable.
2. If your iPad asks **"Trust This Computer?"**, tap **Trust** and enter your iPad's passcode.
3. At the very top bar of Xcode (next to the Play and Stop buttons), click the **Device Dropdown** menu and select your physical **iPad** from the list (instead of a Mac simulator).
4. Click the **Play button (Run)** or press `Cmd + R` on your keyboard. 
5. Xcode will compile the Swift code and install the app on your iPad.

---

### Step 4: Trust the Developer (First Time Only)
The first time you try to tap and open the app on your iPad, iOS will block it and show an "Untrusted Developer" message. This is normal. To fix it:

1. On your iPad, open the **Settings** app.
2. Navigate to **General** > **VPN & Device Management**.
3. Under the "Developer App" section, tap on your **Apple ID email address**.
4. Tap **Trust [Your Email]** and confirm.





You're all done! You can use the app whenever you want!

🎉 **You're all set!** You can now open and run the app directly on your iPad even when it is disconnected from your Mac.
