# Agent Guidelines for Dotfiles Repository

## Build/Lint/Test Commands

- No specific build commands are needed for this dotfiles repository

## Code Style Guidelines

- **Imports**: Group related imports together (e.g., Lua standard library, then plugins)
- **Formatting**:
  - Use 2 spaces for indentation
  - Keep line length under 80 characters when possible
  - Use consistent spacing around operators and after commas
- **Naming Conventions**:
  - Use snake_case for variables and functions
  - Use PascalCase for tables/modules
- **Error Handling**: Use `pcall` for protected calls in Lua
- **Types**: Use Lua type annotations when appropriate for clarity
- **Documentation**: Add comments for complex logic or non-obvious behavior

