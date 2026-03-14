git-new-worktree() {
  usage() {
    echo "Create a git worktree for a branch and cd into it."
    echo ""
    echo "Usage: git-new-worktree <branch-name>"
  }

  local repo_root
  repo_root=$(git rev-parse --show-toplevel 2>/dev/null)

  if [[ -z "$repo_root" ]]; then
    echo "Not inside a git repository."
    return 1
  fi

  local branch="$1"

  if [[ -z "$branch" ]]; then
    usage
    return 1
  fi

  local project_name
  project_name=$(basename "$repo_root")

  local branch_path="${branch//\//-}"

  local worktrees_dir="$repo_root/../worktrees/$project_name"
  local worktree_path="$worktrees_dir/$branch_path"

  mkdir -p "$worktrees_dir"

  # Reuse existing worktree
  if [[ -d "$worktree_path" ]]; then
    echo "Worktree already exists at $worktree_path"
    cd "$worktree_path"
    return
  fi

  # Update remote refs quietly
  git -C "$repo_root" fetch origin --prune >/dev/null 2>&1 || true

  # Existing local branch
  if git -C "$repo_root" rev-parse --verify "refs/heads/$branch" >/dev/null 2>&1; then
    echo "Creating worktree for existing local branch: $branch"
    git -C "$repo_root" worktree add "$worktree_path" "$branch"

  # Existing remote branch
  elif git -C "$repo_root" show-ref --verify --quiet "refs/remotes/origin/$branch"; then
    echo "Tracking remote branch origin/$branch"
    git -C "$repo_root" worktree add "$worktree_path" -b "$branch" "origin/$branch"

  else
    # Detect default branch
    local base
    base=$(git -C "$repo_root" symbolic-ref --quiet --short refs/remotes/origin/HEAD 2>/dev/null)

    if [[ -z "$base" ]]; then
      if git -C "$repo_root" rev-parse --verify origin/main >/dev/null 2>&1; then
        base="origin/main"
      elif git -C "$repo_root" rev-parse --verify origin/master >/dev/null 2>&1; then
        base="origin/master"
      else
        base="main"
      fi
    fi

    echo "Creating new branch $branch from $base"
    git -C "$repo_root" worktree add "$worktree_path" -b "$branch" "$base"
  fi

  cd "$worktree_path"
}
