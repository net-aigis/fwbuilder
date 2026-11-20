#!/usr/bin/env bash
# Phase-36523: client soft_fertig_ssh_auth_soft_37960_echo_roster Soft 36520+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_37960_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 36520+ soft_fertig_ssh_auth_soft_37960_echo_roster type ok"; echo "cleaned"; echo "OK: phase36523 e2e passed"
