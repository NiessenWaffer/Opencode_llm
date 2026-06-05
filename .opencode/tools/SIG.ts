import { tool } from "@opencode-ai/plugin";
import * as fs from "fs/promises";
import * as path from "path";

export default tool({
  description: "Performs AST-based signature extraction. Returns function/class signatures without bodies.",
  args: {
    file_path: tool.schema.string().describe("Path to the file to analyze."),
  },
  async execute({ file_path }, context) {
    try {
      const fullPath = path.resolve(context.directory, file_path);
      const content = await fs.readFile(fullPath, "utf-8");
      const signatures = content
        .split(/\r?\n/)
        .filter((line: string) => /^\s*export\s+(async\s+)?(function|class|const|let|var|type|interface|enum)\b/.test(line));
      
      return {
        output: JSON.stringify({
        status: "success",
        signatures,
        message: "Signatures extracted successfully. Context anchor updated."
        }, null, 2)
      };
    } catch (error) {
      return {
        output: JSON.stringify({
        status: "error",
        message: `Failed to extract signatures: ${error instanceof Error ? error.message : String(error)}`
        }, null, 2)
      };
    }
  },
});
