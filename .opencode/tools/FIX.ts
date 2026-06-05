import { tool } from "@opencode-ai/plugin";
import * as fs from "fs/promises";
import * as path from "path";

export default tool({
  description: "Applies a surgical code update using contextual Match-Block anchoring. Includes safety guards.",
  args: {
    file_path: tool.schema.string().describe("Relative path to the file."),
    old_string: tool.schema.string().describe("The exact code block to be replaced."),
    new_string: tool.schema.string().describe("The new code block to insert."),
    rationale: tool.schema.string().describe("One-sentence reason for this change."),
  },
  async execute({ file_path, old_string, new_string, rationale }, context) {
    const fullPath = path.resolve(context.directory, file_path);
    
    // 1. Read file
    const content = await fs.readFile(fullPath, "utf-8");
    
    // 2. Match-Block Check
    if (!content.includes(old_string)) {
      return {
        output: JSON.stringify({
        status: "error",
        message: `Match failed: 'old_string' not found in ${file_path}. The file may have shifted. Run SIG() to refresh context.`
        }, null, 2)
      };
    }
    
    // 3. Anti-Truncation Guard
    const sizeDelta = (new_string.length - old_string.length) / content.length;
    if (sizeDelta < -0.20 && !new_string.includes("//")) {
      return {
        output: JSON.stringify({
        status: "blocked",
        message: `Safety Block: Proposed change reduces file size by ${Math.abs(sizeDelta * 100).toFixed(1)}%. Possible truncation detected. Please VERIFY and resubmit.`
        }, null, 2)
      };
    }
    
    // 4. Atomic Backup
    const backupDir = path.join(context.directory, ".opencode", "backups");
    await fs.mkdir(backupDir, { recursive: true });
    const timestamp = new Date().toISOString().replace(/[:.]/g, "-");
    await fs.writeFile(path.join(backupDir, `${path.basename(file_path)}.${timestamp}.bak`), content);
    
    // 5. Apply Fix
    const updatedContent = content.replace(old_string, new_string);
    await fs.writeFile(fullPath, updatedContent);
    
    return {
      output: JSON.stringify({
      status: "success",
      message: `Successfully applied fix to ${file_path}. Backup created at .opencode/backups/.`,
      rationale
      }, null, 2)
    };
  },
});
