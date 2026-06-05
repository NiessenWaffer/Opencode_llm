import { tool } from "@opencode-ai/plugin";
import * as fs from "fs/promises";
import * as path from "path";

export default tool({
  description: "Captures the current session's mental state for zero-loss handoffs.",
  args: {
    summary: tool.schema.string().describe("Brief summary of the current task state."),
    risks_identified: tool.schema.array(tool.schema.string()).describe("List of risks found."),
  },
  async execute({ summary, risks_identified }, context) {
    const snapshotDir = path.join(context.directory, ".opencode", "snapshots");
    await fs.mkdir(snapshotDir, { recursive: true });
    
    const snapshot = {
      timestamp: new Date().toISOString(),
      summary,
      risks_identified,
      active_branch: "main"
    };

    await fs.writeFile(
      path.join(snapshotDir, "latest.json"), 
      JSON.stringify(snapshot, null, 2)
    );

    return {
      output: JSON.stringify({
      status: "success",
      message: "Context snapshot captured. Handoff ready."
      }, null, 2)
    };
  },
});
