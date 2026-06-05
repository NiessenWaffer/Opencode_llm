import { tool } from "@opencode-ai/plugin";
import * as fs from "fs/promises";
import * as path from "path";

export default tool({
  description: "Recursively scans the directory structure. Identifies entry points and module boundaries.",
  args: {
    target_dir: tool.schema.string().default(".").describe("Directory to scan (default: root)."),
  },
  async execute({ target_dir }, context) {
    const root = path.resolve(context.directory, target_dir);
    const ignored = new Set(["node_modules", ".git", "dist", "build", "backups", "snapshots"]);
    const files: string[] = [];

    async function walk(dir: string) {
      for (const entry of await fs.readdir(dir, { withFileTypes: true })) {
        if (entry.name.startsWith(".env") || ignored.has(entry.name)) continue;
        const fullPath = path.join(dir, entry.name);
        const relativePath = path.relative(root, fullPath).replace(/\\/g, "/");
        files.push(relativePath);
        if (entry.isDirectory()) await walk(fullPath);
      }
    }

    await walk(root);

    return {
      output: JSON.stringify({
      status: "success",
      file_tree: files,
      count: files.length,
      message: `Project mapped. ${files.length} files identified (excluding forbidden/ignored paths).`
      }, null, 2)
    };
  },
});
