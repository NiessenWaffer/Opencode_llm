# OpenCode AI Mode Intelligence

Industrial-grade AI orchestration for [OpenCode CLI](https://opencode.ai). Safe, precise, and high-performance engineering in large-scale codebases.

## 🚀 Direct Global Installation
You can install the OpenCode toolchain directly without cloning the repository.

### For Windows (PowerShell)
Run the following command in your terminal:
```powershell
irm https://raw.githubusercontent.com/NiessenWaffer/Opencode_llm/main/install.ps1 | iex
```

### For Unix/Mac
Run the following command in your terminal:
```bash
curl -fsSL https://raw.githubusercontent.com/NiessenWaffer/Opencode_llm/main/install.sh | bash
```

*This installs tools to: `%USERPROFILE%\.config\opencode\tools` (Windows) or `$HOME/.config/opencode/tools` (Unix).*

### Enable Global Access (Important)
To run OpenCode tools from any project folder, add the installation directory to your system `PATH`:
- **Windows:** Add `C:\Users\<YourUsername>\.config\opencode\tools` to your environment PATH.
- **Unix/Mac:** Add `export PATH="$HOME/.config/opencode/tools:$PATH"` to your `.bashrc` or `.zshrc`.

## 🧠 System Structure
- **Global Config (`~/.config/opencode/`):** Centralized installation of all tools, agents, and dependencies.
- **Project Root (`RULES.md`):** Your project-specific configuration. Keep this in your project root to enable tool orchestration.
