#!/bin/bash

echo "Installing Claude Code CLI..."

# Check if npm is available
if ! command -v npm &> /dev/null; then
    echo "Error: npm is not installed. Please use an executor with Node.js."
    exit 1
fi

# Set npm global prefix to user directory (avoids permission issues)
npm config set prefix ~/.npm-global
export PATH=~/.npm-global/bin:$PATH

# Add to BASH_ENV so subsequent steps can find claude
echo 'export PATH=~/.npm-global/bin:$PATH' >> "$BASH_ENV"

# Install Claude Code
if [ "$CLAUDE_VERSION" = "latest" ]; then
    npm install -g @anthropic-ai/claude-code
else
    npm install -g @anthropic-ai/claude-code@"$CLAUDE_VERSION"
fi

# Verify installation
if command -v claude &> /dev/null; then
    echo "Claude Code installed successfully!"
    claude --version
else
    echo "Error: Claude Code installation failed."
    exit 1
fi
