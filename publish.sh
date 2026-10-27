#!/bin/bash
# Pushes index.html and README.md to GitHub (leo-mucho/wing4-gradient-tool, branch main).
# Vercel redeploys https://wing4-gradient-tool.vercel.app/ from that branch within a minute.
# Needs the GitHub CLI signed in once: gh auth login
set -e
cd "$(dirname "$0")"
REPO="leo-mucho/wing4-gradient-tool"
MSG="${1:-Update Split Gradient Studio}"
gh auth status >/dev/null 2>&1 || { echo "GitHub CLI is not signed in. Run: gh auth login"; exit 1; }
for f in index.html README.md; do
  remote_sha=$(gh api "repos/$REPO/contents/$f" --jq .sha 2>/dev/null || true)
  local_sha=$( (printf "blob %d\0" "$(wc -c < "$f")"; cat "$f") | shasum | cut -d' ' -f1)
  if [ "$remote_sha" = "$local_sha" ]; then echo "$f: unchanged"; continue; fi
  content=$(base64 < "$f" | tr -d '\n')
  if [ -n "$remote_sha" ]; then
    commit=$(gh api -X PUT "repos/$REPO/contents/$f" -f message="$MSG" -f content="$content" -f sha="$remote_sha" --jq '.commit.sha')
  else
    commit=$(gh api -X PUT "repos/$REPO/contents/$f" -f message="$MSG" -f content="$content" --jq '.commit.sha')
  fi
  echo "$f: pushed in commit ${commit:0:8}"
done
echo "Done. Vercel will redeploy in about a minute: https://wing4-gradient-tool.vercel.app/"
