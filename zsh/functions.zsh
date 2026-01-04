# Files 
function mkd() {
  mkdir -p "$@" && cd "$@"
}

# Git
function commit() {
  commitMessage="$1"

  if [ "$commitMessage" = "" ]
  then
    commitMessage="wip🚧🚧"
  fi
    git add .
    git commit -a -m "$commitMessage"
}

push() {
  local branch="$1"
  [[ -z "$branch" ]] && branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)

  if [[ -z "$branch" ]]; then
    echo "❌ Error: No branch specified and couldn't detect current branch." >&2
    return 1
  fi

  echo "🚀 Pushing to '$branch'..."
  if ! git push origin "$branch"; then
    echo "❌ Error: Git push failed!" >&2
    return 1
  fi
}

pull() {
  local branch="$1"
  [[ -z "$branch" ]] && branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)

  if [[ -z "$branch" ]]; then
    echo "❌ Error: No branch specified and couldn't detect current branch." >&2
    return 1
  fi

  echo "📥 Pulling from '$branch'..."
  if ! git pull origin "$branch"; then
    echo "❌ Error: Git pull failed!" >&2
    return 1
  fi
}

checkout() {
  local branch="$1"
  [[ -z "$branch" ]] && branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)

  if [[ -z "$branch" ]]; then
    echo "❌ Error: No branch specified and couldn't detect current branch." >&2
    return 1
  fi

  if git show-ref --verify --quiet "refs/heads/$branch"; then
    echo "📦 Switching to existing branch '$branch'..."
    git checkout "$branch" || { echo "❌ Error: Git checkout failed!" >&2; return 1; }

  elif git ls-remote --exit-code --heads origin "$branch" >/dev/null 2>&1; then
    echo "🌐 Remote branch '$branch' found. Checking out and tracking..."
    git checkout -t "origin/$branch" || { echo "❌ Error: Remote checkout failed!" >&2; return 1; }

  else
    print -n "⚠️ Branch '$branch' does not exist locally or remotely. Create it? (Y/n): "
    read confirm
    confirm=${confirm:-Y}
    if [[ "$confirm" =~ ^[Yy]$ ]]; then
      echo "🌱 Creating new branch '$branch'..."
      git checkout -b "$branch" || { echo "❌ Error: Branch creation failed!" >&2; return 1; }
    else
      echo "❌ Aborted: Branch '$branch' not created."
      return 1
    fi
  fi
}

unalias merge 2>/dev/null
merge() {
  local branch="$1"

  if [[ -z "$branch" ]]; then
    echo "❌ Error: No branch specified." >&2
    return 1
  fi

  echo "🚀 Merging '$branch' into '$(git rev-parse --abbrev-ref HEAD)'..."
  if ! git merge "$branch"; then
    echo "❌ Error: Git merge failed!" >&2
    return 1
  fi
}