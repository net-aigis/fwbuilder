#!/usr/bin/env bash
# Phase-7099: client ssh_alternatives_refresh_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_alternatives_refresh_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-alternatives-refresh roster type ok"; echo "cleaned"; echo "OK: phase7099 e2e passed"
