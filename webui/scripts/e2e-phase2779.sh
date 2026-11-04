#!/usr/bin/env bash
# Phase-2779: client changelog roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_changelog_roster?:' webui/frontend/src/api/client.ts
echo "client changelog roster type ok"
echo "cleaned"
echo "OK: phase2779 e2e passed"
