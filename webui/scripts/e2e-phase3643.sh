#!/usr/bin/env bash
# Phase-3643: client surface_changelog_meta_roster type still ok.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_surface_changelog_meta_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 3640+ surface_changelog_meta_roster type ok"
echo "cleaned"
echo "OK: phase3643 e2e passed"
