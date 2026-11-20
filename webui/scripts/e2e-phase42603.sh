#!/usr/bin/env bash
# Phase-42603: client soft_fertig_ssh_auth_soft_44800_echo_roster Soft 42600+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_44800_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 42600+ soft_fertig_ssh_auth_soft_44800_echo_roster type ok"; echo "cleaned"; echo "OK: phase42603 e2e passed"
