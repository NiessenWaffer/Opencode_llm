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
- **Global Config (`~/.config/opencode/`):** Centralized installation of all tools, agents, dependencies, and global slash commands.
- **Project Root (`RULES.md`, `opencode.json`):** Your project-specific configuration. Keep these in your project root to enable tool orchestration.

## ⌨️ Global Slash Commands

After installation, the following commands are available globally by typing `/` in any project:

### Mode-Switching Commands
| Command | Description |
|---|---|
| `/planning` | Start planning mode — architecture & project management |
| `/developer` | Start developer mode — implementation workflow |
| `/debugger` | Start debugging mode — scientific error triage |
| `/study` | Start study mode — read-only code education |
| `/suggestion` | Start suggestion mode — read-only optimization advice |

### CLI Utility Commands
| Command | Description |
|---|---|
| `/model` | Show current AI model or switch to a different model |
| `/agent` | List available agents or switch to a different agent |
| `/export` | Export conversation, plans, or project artifacts |
| `/connect` | Connect to external services, APIs, or remote resources |

These commands are configured via the global `opencode.jsonc` and will appear as suggestions in any project you open.

## 🤖 Gemini CLI Support
If using Google Gemini CLI, slash commands are also registered via `.toml` files in `~/.gemini/commands/`:
- `planning.toml`, `developer.toml`, `debug.toml`
- `model.toml`, `agent.toml`, `export.toml`, `connect.toml`

These are installed globally and work across all workspaces.
