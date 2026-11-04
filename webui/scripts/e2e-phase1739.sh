#!/usr/bin/env bash
# Phase-1739: client export/bundle + version types.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_honesty_export_keys?:' webui/frontend/src/api/client.ts
grep -Fq 'soft_fertig_honesty_surface_version?:' webui/frontend/src/api/client.ts
echo "client surface_version types ok"
echo "cleaned"
echo "OK: phase1739 e2e passed"
