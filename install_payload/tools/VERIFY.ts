import { tool } from "@opencode-ai/plugin";

export default tool({
  name: "VERIFY",
  description: "Performs an adversarial critique of a proposed plan or fix. Identifies breaking changes and side effects.",
  args: {
    proposed_fix: tool.schema.string().describe("The code or plan to be verified."),
    context: tool.schema.string().describe("Current file or module context."),
  },
  async execute({ proposed_fix, context }) {
    const risks = [];
    
    // 1. Check for export deletion
    if (proposed_fix.includes("export") === false && context.includes("export")) {
      risks.push("CRITICAL: Proposed fix may be deleting public exports, breaking external dependencies.");
    }
    
    // 2. Check for logic complexity
    const lineCount = proposed_fix.split("\n").length;
    if (lineCount > 50) {
      risks.push("WARNING: High complexity fix detected. Recommend splitting into smaller vertical slices.");
    }
    
    // 3. Side-effect check (mock logic)
    if (proposed_fix.includes("import") && proposed_fix.includes("../")) {
      risks.push("INFO: Cross-module dependency added. Verify no circular imports are introduced.");
    }

    return {
      status: risks.length > 0 ? "warning" : "success",
      critique: risks.length > 0 ? risks : ["No immediate risks identified. Proceed with caution."],
      failure_hypothesis: risks.length > 0 ? "This fix may cause runtime regression due to orphaned references." : "None."
    };
  },
});
