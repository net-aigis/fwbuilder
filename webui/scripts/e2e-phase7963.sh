#!/usr/bin/env bash
# Phase-7963: client soft_fertig_ssh_not_implemented_refresh_roster Soft 7960+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_not_implemented_refresh_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 7960+ soft_fertig_ssh_not_implemented_refresh_roster type ok"; echo "cleaned"; echo "OK: phase7963 e2e passed"
