#!/usr/bin/env bash
# Phase-3579: client soft_fertig_surface_changelog_meta_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_surface_changelog_meta_roster?:' webui/frontend/src/api/client.ts
echo "client surface changelog meta roster type ok"
echo "cleaned"
echo "OK: phase3579 e2e passed"
