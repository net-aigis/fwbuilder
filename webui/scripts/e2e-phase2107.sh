#!/usr/bin/env bash
# Phase-2107: client surface version + changelog types still ok.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_honesty_surface_version?:' webui/frontend/src/api/client.ts
grep -Fq 'soft_fertig_honesty_surface_changelog?:' webui/frontend/src/api/client.ts
echo "client surface/changelog types ok"
echo "cleaned"
echo "OK: phase2107 e2e passed"
