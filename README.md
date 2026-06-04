# OpenCode AI Mode Intelligence

An industrial-grade AI orchestration system for [OpenCode CLI](https://opencode.ai), designed for safe, precise, and high-performance engineering in large-scale codebases.

## 🚀 Quick Install

### 1. Local Agent Setup
Copy the `.opencode/` folder to your project root. This installs the specialized AI personas:
- **Planning:** The Senior Architect and Project Manager.
- **Developer:** High-signal implementation shell.
- **Debugger:** Scientific error triage and fixing.
- **Suggestion/Study:** Read-only optimization and mapping.

### 2. Global Tools Installation
Copy the contents of `install_payload/tools/` to your global OpenCode tools directory:
- **Windows:** `%USERPROFILE%\.config\opencode\tools\`
- **Mac/Linux:** `~/.config/opencode/tools/`

Navigate to your global config folder and install dependencies:
- **Windows:**
  ```powershell
  cd $HOME\.config\opencode\
  npm install glob typescript @opencode-ai/plugin
  ```
- **Mac/Linux:**
  ```bash
  cd ~/.config/opencode/
  npm install glob typescript @opencode-ai/plugin
  ```

### 3. Global Approval Gate
Create the approval file in your global config folder:
- **Path:** `~/.config/opencode/approve.md`
- **Function:** Proposals from AI agents require you to add an `[APPROVED]` hash to this file before they can touch your code.

### 4. Initialize Project
Run the following command to build your project's initial memory map:
```bash
opencode run "MAP(root)"
```

## 🧠 Key Features
- **The Master Rulebook:** All agents follow a single source of truth in `.opencode/RULES.md`.
- **Vertical-Slice Implementation:** Logic is built in functional end-to-end chunks.
- **Verification Ladder:** Mandatory static, unit, and integration testing for every fix.
- **Ironclad Safety:** Automatic backups, anti-truncation guards, and forbidden path protection.

---
Built with Meta-Cognitive Precision. Fully autonomous. Senior Architect grade.
