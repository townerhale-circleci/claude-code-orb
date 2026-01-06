#!/bin/bash

echo "Installing Claude Code CLI..."

# Check if npm is available
if ! command -v npm &> /dev/null; then
    echo "Error: npm is not installed. Please use an executor with Node.js."
    exit 1
fi

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