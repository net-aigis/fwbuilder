#!/usr/bin/env bash
# Publish dist/repo/ to the gh-pages branch (GitHub Pages).
#
# Live base: https://net-aigis.github.io/fwbuilder/
#   RPM:  https://net-aigis.github.io/fwbuilder/rpm
#   APT:  https://net-aigis.github.io/fwbuilder/apt
#
# Prereq: bash webui/scripts/publish-static-repo.sh
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"

REPO_SRC="${1:-$ROOT/dist/repo}"
test -d "$REPO_SRC/rpm" -o -d "$REPO_SRC/apt" || {
  echo "ERROR: $REPO_SRC incomplete — run publish-static-repo.sh first" >&2
  exit 1
}

PAGES_URL="${FWBWEB_PAGES_URL:-https://net-aigis.github.io/fwbuilder}"
OWNER_REPO="${FWBWEB_GH_REPO:-net-aigis/fwbuilder}"
STAGE=$(mktemp -d)
trap 'rm -rf "$STAGE"' EXIT

cp -a "$REPO_SRC"/. "$STAGE/"
# GitHub rejects blobs >100MB — keep tarball on Releases only, not Pages.
rm -rf "$STAGE/tarball"

# Rewrite install snippets with the live URL
mkdir -p "$STAGE/rpm" "$STAGE/apt"
cat >"$STAGE/rpm/fwbuilder-webui.repo" <<EOF
[fwbuilder-webui]
name=Firewall Builder WebUI
baseurl=${PAGES_URL}/rpm
enabled=1
gpgcheck=0
EOF

cat >"$STAGE/apt/fwbuilder-webui.list" <<EOF
deb [trusted=yes] ${PAGES_URL}/apt stable main
EOF

cat >"$STAGE/index.html" <<EOF
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <title>Firewall Builder WebUI packages</title>
  <style>
    body { font-family: system-ui, sans-serif; max-width: 42rem; margin: 2rem auto; padding: 0 1rem; line-height: 1.45; }
    code, pre { background: #f4f4f5; padding: 0.15em 0.35em; border-radius: 4px; }
    pre { padding: 0.75rem 1rem; overflow-x: auto; }
  </style>
</head>
<body>
  <h1>Firewall Builder WebUI — package repo</h1>
  <p>Static apt + rpm repository hosted on GitHub Pages.</p>
  <h2>RPM (openSUSE / Fedora)</h2>
  <pre>curl -fsSL ${PAGES_URL}/rpm/fwbuilder-webui.repo | sudo tee /etc/zypp/repos.d/fwbuilder-webui.repo
# Fedora/RHEL: use /etc/yum.repos.d/ instead
sudo zypper refresh && sudo zypper install fwbuilder-webui
# or: sudo dnf install fwbuilder-webui</pre>
  <h2>APT (Debian / Ubuntu)</h2>
  <pre>curl -fsSL ${PAGES_URL}/apt/fwbuilder-webui.list | sudo tee /etc/apt/sources.list.d/fwbuilder-webui.list
sudo apt update && sudo apt install fwbuilder-webui</pre>
  <p>Also see <a href="README.md">README.md</a> and
     <a href="https://github.com/${OWNER_REPO}/releases">GitHub Releases</a>
     (tarballs live on Releases — not on Pages).</p>
</body>
</html>
EOF

cat >"$STAGE/README.md" <<EOF
# Firewall Builder WebUI — live package repo

**Base URL:** ${PAGES_URL}

## RPM

\`\`\`bash
curl -fsSL ${PAGES_URL}/rpm/fwbuilder-webui.repo \\
  | sudo tee /etc/zypp/repos.d/fwbuilder-webui.repo
sudo zypper refresh && sudo zypper install fwbuilder-webui
\`\`\`

## APT

\`\`\`bash
curl -fsSL ${PAGES_URL}/apt/fwbuilder-webui.list \\
  | sudo tee /etc/apt/sources.list.d/fwbuilder-webui.list
sudo apt update && sudo apt install fwbuilder-webui
\`\`\`

Source: [net-aigis/fwbuilder](https://github.com/${OWNER_REPO})
EOF

# Disable Jekyll so apt dists/ paths are served as-is
touch "$STAGE/.nojekyll"

WORK=$(mktemp -d)
trap 'rm -rf "$STAGE" "$WORK"' EXIT
git clone --depth 1 "git@github.com:${OWNER_REPO}.git" "$WORK/fwbuilder" 2>/dev/null \
  || git clone --depth 1 "https://github.com/${OWNER_REPO}.git" "$WORK/fwbuilder"
cd "$WORK/fwbuilder"

GIT_SSH_COMMAND='ssh -F /dev/null -o IdentitiesOnly=yes -i ~/.ssh/id_rsa' \
  git fetch origin gh-pages:gh-pages 2>/dev/null || true

git checkout --orphan gh-pages-new
git rm -rf . >/dev/null 2>&1 || true
cp -a "$STAGE"/. .
git add -A
git -c user.email="$(git -C "$ROOT" config user.email 2>/dev/null || echo 'noreply@net-aigis')" \
    -c user.name="$(git -C "$ROOT" config user.name 2>/dev/null || echo 'fwbuilder-bot')" \
    commit -m "pages: publish WebUI static apt/yum repo"

GIT_SSH_COMMAND='ssh -F /dev/null -o IdentitiesOnly=yes -i ~/.ssh/id_rsa' \
  git push -f origin HEAD:gh-pages

# Enable GitHub Pages from gh-pages branch if not already
gh api -X POST "repos/${OWNER_REPO}/pages" \
  -f build_type=legacy \
  -f source[branch]=gh-pages \
  -f source[path]=/ 2>/dev/null \
  || gh api -X PUT "repos/${OWNER_REPO}/pages" \
       -f build_type=legacy \
       -f source[branch]=gh-pages \
       -f source[path]=/ 2>/dev/null \
  || true

echo "OK: pushed gh-pages"
echo "URL: ${PAGES_URL}/"
gh api "repos/${OWNER_REPO}/pages" --jq '{url:.html_url,status:.status,source:.source}' 2>/dev/null || true
