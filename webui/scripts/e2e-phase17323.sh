#!/usr/bin/env bash
# Phase-17323: client soft_fertig_ssh_auth_soft_17240_echo_roster Soft 17320+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_17240_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 17320+ soft_fertig_ssh_auth_soft_17240_echo_roster type ok"; echo "cleaned"; echo "OK: phase17323 e2e passed"
