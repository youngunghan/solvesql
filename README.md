# Advent of SQL 2025 Solutions

This repository contains my solutions for [Advent of SQL 2025](https://solvesql.com/collections/advent-of-sql-2025/).

## Automation

I use a script `auto_push.py` to automatically push my solutions to GitHub whenever I save a `.sql` file.

### Setup

1.  Initialize the git repository (if not already done):
    ```bash
    git init
    ```

2.  Add your GitHub remote:
    ```bash
    git remote add origin <YOUR_GITHUB_REPO_URL>
    git branch -M main
    git push -u origin main
    ```

3.  Run the automation script:
    ```bash
    python3 auto_push.py
    ```

Now, whenever you save a `.sql` file in this directory, it will be automatically committed and pushed.
