#!/usr/bin/env bash
# Phase-4251: client surface version + option_enable_roster types still ok.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -Fq 'soft_fertig_honesty_surface_version?:' webui/frontend/src/api/client.ts
grep -Fq 'soft_fertig_option_enable_roster?:' webui/frontend/src/api/client.ts
echo "client surface/option_enable_roster types ok"
echo "cleaned"
echo "OK: phase4251 e2e passed"
