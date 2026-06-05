import { tool } from "@opencode-ai/plugin";
import * as fs from "fs/promises";
import * as path from "path";

export default tool({
  description: "Scans project for missing architectural components and foundational gaps.",
  args: {
    project_type: tool.schema.string().describe("e.g., node, python, rust"),
  },
  async execute({ project_type }, context) {
    const gaps = [];
    const files: string[] = [];

    async function walk(dir: string) {
      for (const entry of await fs.readdir(dir, { withFileTypes: true })) {
        if (["node_modules", ".git", "dist", "build"].includes(entry.name)) continue;
        const fullPath = path.join(dir, entry.name);
        files.push(path.relative(context.directory, fullPath).replace(/\\/g, "/"));
        if (entry.isDirectory()) await walk(fullPath);
      }
    }

    await walk(context.directory);
    
    // 1. Check for Error Handling
    if (!files.some(f => f.toLowerCase().includes("middleware") || f.toLowerCase().includes("error"))) {
      gaps.push("MISSING: No centralized error-handling middleware detected.");
    }
    
    // 2. Check for Testing Framework
    if (!files.some(f => f.includes(".test.") || f.includes(".spec."))) {
      gaps.push("ADVICE: Project lacks unit tests. TDE (Test-Driven Execution) will be required for new features.");
    }
    
    // 3. Check for Auth
    if (!files.some(f => f.toLowerCase().includes("auth") || f.toLowerCase().includes("jwt"))) {
      gaps.push("INFO: Authentication system not found. Features requiring permissions will need foundational work.");
    }

    return {
      output: JSON.stringify({
      status: gaps.length > 0 ? "incomplete" : "mature",
      project_type,
      foundational_gaps: gaps,
      score: 100 - (gaps.length * 20),
      message: gaps.length > 0 ? "Architectural gaps identified. Address foundational debt before building high-level features." : "Project structure is mature."
      }, null, 2)
    };
  },
});
