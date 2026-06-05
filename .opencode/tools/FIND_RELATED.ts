import { tool } from "@opencode-ai/plugin";
import * as fs from "fs/promises";
import * as path from "path";

export default tool({
  description: "Scans a file for import/require statements and builds a dependency map.",
  args: {
    file_path: tool.schema.string().describe("The file to analyze."),
  },
  async execute({ file_path }, context) {
    try {
      const content = await fs.readFile(path.resolve(context.directory, file_path), "utf-8");
      // Regex for standard ESM/CJS imports
      const importRegex = /(?:import|require|from)\s+['"]([^'"]+)['"]/g;
      const related = [];
      let match;

      while ((match = importRegex.exec(content)) !== null) {
        related.push(match[1]);
      }

      return {
        output: JSON.stringify({
        status: "success",
        base_file: file_path,
        related_paths: [...new Set(related)],
        message: `Found ${related.length} unique dependencies. Use SIG() to inspect them.`
        }, null, 2)
      };
    } catch (error) {
      return {
        output: JSON.stringify({
          status: "error",
          message: error instanceof Error ? error.message : String(error)
        }, null, 2)
      };
    }
  },
});
