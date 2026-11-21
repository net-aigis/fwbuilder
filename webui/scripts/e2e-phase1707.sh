#!/usr/bin/env bash
# Phase-1707: client export/bundle types still present.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_honesty_export_keys?:' webui/frontend/src/api/client.ts
grep -Fq 'soft_fertig_honesty_bundle_sections?:' webui/frontend/src/api/client.ts
echo "client export/bundle types ok"
echo "cleaned"
echo "OK: phase1707 e2e passed"
