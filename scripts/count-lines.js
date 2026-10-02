#!/usr/bin/env node

const fs = require('fs');
const path = require('path');

const projectRoot = path.join(__dirname, '..');

/**
 * Count the number of message entries in AnsweringMachine.lua
 * Counts all string entries in the answeringMachineLines table
 */
function countAnsweringMachineLines() {
  const filePath = path.join(
    projectRoot,
    'public',
    'Src',
    'AnsweringMachine',
    'AnsweringMachine.lua'
  );

  if (!fs.existsSync(filePath)) {
    console.warn(`⚠️  File not found: ${filePath}`);
    return 0;
  }

  const content = fs.readFileSync(filePath, 'utf8');

  // Count table.insert calls that add lines to answeringMachineLines
  const insertPattern = /table\.insert\(answeringMachineLines/g;
  const insertMatches = content.match(insertPattern) || [];

  // Count entries in the initial answeringMachineLines table definition
  const tablePattern = /local answeringMachineLines = \{([\s\S]*?)\}/;
  const tableMatch = content.match(tablePattern);

  let count = insertMatches.length;

  if (tableMatch) {
    const tableContent = tableMatch[1];
    // Count quoted strings (lines with actual messages)
    const stringMatches = tableContent.match(/["'`][^"'`]*["'`]/g) || [];
    count += stringMatches.length;
  }

  return count;
}

/**
 * Generate markdown for release notes
 */
function generateReleaseNotes() {
  console.log('📊 Content Statistics:\n');

  const count = countAnsweringMachineLines();
  const stats = { 'Answering Machine': count };

  const bar = '█'.repeat(Math.ceil(count / 10));
  console.log(`${'Answering Machine'.padEnd(20)} ${count.toString().padStart(3)} lines  ${bar}`);

  console.log('\n' + '─'.repeat(50));
  console.log(`${'TOTAL'.padEnd(20)} ${count.toString().padStart(3)} lines`);
  console.log('─'.repeat(50) + '\n');

  // Generate markdown
  const markdown = `## 📊 Content Statistics

| Feature | Line Count |
|---------|-----------|
| Answering Machine | ${count} |
| **TOTAL** | **${count}** |

---
Generated on: ${new Date().toISOString()}
`;

  return { markdown, stats, totalLines: count };
}

/**
 * Write statistics to a file
 */
function writeStats() {
  const { markdown, stats, totalLines } = generateReleaseNotes();

  const outputFile = path.join(projectRoot, '.release-stats.md');
  fs.writeFileSync(outputFile, markdown);

  // Also write as JSON for easier parsing in GitHub Actions
  const jsonFile = path.join(projectRoot, '.release-stats.json');
  fs.writeFileSync(
    jsonFile,
    JSON.stringify({ features: stats, total: totalLines, generated: new Date().toISOString() }, null, 2)
  );

  console.log(`✅ Statistics written to ${outputFile}`);
  console.log(`✅ JSON stats written to ${jsonFile}`);
}

// Run
try {
  writeStats();
  process.exit(0);
} catch (error) {
  console.error('❌ Error:', error.message);
  process.exit(1);
}
