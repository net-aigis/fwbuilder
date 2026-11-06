#!/usr/bin/env bash
# Phase-3596: STATUS mentions surface_changelog_meta_roster export / 3593-3600.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'surface_changelog_meta_roster.*(export|bundle)|Export.*surface_changelog_meta_roster' webui/STATUS.md
grep -qE 'phase3600|through 3600|e2e-phase3600' webui/STATUS.md
echo "STATUS surface_changelog_meta_roster export ok"
echo "cleaned"
echo "OK: phase3596 e2e passed"
