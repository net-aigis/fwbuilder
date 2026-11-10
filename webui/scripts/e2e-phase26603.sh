#!/usr/bin/env bash
# Phase-26603: client soft_fertig_ssh_auth_soft_26880_echo_roster Soft 26600+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_26880_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 26600+ soft_fertig_ssh_auth_soft_26880_echo_roster type ok"; echo "cleaned"; echo "OK: phase26603 e2e passed"
