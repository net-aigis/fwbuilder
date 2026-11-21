#!/usr/bin/env bash
# Phase-1787: client export/bundle + summary types.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_honesty_export_keys?:' webui/frontend/src/api/client.ts
grep -Fq 'soft_fertig_catalog_summary?:' webui/frontend/src/api/client.ts
echo "client catalog_summary types ok"
echo "cleaned"
echo "OK: phase1787 e2e passed"
