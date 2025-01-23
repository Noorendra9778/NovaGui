GitHub Description for NovaGui Library


---

NovaGui - A Simple and User-Friendly UI Library for Roblox

NovaGui is a lightweight and easy-to-use UI library for Roblox, designed to be intuitive for developers and players alike. With NovaGui, you can create customizable, draggable, and responsive interfaces on both PC and mobile devices. NovaGui includes features such as tabs, buttons, sliders, text inputs, and more, all while keeping your workflow simple and efficient.


---

Features

Draggable windows (supports PC and mobile).

Built-in minimize and destroy buttons.

Easy-to-add tabs, buttons, sliders, and text inputs.

Customizable and responsive design.

Lightweight and optimized for performance.



---

How to Use

1. Copy the library script to your Roblox game or fetch it directly from the raw link below.


2. Use the provided API to create windows, tabs, and components.


3. Add functionality using simple callback functions.




---

Setup

To get started, include the NovaGui library in your

script:

local NovaGui = loadstring(game:HttpGet("https://raw.githubusercontent.com/Noorendra9778/NovaGui/main/NovaGui.lua"))()


---

Creating a Window

To create a new UI window:

local Window = NovaGui:CreateWindow("My Awesome Hub")

The CreateWindow function accepts one argument:

title (string): The title of your window.



---

Adding Tabs

To organize your UI, you can add tabs:

local Tab1 = Window:AddTab("Tab 1")
local Tab2 = Window:AddTab("Tab 2")

Each tab is returned as an object that allows you to add components like buttons, sliders, and text inputs.


---

Adding Components

Buttons

Add a button to your tab with a custom callback function:

Tab1:AddButton("My Button", function()
    print("Button clicked!")
end)

Sliders

Add a slider to your tab for user input:

Tab1:AddSlider("Volume", 0, 100, 50, function(value)
    print("Slider value: " .. value)
end)

The AddSlider function accepts the following arguments:

name (string): The slider's label.

min (number): The minimum value.

max (number): The maximum value.

default (number): The default value.

callback (function): A function triggered whenever the slider value changes.


Text Inputs

Add a text input box for user text entry:

Tab1:AddTextInput("Enter Text", "Default Text", function(input)
    print("User input: " .. input)
end)

The AddTextInput function accepts the following arguments:

name (string): The label for the text input.

default (string): The default text.

callback (function): A function triggered when the user submits text.



---

Window Controls

Minimize Button: Shrinks the window to the title bar. Click again to restore it.

Close Button: Destroys the UI completely.



---

Full Example

Here’s a full example of how to use NovaGui:

local NovaGui = loadstring(game:HttpGet("https://raw.githubusercontent.com/Noorendra9778/NovaGui/main/NovaGui.lua"))()

-- Create the main window
local Window = NovaGui:CreateWindow("My Hub")

-- Add tabs
local Tab1 = Window:AddTab("Main Tab")
local Tab2 = Window:AddTab("Settings")

-- Add components to Tab1
Tab1:AddButton("Say Hello", function()
    print("Hello, World!")
end)

Tab1:AddSlider("Volume", 0, 100, 50, function(value)
    print("Volume set to " .. value)
end)

Tab1:AddTextInput("Username", "Enter your name here", function(input)
    print("Your username is: " .. input)
end)

-- Add components to Tab2
Tab2:AddButton("Reset Settings", function()
    print("Settings have been reset!")
end)


---

License

NovaGui is free to use and modify in your Roblox projects. Attribution is appreciated but not required.

