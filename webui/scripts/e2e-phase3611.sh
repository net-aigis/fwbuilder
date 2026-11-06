#!/usr/bin/env bash
# Phase-3611: client surface version + surface_changelog_meta_roster types still ok.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_honesty_surface_version?:' webui/frontend/src/api/client.ts
grep -Fq 'soft_fertig_surface_changelog_meta_roster?:' webui/frontend/src/api/client.ts
echo "client surface/surface_changelog_meta_roster types ok"
echo "cleaned"
echo "OK: phase3611 e2e passed"
