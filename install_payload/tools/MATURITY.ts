import { tool } from "@opencode-ai/plugin";
import { glob } from "glob";

export default tool({
  name: "MATURITY",
  description: "Scans project for missing architectural components and foundational gaps.",
  args: {
    project_type: tool.schema.string().describe("e.g., node, python, rust"),
  },
  async execute({ project_type }) {
    const gaps = [];
    const files = await glob("**/*", { ignore: ["node_modules/**", ".git/**"] });
    
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
      status: gaps.length > 0 ? "incomplete" : "mature",
      foundational_gaps: gaps,
      score: 100 - (gaps.length * 20),
      message: gaps.length > 0 ? "Architectural gaps identified. Address foundational debt before building high-level features." : "Project structure is mature."
    };
  },
});
