import { tool } from "@opencode-ai/plugin";
import { glob } from "glob";

export default tool({
  name: "MAP",
  description: "Recursively scans the directory structure. Identifies entry points and module boundaries.",
  args: {
    target_dir: tool.schema.string().describe("Directory to scan (default: root)."),
  },
  async execute({ target_dir = "." }) {
    const files = await glob("**/*", { 
      cwd: target_dir,
      ignore: [
        "node_modules/**", 
        ".git/**", 
        ".opencode/backups/**",
        ".env*",
        "dist/**",
        "build/**"
      ],
      nodir: false
    });

    return {
      status: "success",
      file_tree: files,
      count: files.length,
      message: `Project mapped. ${files.length} files identified (excluding forbidden/ignored paths).`
    };
  },
});
