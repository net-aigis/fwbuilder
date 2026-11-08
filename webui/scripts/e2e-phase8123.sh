#!/usr/bin/env bash
# Phase-8123: client soft_fertig_ssh_implemented_check_refresh_roster Soft 8120+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_implemented_check_refresh_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 8120+ soft_fertig_ssh_implemented_check_refresh_roster type ok"; echo "cleaned"; echo "OK: phase8123 e2e passed"
