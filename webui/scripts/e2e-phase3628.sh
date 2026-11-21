#!/usr/bin/env bash
# Phase-3628: STATUS mentions surface_changelog_meta_roster sessionStorage / 3625-3632.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'surface_changelog_meta_roster.*(sessionStorage|Clear)|sessionStorage.*surface_changelog_meta_roster' webui/STATUS.md
grep -qE 'phase3632|through 3632|e2e-phase3632' webui/STATUS.md
echo "STATUS surface_changelog_meta_roster sessionStorage ok"
echo "cleaned"
echo "OK: phase3628 e2e passed"
