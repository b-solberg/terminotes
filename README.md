# GREPository
A terminal based note taking utility module in nushell using neovim, ripgrep, fzf, and bat. 


--- 
All your notes are pure text and by default, markdown. They continue to workseamlessly with note taking software such as Obsidian. Notes are based around searching for what you need, with no regard for file naming or file/folder structure. The UI in most note taking software often gets in the way of taking quick notes or makes it hard to find what you need (if you don't remember the note name). If you know what you are looking for, its only a fuzzy find away. 

---

Use ```notes``` to search through all your notes. Refer to fzf for strict matching vs fuzzy finding if needed. 

Use ```nn``` to quickly create a new note with a name generated as a time stamp. 

Use ```tdd``` to search for files with !MM/DD. Use this command as a way to track a todo list. Set desired !MM/DD for a future date, and run ```tdd``` daily to check the current day's todo list. 

Use ```frr``` to search for files with #fr. Use this command to track things that will require future reading. 

Create custom commands to quickly search all files for specified tags/markers or simply search to tags/markers using ```notes```

# Dependencies 
- Nushell (cross platform so your note searching can go with any OS!)
- Ripgrep (use ripgrep-all for other media types if needed)
- fzf 
- bat
  
This module uses nushell. Convert to a shell of your choice. Ripgrep, fzf, and bat should work on them all. 

Set an environment variable for your notes directory in you shell config. If using an editor other than neovim, adjust file opening command as needed, currently commands open file to chosen line. 

