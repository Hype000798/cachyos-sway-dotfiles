# Contributing to CachyOS Sway Dotfiles

Thank you for considering contributing to this project! This document provides guidelines and instructions for contributing to the CachyOS Sway Dotfiles repository.

## Table of Contents

- [Code of Conduct](#code-of-conduct)
- [Getting Started](#getting-started)
- [Development Workflow](#development-workflow)
- [Contribution Guidelines](#contribution-guidelines)
- [Style Guidelines](#style-guidelines)
- [Submitting Changes](#submitting-changes)
- [Reporting Issues](#reporting-issues)

## Code of Conduct

By participating in this project, you agree to maintain a respectful and inclusive environment. We expect all contributors to:

- Be respectful and constructive in discussions
- Accept constructive criticism gracefully
- Focus on what is best for the community
- Show empathy towards other community members

## Getting Started

### Prerequisites

Before contributing, ensure you have:

- A CachyOS system or Arch-based Linux distribution
- `chezmoi` installed for dotfile management
- Git configured with your credentials
- Basic knowledge of Sway/Wayland, shell scripting, and configuration files

### Fork and Clone

1. Fork the repository on GitHub
2. Clone your fork locally:
   ```bash
   git clone git@github.com:YOUR_USERNAME/cachyos-sway-dotfiles.git ~/.local/share/chezmoi
   cd ~/.local/share/chezmoi
   ```
3. Add the upstream repository:
   ```bash
   git remote add upstream git@github.com:Hype000798/cachyos-sway-dotfiles.git
   ```

## Development Workflow

### Setting Up Your Environment

1. **Install Dependencies**: Run the setup script to ensure all required packages are installed:
   ```bash
   ~/.local/share/chezmoi/executable_arch-setup-script.sh
   ```

2. **Apply Dotfiles**: Test the configuration on your system:
   ```bash
   chezmoi apply
   ```

3. **Create a Branch**: Always work on a feature branch:
   ```bash
   git checkout -b feature/your-feature-name
   ```

### Testing Your Changes

1. **Local Testing**: After making changes, apply them to your system:
   ```bash
   chezmoi apply
   ```

2. **Reload Sway**: Test your changes by reloading Sway:
   - Press `Mod+Shift+c` to reload configuration
   - Or run `swaymsg reload`

3. **Test Scripts**: If modifying scripts, test them individually:
   ```bash
   ~/.config/sway/scripts/your-script.sh
   ```

4. **Check Syntax**: For shell scripts, use shellcheck:
   ```bash
   shellcheck ~/.local/share/chezmoi/dot_config/sway/scripts/executable_your-script.sh
   ```

### Syncing with Upstream

Keep your fork up-to-date with the main repository:

```bash
git fetch upstream
git checkout main
git merge upstream/main
git push origin main
```

## Contribution Guidelines

### What to Contribute

We welcome contributions in the following areas:

- **Bug Fixes**: Fix existing issues or bugs
- **New Features**: Add new functionality or scripts
- **Documentation**: Improve or expand documentation
- **Optimization**: Performance improvements or code optimization
- **Themes**: New color schemes or visual enhancements
- **Scripts**: Utility scripts for Sway/Waybar

### What Not to Contribute

- Breaking changes without discussion
- Personal configurations that are too specific
- Large binary files (use Git LFS if necessary)
- Code that violates licenses or copyrights

## Style Guidelines

### Shell Scripts

- Use `#!/bin/bash` shebang
- Follow POSIX standards where possible
- Use meaningful variable names in `UPPER_CASE`
- Include comments for complex logic
- Use functions for reusable code
- Include error handling with `set -e`
- Add color output for user feedback

Example:
```bash
#!/bin/bash
set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Function to print status
print_status() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

# Main logic
main() {
    print_status "Starting process..."
    # Your code here
}

main "$@"
```

### Configuration Files

- **Sway Config**: Follow the official Sway config syntax
- **JSON/JSONC**: Use 4-space indentation
- **YAML/TOML**: Use 2-space indentation
- **CSS**: Use 4-space indentation with organized sections

### Naming Conventions

- **Scripts**: Use descriptive names with underscores: `executable_script-name.sh`
- **Config Files**: Use `dot_` prefix for chezmoi: `dot_config/sway/config`
- **Variables**: `UPPER_CASE` for constants, `lower_case` for local variables

### Documentation

- Use clear, concise language
- Include code examples where appropriate
- Update relevant documentation when making changes
- Add comments to complex configurations

## Submitting Changes

### Commit Messages

Follow the conventional commits format:

```
type(scope): brief description

Detailed explanation if necessary

- Additional details
- Related issue references
```

**Types**:
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Code style changes (formatting, no logic change)
- `refactor`: Code refactoring
- `perf`: Performance improvements
- `test`: Adding or updating tests
- `chore`: Maintenance tasks

**Examples**:
```
feat(sway): add new keybinding for window splitting

docs(readme): update installation instructions

fix(scripts): correct screenshot path handling
```

### Pull Request Process

1. **Update Your Branch**:
   ```bash
   git fetch upstream
   git rebase upstream/main
   ```

2. **Push to Your Fork**:
   ```bash
   git push origin feature/your-feature-name
   ```

3. **Create Pull Request**:
   - Go to your fork on GitHub
   - Click "New Pull Request"
   - Select your feature branch
   - Fill out the PR template

4. **PR Guidelines**:
   - Provide a clear description of changes
   - Reference related issues (e.g., "Fixes #123")
   - Include screenshots for visual changes
   - Ensure all tests pass
   - Be responsive to feedback

### Review Process

- Maintainers will review your PR
- Address any requested changes
- Once approved, your PR will be merged
- Delete your feature branch after merging

## Reporting Issues

### Before Reporting

- Search existing issues to avoid duplicates
- Test on a clean installation if possible
- Gather relevant system information

### Issue Template

When reporting bugs, include:

- **Description**: Clear description of the issue
- **Steps to Reproduce**: Detailed steps to recreate the problem
- **Expected Behavior**: What should happen
- **Actual Behavior**: What actually happens
- **System Information**:
  - OS version (e.g., CachyOS, Arch Linux)
  - Sway/SwayFX version
  - Relevant package versions
- **Logs**: Relevant error messages or logs
- **Screenshots**: If applicable

### Feature Requests

When requesting features:

- Provide a clear use case
- Explain the expected benefit
- Consider implementation complexity
- Discuss alternatives you've considered

## Questions and Support

- **Issues**: Use GitHub Issues for bug reports and feature requests
- **Discussions**: Use GitHub Discussions for questions and general discussion
- **Documentation**: Check existing documentation first

## License

By contributing, you agree that your contributions will be licensed under the MIT License, the same license as this project.

---

Thank you for contributing to CachyOS Sway Dotfiles! Your efforts help make this project better for everyone.
