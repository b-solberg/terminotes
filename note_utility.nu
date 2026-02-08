# Define notes path for all functions
export def notes_dir [] {
	let dir = $env.NOTES_DIR?
	if $dir == null {
		error make {msg: "Set $env.NOTES_DIR to your notes folder"}
	}
	$dir
}
# Change to Notes Directory and ripgrep + fzf + bat to search and preview notes. Opens selected note in nvim
export def notes [] {
	let dir = (notes_dir)
	cd $dir
	let choice = (
		rg --line-number --no-heading --color never .
		| fzf --delimiter ":" --preview 'bat --style=numbers --color=always --highlight-line {2} {1}' --preview-window 'right:60%'
		)
	if ($choice | is-empty) { return }
	let p = ($choice | split row ":")
	nvim $"+($p | get 1)" ($p | get 0)
}

# Creates a new note in Notes directory with timestamped note name "YY MM DD HH MM SS.md"
export def nn [] {
	let dir = (notes_dir)
	cd $dir
	let ts = (date now | format date "%Y%m%d_%H%M%S")
	let file = $"($ts).md"

	touch $file
	nvim $file
}

# Search Notes Directory for "!MM/DD" phrase. Useful for things scheduled for current day. 
export def tdd [] {
	let dir = (notes_dir)
	cd $dir
	let today = (date now | format date "%m/%d")
	let pattern = $"!($today)"

	let choice = (
		rg --line-number --no-heading --color never $pattern . 
		| fzf
			--delimiter ":"
			--preview 'bat --style=numbers --color=always --highlight-line {2} {1}'
			--preview-window 'right:60%'
		)

	if ($choice | is-empty) { return }

	let parts = ($choice | split row ":")
	let file = ($parts | get 0)
	let line = ($parts | get 1)

	nvim $"+($line)" $file
}

# Search Notes Directory for "#fr" phrase. Useful for future reading topics. 
export def frr [] {
	let dir = (notes_dir)
	cd $dir
	let pattern = $"#fr"

	let choice = (
		rg --line-number --no-heading --color never $pattern . 
		| fzf
			--delimiter ":"
			--preview 'bat --style=numbers --color=always --highlight-line {2} {1}'
			--preview-window 'right:60%'
		)

	if ($choice | is-empty) { return }

	let parts = ($choice | split row ":")
	let file = ($parts | get 0)
	let line = ($parts | get 1)

	nvim $"+($line)" $file
}
