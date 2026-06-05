import { tool } from "@opencode-ai/plugin";
import * as fs from "fs/promises";
import * as path from "path";

export default tool({
  description: "Creates or updates planning artifacts (plan.md, workflow.md, index.md). Restricted to the 'List plan/' directory.",
  args: {
    file_name: tool.schema.string().describe("e.g., plan.md, workflow.md"),
    plan_id: tool.schema.number().describe("The sequence ID (e.g., 1, 2)."),
    content: tool.schema.string().describe("The high-signal Markdown content."),
  },
  async execute({ file_name, plan_id, content }, context) {
    const planRoot = path.resolve(context.directory, "List plan");
    const planDir = path.join(planRoot, `plan${plan_id}`);
    await fs.mkdir(planDir, { recursive: true });
    
    const filePath = path.join(planDir, file_name);
    
    // Safety check: Ensure we only write to the planning directory
    if (!filePath.startsWith(planRoot)) {
      return {
        output: JSON.stringify({
        status: "blocked",
        message: "Safety Block: WRITE_PLAN is restricted to the 'List plan/' directory."
        }, null, 2)
      };
    }

    await fs.writeFile(filePath, content, "utf-8");
    
    return {
      output: JSON.stringify({
      status: "success",
      message: `Successfully wrote planning artifact: ${filePath}`
      }, null, 2)
    };
  },
});
