#!/bin/bash

#Constants
GITHUB_TOKEN="$GITHUB_TOKEN"
API_VERSION="2022-11-28"

# Function to display usage information 
usage() {
    echo "Usage: $0 <repository_name> <repository_description>"
    exit 1
}

# Check if the required arguments are provided
if [ $# -ne 2 ]; then
    usage
fi

# Extract arguments
repo_name="$1"
repo_description="$2"

echo "Creating repo name: $repo_name and description: $repo_description"

# Function to create a GitHub repository
create_github_repo() {
    result=$(http POST https://api.github.com/user/repos \
        "Accept: application/vnd.github.v3+json" \
        "Authorization: Bearer $GITHUB_TOKEN" \
        "X-GitHub-Api-Version: $API_VERSION" \
        name="$repo_name" description="$repo_description" homepage="https://github.com" private:=false is_template:=true
    )

    # Extract the SSH URL from the result JSON
    ssh_url=$(echo "$result" | jq -r '.ssh_url')

    echo "Cloning $ssh_url"
    git clone "$ssh_url"

    # Extract the repository name from the result JSON
    repo_name=$(echo "$result" | jq -r '.name')

    echo "Changing directory to $repo_name"
    cd "$repo_name"
}

# Call the create_github_repo function
create_github_repo

# Ask the user if they want to create a next-app
read -p "Do you want to create a next-app? [y/n] " user_response
if [[ "$user_response" == "y" ]]; then
    read -p "Project name (Not a first Capital letter| . if in the same directory): " project_name
    echo "Creating next-app at @$project_name"
    npx create-next-app@latest "$project_name"
fi


