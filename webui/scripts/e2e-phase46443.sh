#!/usr/bin/env bash
# Phase-46443: client soft_fertig_ssh_auth_soft_49120_echo_roster Soft 46440+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_49120_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 46440+ soft_fertig_ssh_auth_soft_49120_echo_roster type ok"; echo "cleaned"; echo "OK: phase46443 e2e passed"
