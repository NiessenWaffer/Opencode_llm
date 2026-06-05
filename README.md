# OpenCode AI Mode Intelligence

Industrial-grade AI orchestration for [OpenCode CLI](https://opencode.ai). Safe, precise, and high-performance engineering in large-scale codebases.

## 🚀 One-Click Install (Recommended)
## 🚀 Quick Install

1. **Clone the repo:**
   ```bash
   git clone https://github.com/NiessenWaffer/Opencode_llm.git
   ```

2. **Navigate to the project folder:**
   ```bash
   # Git automatically creates the folder 'Opencode_llm'
   cd Opencode_llm
   ```

3. **Verify you are in the right place:**
   ```bash
   # List the files. You MUST see 'install.ps1' listed here.
   # Windows:
   dir
   # Unix/Mac:
   ls
   ```

4. **Run the Automated Installer:**
   - **Windows:** `.\install.ps1`
   - **Unix/Mac:** `chmod +x install.sh && ./install.sh`

*These scripts automatically perform environment cleanup, tool deployment, and dependency resolution.*

## ⚠️ Important Troubleshooting
- **Permission Errors:** Always ensure your terminal is opened in your project directory (e.g., `C:\Users\Name\Projects\Opencode_llm`), **NEVER** in a system directory like `C:\WINDOWS\system32`.
- **Startup Errors:** If you see "4 of 5 requests failed", ensure `RULES.md` is present in your **project root** directory. The CLI will crash if it finds rule files inside the hidden `.opencode/` folder.

## 🧠 System Structure
- **`.opencode/agents/`**: Contains specialized AI shells for current OpenCode versions.
- **`.opencode/agent/`**: Compatibility copy for older OpenCode loaders.
- **`.opencode/tools/`**: Project-local custom tools such as `MAP`, `SIG`, `FIX`, and `WRITE_PLAN`.
- **`RULES.md`**: Master Rulebook (Must remain in project root).
- **`List plan/`**: Architectural blueprints and workflow roadmaps.
- **`install_payload/tools/`**: Global utility tools for the Knowledge Broker.

---
Built with Meta-Cognitive Precision. Fully autonomous. Senior Architect grade.
