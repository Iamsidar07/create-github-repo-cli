# GitHub Repository Creator

This Bash script automates the process of creating a new GitHub repository using the GitHub API and optionally setting up a Next.js application.

## Prerequisites

Before using this script, make sure you have the following prerequisites installed:

- [httpie](https://httpie.io/) - HTTP client for making API requests
- [jq](https://jqlang.github.io/jq/) - Command-line JSON processor

## Installation

1. Clone this repository:

   ```bash
   git clone https://github.com/Iamsidar07/create-github-repo-cli.git
2. Change to the script directory:
    ```bash
    cd create-github-repo-cli
    ```
3. Make the script executable:
    ```bash
    chmode +x create-github-repo.sh
    ```
4. Add script to your system's PATH so that it can executable from anywhere:
    - Find your home directory:
        ```bash
        echo $HOME
        ```
    - Move the script inside bin folder:
        ```bash
        mv create-github-repo.sh ~/bin
        ```
    - Add this into your shell profile:
        ```bash
        export PATH="$PATH:$HOME/bin"
        ```
    - Save the file run:
        ```bash
        source (path_to_your_shell)
        ```

5. Secure your GITHUB_TOKEN add it into your shell profile:
    ```bash
    export GITHUB_TOKEN="github_token"
    ```
## Usage
- open terminal
- Run the script with the desired repository name and description:
  ```bash
  create-github-repo.sh <github_repo_name> <repo_description>
  ```
  replace **<github_repo_name>** with repository name and **<repo_description>** with description
- Ask to initialize a nextjs app.
- Ask to initialize shadcn-ui.