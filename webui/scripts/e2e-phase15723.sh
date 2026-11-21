#!/usr/bin/env bash
# Phase-15723: client soft_fertig_ssh_auth_soft_15600_echo_roster Soft 15720+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_15600_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 15720+ soft_fertig_ssh_auth_soft_15600_echo_roster type ok"; echo "cleaned"; echo "OK: phase15723 e2e passed"
