# Token Efficiency Rules

> These rules minimize token consumption without sacrificing output quality.
> Every token costs money and latency. Be ruthless about waste.

---

## File Reading Strategy

1. **Scout first, read second.**
   - Use `list_dir` to understand project structure before diving in
   - Use `grep_search` to locate specific code before reading files
   - Only use `view_file` when you need to understand surrounding context

2. **Read targeted ranges.**
   - After grep finds the relevant lines, read only those lines ± 10 lines of context
   - Never read an entire 500-line file to find a 10-line function

3. **Never re-read.**
   - If you read a file earlier in this conversation, reference that knowledge
   - Only re-read if the file was explicitly modified since your last read

4. **Parallel reconnaissance.**
   - When you need info from multiple files, issue all read/grep calls in parallel
   - Don't chain sequential reads when the files are independent

## Output Rules

1. **No re-printing.**
   - After editing a file, don't print the entire updated file
   - Show only a brief summary of what changed

2. **Bullets over prose.**
   - Use bullet points for summaries, not paragraphs
   - Maximum 5 summary bullets per task

3. **Skip pleasantries.**
   - No "Certainly!", "Great question!", "I'd be happy to help!"
   - No "Here's what I did:" preamble — just show the results

4. **Diffs over rewrites.**
   - When showing changes, show the diff, not the full new file
   - Exception: new files being created for the first time

## Planning Efficiency

1. **Simple tasks (1-2 files): Just do it.** No planning overhead.
2. **Medium tasks (3-5 files): One-line plan per step.** Then execute.
3. **Complex tasks (6+ files): Brief bullet plan.** Get user approval, then execute.

## Tool Usage

1. **Batch edits.** Use `multi_replace_file_content` for non-contiguous edits in one file.
2. **Batch terminal commands.** Chain related commands with `&&` when they're all safe.
3. **Don't over-verify.** After a simple change, don't run the entire test suite — run only the relevant test.
