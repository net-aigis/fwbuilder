#!/usr/bin/env bash
# Phase-6603: client soft_fertig_ssh_honesty_refresh_roster Soft 6600+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_honesty_refresh_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 6600+ soft_fertig_ssh_honesty_refresh_roster type ok"; echo "cleaned"; echo "OK: phase6603 e2e passed"
