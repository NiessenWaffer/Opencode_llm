import { tool } from "@opencode-ai/plugin";
import * as fs from "fs/promises";
import * as path from "path";

export default tool({
  description: "Retrieves canonical terms from AGENTS.md to prevent synonym drift.",
  args: {
    concept: tool.schema.string().describe("The concept to look up (e.g., 'user', 'fix')."),
  },
  async execute({ concept }, context) {
    const agentsPath = path.resolve(context.directory, "AGENTS.md");
    const content = await fs.readFile(agentsPath, "utf-8");
    
    // Simple regex to extract from the Lexicon table
    const regex = new RegExp(`\\| (.*) \\| (.*) \\| (.*) \\|`, "g");
    let match;
    const terms: Record<string, string> = {};
    
    while ((match = regex.exec(content)) !== null) {
      terms[match[1].trim().toLowerCase()] = match[2].trim();
    }

    const canonical = terms[concept.toLowerCase()];

    return {
      output: JSON.stringify({
      status: canonical ? "success" : "not_found",
      term: canonical || concept,
      message: canonical ? `Use the term '${canonical}' for this concept.` : `No canonical term found for '${concept}'. Add to AGENTS.md if this is a core concept.`
      }, null, 2)
    };
  },
});
