# Herbstluftwm Configuration

![system shot](screenshot.png)

Welcome to my Herbstluftwm configuration repository! This setup is designed to provide an efficient, minimalist tiling window manager experience, customized with themes, scripts, and keybindings to suit my workflow.  

![my setup in action](assets/video.mkv)

---

## About Herbstluftwm

[Herbstluftwm](https://herbstluftwm.org/) is a dynamic tiling window manager for X11 that emphasizes manual tiling and simplicity. Unlike many other tiling window managers, it uses a single monitor-independent tag-based workspace system.

### Benefits
- **Manual tiling**: Complete control over your window layout.
- **Minimal dependencies**: Lightweight and fast.
- **Highly customizable**: Adjust to your preferences with a shell script-based configuration.
- **Tag-based workflow**: Independent of monitor constraints.

### Drawbacks
- **Steeper learning curve**: Requires manual setup and understanding of the tiling workflow.
- **Limited out-of-the-box features**: Most functionality must be configured or scripted.
- **X11 only**: No native Wayland support.

---

## Configuration Overview

This configuration is modular and organized into several files for clarity and maintainability:

- **`autostart`**: Main entry point for configuring Herbstluftwm. Initializes settings, keybindings, and themes.
- **`theme`**: Handles visual customization, including colors, fonts, and borders.
- **`winrules`**: Defines rules for window placement and behavior based on window class or instance.
- **`herbstScripts`**: Contains utility scripts to extend functionality.
- **`keybinds`**: Centralizes keybinding definitions for window management, launching applications, and more.

---

## Tools Used

This configuration leverages the following tools to enhance usability and aesthetics:

- **[Rofi](https://github.com/davatorium/rofi)**: A versatile application launcher and dmenu replacement.
- **[Vim/Neovim](https://neovim.io/)**: My preferred text editors for editing configuration files.
- **[Polybar](https://polybar.github.io/)**: A customizable status bar for system information and quick actions.
- **[Compfy](https://github.com/allusive-dev/compfy)**: A compositor fo X11 with animations similar to picom ( no longer actively maintained )

---

## Getting Started

1. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/herbstluftwm-config.git

