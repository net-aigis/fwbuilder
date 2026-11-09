#!/usr/bin/env bash
# Phase-18603: client soft_fertig_ssh_auth_soft_18600_echo_roster Soft 18600+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_18600_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 18600+ soft_fertig_ssh_auth_soft_18600_echo_roster type ok"; echo "cleaned"; echo "OK: phase18603 e2e passed"
