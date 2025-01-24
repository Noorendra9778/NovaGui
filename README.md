# NovaGui Library
This documentation is for the stable release of NovaGui Library.

---

## Booting the Library
```lua
local NovaGui = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()


---

Creating a Window

local Window = NovaGui:MakeWindow({
    Name = "Title of the library",
    HidePremium = false,
    SaveConfig = true,
    ConfigFolder = "NovaGuiTest"
})

Options for Window:

Name = <string>: The name of the UI.

HidePremium = <bool>: Hides user premium status.

SaveConfig = <bool>: Toggles saving the configuration.

ConfigFolder = <string>: Name of the folder to save configurations.

IntroEnabled = <bool>: Enables the intro animation.

IntroText = <string>: Text shown in the intro animation.

IntroIcon = <string>: URL for the intro animation image.

Icon = <string>: URL for the main window icon.

CloseCallback = <function>: Executes a function when the window is closed.



---

Creating a Tab

local Tab = Window:MakeTab({
    Name = "Tab 1",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

Options for Tab:

Name = <string>: The name of the tab.

Icon = <string>: The icon of the tab.

PremiumOnly = <bool>: Limits access to Premium users.



---

Creating a Section

local Section = Tab:AddSection({
    Name = "Section"
})

Options for Section:

Name = <string>: The name of the section.



---

Notifying the User

NovaGui:MakeNotification({
    Name = "Notification Title!",
    Content = "Notification content... what will it say?",
    Image = "rbxassetid://4483345998",
    Time = 5
})

Options for Notifications:

Name = <string>: The title of the notification.

Content = <string>: The notification content.

Image = <string>: The icon for the notification.

Time = <number>: Duration (in seconds) of the notification.



---

Creating a Button

Tab:AddButton({
    Name = "Button!",
    Callback = function()
        print("Button pressed")
    end
})

Options for Button:

Name = <string>: The name of the button.

Callback = <function>: The function that runs when the button is pressed.



---

Creating a Checkbox Toggle

Tab:AddToggle({
    Name = "Toggle!",
    Default = false,
    Callback = function(Value)
        print(Value)
    end
})

Options for Toggle:

Name = <string>: The name of the toggle.

Default = <bool>: Default toggle state (on or off).

Callback = <function>: The function executed on toggle.



---

Creating a Color Picker

Tab:AddColorpicker({
    Name = "Colorpicker",
    Default = Color3.fromRGB(255, 0, 0),
    Callback = function(Value)
        print(Value)
    end
})

Options for Color Picker:

Name = <string>: The name of the color picker.

Default = <Color3>: Default color.

Callback = <function>: Function executed on color selection.



---

Creating a Slider

Tab:AddSlider({
    Name = "Slider",
    Min = 0,
    Max = 20,
    Default = 5,
    Color = Color3.fromRGB(255,255,255),
    Increment = 1,
    ValueName = "Value Name",
    Callback = function(Value)
        print(Value)
    end
})

Options for Slider:

Name = <string>: The name of the slider.

Min = <number>: Minimum value of the slider.

Max = <number>: Maximum value of the slider.

Default = <number>: Default value.

Color = <Color3>: Slider color.

Increment = <number>: Step size for slider increments.

ValueName = <string>: Name to display beside the slider.

Callback = <function>: Function executed when the slider value changes.



---

Creating a Label

Tab:AddLabel("Label")

Updating an Existing Label:

Label:Set("New Label")


---

Creating a Paragraph

Tab:AddParagraph("Paragraph", "This is the content of the paragraph.")

Updating an Existing Paragraph:

Paragraph:Set("New Title", "Updated content for the paragraph.")


---

Creating an Input Box

Tab:AddTextbox({
    Name = "Textbox",
    Default = "Default text",
    TextDisappear = true,
    Callback = function(Value)
        print(Value)
    end
})

Options for Input Box:

Name = <string>: The name of the input box.

Default = <string>: Default text in the input box.

TextDisappear = <bool>: Clears text after submission.

Callback = <function>: Executes when text is submitted.



---

Creating a Keybind

Tab:AddBind({
    Name = "Keybind",
    Default = Enum.KeyCode.E,
    Hold = false,
    Callback = function()
        print("Key pressed")
    end
})

Options for Keybind:

Name = <string>: The name of the keybind.

Default = <Enum.KeyCode>: Default keybind.

Hold = <bool>: Enables hold-to-use functionality.

Callback = <function>: Function executed on key press.



---

Creating a Dropdown Menu

Tab:AddDropdown({
    Name = "Dropdown",
    Default = "Option 1",
    Options = {"Option 1", "Option 2", "Option 3"},
    Callback = function(Value)
        print(Value)
    end
})

Options for Dropdown:

Name = <string>: The name of the dropdown.

Default = <string>: Default selected option.

Options = <table>: List of dropdown options.

Callback = <function>: Function executed on option selection.



---

Finishing the Script (Required)

NovaGui:Init()


---

Destroying the Interface

NovaGui:Destroy()
