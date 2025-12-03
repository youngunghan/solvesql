import time
import os
import subprocess
import sys

WATCH_DIR = "./Advent_of_SQL_2025"
EXTENSIONS = [".sql"]
CHECK_INTERVAL = 3  # seconds

def run_command(command):
    try:
        result = subprocess.run(
            command,
            check=True,
            shell=True,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True
        )
        return result.stdout.strip()
    except subprocess.CalledProcessError as e:
        print(f"Error running command '{command}': {e.stderr}")
        return None

def get_file_states():
    states = {}
    for root, _, files in os.walk(WATCH_DIR):
        if ".git" in root:
            continue
        for file in files:
            if any(file.endswith(ext) for ext in EXTENSIONS):
                path = os.path.join(root, file)
                try:
                    mtime = os.path.getmtime(path)
                    states[path] = mtime
                except OSError:
                    continue
    return states

def main():
    print(f"Monitoring {os.path.abspath(WATCH_DIR)} for changes in {EXTENSIONS}...")
    
    # Check if git is initialized
    if not os.path.exists(os.path.join(WATCH_DIR, ".git")):
        print("Error: Not a git repository. Please run 'git init' first.")
        return

    last_states = get_file_states()

    try:
        while True:
            time.sleep(CHECK_INTERVAL)
            current_states = get_file_states()
            
            # Check for modified or new files
            for path, mtime in current_states.items():
                if path not in last_states or last_states[path] != mtime:
                    print(f"Detected change in: {path}")
                    
                    # Git operations
                    filename = os.path.basename(path)
                    rel_path = os.path.relpath(path, WATCH_DIR)
                    
                    print(f"Adding {rel_path}...")
                    run_command(f'git add "{rel_path}"')
                    
                    commit_msg = f"Solve: {filename}"
                    print(f"Committing with message: '{commit_msg}'...")
                    if run_command(f'git commit -m "{commit_msg}"'):
                        print("Pushing to remote...")
                        push_result = run_command("git push")
                        if push_result is not None:
                            print("Successfully pushed!")
                        else:
                            print("Push failed. Please check your remote configuration.")
            
            last_states = current_states
            
    except KeyboardInterrupt:
        print("\nStopping monitor.")

if __name__ == "__main__":
    main()
