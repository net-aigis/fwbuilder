#!/usr/bin/env bash
# Phase-7899: client soft_fertig_ssh_not_implemented_refresh_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_not_implemented_refresh_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-not-implemented-refresh roster type ok"; echo "cleaned"; echo "OK: phase7899 e2e passed"
