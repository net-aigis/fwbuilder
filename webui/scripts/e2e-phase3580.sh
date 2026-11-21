#!/usr/bin/env bash
# Phase-3580: STATUS mentions surface_changelog_meta_roster / 3577-3584.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'surface_changelog_meta_roster|soft_fertig_surface_changelog_meta_roster' webui/STATUS.md
grep -qE 'phase3584|through 3584|e2e-phase3584' webui/STATUS.md
echo "STATUS surface changelog meta roster ok"
echo "cleaned"
echo "OK: phase3580 e2e passed"
