import { tool } from "@opencode-ai/plugin";

export default tool({
  name: "EVALUATE",
  description: "Ranks a task based on User Value vs. Implementation Effort.",
  args: {
    task_description: tool.schema.string().describe("Summary of the work to be done."),
    is_bug: tool.schema.boolean().describe("Is this task a bug fix?"),
  },
  async execute({ task_description, is_bug }) {
    let value = 50;
    let priority = "P1";
    
    if (is_bug) {
      value += 40;
      priority = "P0";
    }
    
    if (task_description.toLowerCase().includes("security") || task_description.toLowerCase().includes("auth")) {
      value += 50;
      priority = "P0";
    }
    
    if (task_description.toLowerCase().includes("refactor") && !is_bug) {
      value -= 20;
      priority = "P2";
    }

    return {
      status: "success",
      value_score: Math.min(value, 100),
      priority,
      recommendation: priority === "P2" ? "Defer until P0/P1 goals are met." : "Proceed immediately."
    };
  },
});
