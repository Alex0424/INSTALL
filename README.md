# 🚀 APP_INSTALL.sh

### **A Bash Script for Fast & Easy Installation of Multiple Apps**

This script **automates the download and installation** of multiple applications, saving time compared to manual installation. It ensures a seamless setup experience on various operating systems.

---

## 📌 **Compatibility**

This script is compatible with:

✅ **Linux** (Ubuntu, Debian, Fedora, Arch, etc.)\
✅ **Unix-like systems** (FreeBSD, OpenBSD, etc.)\
✅ **Windows Subsystem for Linux (WSL)**\
✅ **Git-Bash** (on Windows)\
❌ **macOS**

---

## 🛠 **Setup & Run the Script**

### **1️⃣ Make the script executable**

Before running the script, ensure it has execution permissions:

```bash
chmod +x APP_INSTALL.sh
```

### **2️⃣ Run the script**

Execute the script with:

```bash
./APP_INSTALL.sh
```

This will initiate the installation process and prompt you for required inputs.

---

## 📂 Add Your Own Scripts

You can customize the installation process by adding your own scripts to the `./APPS` directory. Simply place your script files in this folder, and the main script will detect and execute them accordingly.

---
## 🔹 **Features**

✔ **Fast & Automated** – Installs multiple apps in one go.\
✔ **User-Friendly** – Simple prompts for app installation choices.\
✔ **Multi-Platform** – Works on Linux, macOS, WSL, and more.\
✔ **Safe Execution** – Runs necessary parts as root while switching back to a non-root user when required.

---

## 💡 **Notes**

- Ensure you have **sudo/root access** when required.
- The script **detects the operating system** and applies the correct installation method.

---

### 🎯 **Enjoy hassle-free app installations! 🚀**

