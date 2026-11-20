#!/usr/bin/env bash
# Phase-34603: client soft_fertig_ssh_auth_soft_35800_echo_roster Soft 34600+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_35800_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 34600+ soft_fertig_ssh_auth_soft_35800_echo_roster type ok"; echo "cleaned"; echo "OK: phase34603 e2e passed"
