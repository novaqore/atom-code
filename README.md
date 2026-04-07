# Atom

AI coding agent for your terminal. Built by [NovaQore](https://novaqore.ai).

Atom is an interactive CLI that helps you write, debug, and ship code through natural conversation — right from your terminal.

## Install

```bash
curl -fsSL https://raw.githubusercontent.com/novaqore/atom-code/main/install.sh | bash
```

This installs the `atom` binary to `~/.atom/bin` and adds it to your PATH.

## Usage

```bash
atom
```

This launches Atom in interactive mode. Start a conversation and Atom will help you with coding tasks in your current working directory.

### One-shot mode

```bash
atom "explain what this project does"
```

Pass a prompt directly to get a quick answer without entering interactive mode.

### Commands

Once inside Atom, you can use slash commands:

| Command | Description |
|---------|-------------|
| `/help` | Show available commands |
| `/status` | Show session status |
| `/clear` | Clear conversation |
| `/compact` | Compact conversation history |
| `/cost` | Show token usage |
| `/config` | Manage configuration |
| `/memory` | Manage memory |

## Requirements

- Linux (x86_64)
- `NOVAQORE_API_KEY` environment variable set

```bash
export NOVAQORE_API_KEY="your-key-here"
```

Add this to your `~/.bashrc` or `~/.zshrc` to persist it.

## Uninstall

```bash
rm -rf ~/.atom
```

Then remove the PATH line from your shell config file.

## License

MIT
