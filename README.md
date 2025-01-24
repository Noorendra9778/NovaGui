


---

NovaGui Library

This documentation is for the stable release of NovaGui Library.

Booting the Library

```lua local NovaGui = loadstring(game:HttpGet(('https://raw.githubusercontent.com/Noorendra9778/NovaGui/main/NovaGui.lua')))()
```
Creating a Window

```lua local Window = NovaGui:MakeWindow({Name = "Title of the library", HidePremium = false, SaveConfig = true, ConfigFolder = "NovaGuiTest"})
```
--[[
Name = <string> - The name of the UI.
HidePremium = <bool> - Whether or not the user details shows Premium status or not.
SaveConfig = <bool> - Toggles the config saving in the UI.
ConfigFolder = <string> - The name of the folder where the configs are saved.
IntroEnabled = <bool> - Whether or not to show the intro animation.
IntroText = <string> - Text to show in the intro animation.
IntroIcon = <string> - URL to the image you want to use in the intro animation.
Icon = <string> - URL to the image you want displayed on the window.
CloseCallback = <function> - Function to execute when the window is closed.
]]

```Creating a Tab

local Tab = Window:MakeTab({
	Name = "Tab 1",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})
```
--[[
Name = <string> - The name of the tab.
Icon = <string> - The icon of the tab.
PremiumOnly = <bool> - Makes the tab accessible to NovaGui Premium users only.
]]

```Creating a Section

local Section = Tab:AddSection({
	Name = "Section"
})
```
--[[
Name = <string> - The name of the section.
]]

Notifying the user

NovaGui:MakeNotification({
	Name = "Title!",
	Content = "Notification content... what will it say??",
	Image = "rbxassetid://4483345998",
	Time = 5
})

--[[
Title = <string> - The title of the notification.
Content = <string> - The content of the notification.
Image = <string> - The icon of the notification.
Time = <number> - The duration of the notification.
]]

Creating a Button

```Tab:AddButton({
	Name = "Button!",
	Callback = function()
      		print("button pressed")
  	end    
})
```
--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]

Creating a Checkbox toggle

```Tab:AddToggle({
	Name = "This is a toggle!",
	Default = false,
	Callback = function(Value)
		print(Value)
	end    
})
```
--[[
Name = <string> - The name of the toggle.
Default = <bool> - The default value of the toggle.
Callback = <function> - The function of the toggle.
]]

Changing the value of an existing Toggle
```CoolToggle:Set(true)
```
Creating a Color Picker

```Tab:AddColorpicker({
	Name = "Colorpicker",
	Default = Color3.fromRGB(255, 0, 0),
	Callback = function(Value)
		print(Value)
	end	  
})
```
--[[
Name = <string> - The name of the colorpicker.
Default = <color3> - The default value of the colorpicker.
Callback = <function> - The function of the colorpicker.
]]

Setting the color picker's value

```ColorPicker:Set(Color3.fromRGB(255,255,255))
```
Creating a Slider

```Tab:AddSlider({
	Name = "Slider",
	Min = 0,
	Max = 20,
	Default = 5,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "bananas",
	Callback = function(Value)
		print(Value)
	end    
})
```
--[[
Name = <string> - The name of the slider.
Min = <number> - The minimal value of the slider.
Max = <number> - The maximum value of the slider.
Increment = <number> - How much the slider will change value when dragging.
Default = <number> - The default value of the slider.
ValueName = <string> - The text after the value number.
Callback = <function> - The function of the slider.
]]

Change Slider Value

```Slider:Set(2)
```
Make sure you make your slider a variable (local CoolSlider = Tab:AddSlider...) for this to work.

Creating a Label

```Tab:AddLabel("Label")
```
Changing the value of an existing label

```CoolLabel:Set("Label New!")
```
Creating a Paragraph

```Tab:AddParagraph("Paragraph","Paragraph Content")
```
Changing an existing paragraph

```CoolParagraph:Set("Paragraph New!", "New Paragraph Content!")
```
Creating an Adaptive Input

```Tab:AddTextbox({
	Name = "Textbox",
	Default = "default box input",
	TextDisappear = true,
	Callback = function(Value)
		print(Value)
	end	  
})
```
--[[
Name = <string> - The name of the textbox.
Default = <string> - The default value of the textbox.
TextDisappear = <bool> - Makes the text disappear in the textbox after losing focus.
Callback = <function> - The function of the textbox.
]]

Creating a Keybind

```Tab:AddBind({
	Name = "Bind",
	Default = Enum.KeyCode.E,
	Hold = false,
	Callback = function()
		print("press")
	end    
})
```
--[[
Name = <string> - The name of the bind.
Default = <keycode> - The default value of the bind.
Hold = <bool> - Makes the bind work like: Holding the key > The bind returns true, Not holding the key > Bind returns false.
Callback = <function> - The function of the bind.
]]

Changing the value of a bind

```Bind:Set(Enum.KeyCode.E)
```
Creating a Dropdown menu

```Tab:AddDropdown({
	Name = "Dropdown",
	Default = "1",
	Options = {"1", "2"},
	Callback = function(Value)
		print(Value)
	end    
})
```
--[[
Name = <string> - The name of the dropdown.
Default = <string> - The default value of the dropdown.
Options = <table> - The options in the dropdown.
Callback = <function> - The function of the dropdown.
]]

Adding a set of new Dropdown buttons to an existing menu

```Dropdown:Refresh(List<table>, true)
```
The above boolean value "true" is whether or not the current buttons will be deleted.

Selecting a dropdown option

```Dropdown:Set("dropdown option")
```
Finishing your script (REQUIRED)

The below function needs to be added at the end of your code.

```NovaGui:Init()
```
How flags work.

The flags feature in the UI may be confusing for some people. It serves the purpose of being the ID of an element in the config file, and makes accessing the value of an element anywhere in the code possible. Below is an example of using flags.

```Tab1:AddToggle({
    Name = "Toggle",
    Default = true,
    Save = true,
    Flag = "toggle"
})

print(NovaGui.Flags["toggle"].Value) -- prints the value of the toggle.
```
Flags only work with the toggle, slider, dropdown, bind, and colorpicker.

Making your interface work with configs.

To make your interface use the configs function, you first need to add the SaveConfig and ConfigFolder arguments to your window function. The explanation of these arguments is above. Then, you need to add the Flag and Save values to every toggle, slider, dropdown, bind, and colorpicker you want to include in the config file. The Flag = <string> argument is the ID of an element in the config file. The Save = <bool> argument includes the element in the config file. Config files are made for every game the library is launched in.

Destroying the Interface

```NovaGui:Destroy()
```

---



