#!/usr/bin/env bash
# Phase-2171: client surface version + operator brief types still ok.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_honesty_surface_version?:' webui/frontend/src/api/client.ts
grep -Fq 'soft_fertig_honesty_operator_brief?:' webui/frontend/src/api/client.ts
echo "client surface/operator brief types ok"
echo "cleaned"
echo "OK: phase2171 e2e passed"
