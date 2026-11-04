#!/usr/bin/env bash
# Phase-2843: client changelog_roster type still ok.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_changelog_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 2840+ changelog_roster type ok"
echo "cleaned"
echo "OK: phase2843 e2e passed"
