import { tool } from "@opencode-ai/plugin";
import * as fs from "fs/promises";
import * as path from "path";

export default tool({
  name: "WRITE_PLAN",
  description: "Creates or updates planning artifacts (plan.md, workflow.md, index.md). Restricted to the 'List plan/' directory.",
  args: {
    file_name: tool.schema.string().describe("e.g., plan.md, workflow.md"),
    plan_id: tool.schema.number().describe("The sequence ID (e.g., 1, 2)."),
    content: tool.schema.string().describe("The high-signal Markdown content."),
  },
  async execute({ file_name, plan_id, content }) {
    const planDir = path.resolve(process.cwd(), "List plan", `plan${plan_id}`);
    await fs.mkdir(planDir, { recursive: true });
    
    const filePath = path.join(planDir, file_name);
    
    // Safety check: Ensure we only write to the planning directory
    if (!filePath.includes("List plan")) {
      return {
        status: "blocked",
        message: "Safety Block: WRITE_PLAN is restricted to the 'List plan/' directory."
      };
    }

    await fs.writeFile(filePath, content, "utf-8");
    
    return {
      status: "success",
      message: `Successfully wrote planning artifact: ${filePath}`
    };
  },
});
