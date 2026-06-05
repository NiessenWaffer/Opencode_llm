import { tool } from "@opencode-ai/plugin";

export default tool({
  description: "Validates path authorization based on Master Rulebook boundaries.",
  args: {
    path: tool.schema.string().describe("The path to validate."),
    agent_mode: tool.schema.string().describe("The current agent mode (plan/build)."),
  },
  async execute({ path, agent_mode }) {
    const forbidden = [".git/", "node_modules/", ".env", "/etc/"];
    const sensitive = ["config/", "secrets/", "auth/"];

    if (forbidden.some(f => path.includes(f))) {
      return {
        output: JSON.stringify({ status: "forbidden", authorized: false, message: "CRITICAL: Path is on the FORBIDDEN list." }, null, 2)
      };
    }

    if (sensitive.some(s => path.includes(s)) && agent_mode === "build") {
      return {
        output: JSON.stringify({ status: "warning", authorized: true, action: "CONSULT", message: "SENSITIVE path detected. Triggering mandatory CONSULT Pass." }, null, 2)
      };
    }

    return {
      output: JSON.stringify({ status: "authorized", authorized: true, message: "Path approved for standard operation." }, null, 2)
    };
  },
});
