import { tool } from "@opencode-ai/plugin";
import * as fs from "fs/promises";

export default tool({
  name: "FIND_RELATED",
  description: "Scans a file for import/require statements and builds a dependency map.",
  args: {
    file_path: tool.schema.string().describe("The file to analyze."),
  },
  async execute({ file_path }) {
    try {
      const content = await fs.readFile(file_path, "utf-8");
      // Regex for standard ESM/CJS imports
      const importRegex = /(?:import|require|from)\s+['"]([^'"]+)['"]/g;
      const related = [];
      let match;

      while ((match = importRegex.exec(content)) !== null) {
        related.push(match[1]);
      }

      return {
        status: "success",
        base_file: file_path,
        related_paths: [...new Set(related)],
        message: `Found ${related.length} unique dependencies. Use SIG() to inspect them.`
      };
    } catch (error) {
      return { status: "error", message: error.message };
    }
  },
});
